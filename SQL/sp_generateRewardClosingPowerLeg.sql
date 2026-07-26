IF OBJECT_ID('dbo.sp_generateRewardClosingPowerLeg', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_generateRewardClosingPowerLeg;
GO

CREATE PROCEDURE dbo.sp_generateRewardClosingPowerLeg
    @fromdate DATETIME,
    @todate   DATETIME
AS
BEGIN
    /*
      Reward Closing - Power Leg / Weaker Leg (incremental period business)

      Rules:
      1) Power leg (strongest direct line) >= 60% of rank target
      2) Weaker legs (all other directs combined) >= 40% of rank target
      3) Only NEW business in [@fromdate, @todate] counts (not lifetime accumulate)
      4) Closing intended twice a month: 1-15 and 16-month-end
      5) One achievement per associate+level forever
      Note: Self business is stored for display only — NOT used as eligibility filter
    */

    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    BEGIN TRY
        IF EXISTS (
            SELECT 1
            FROM RewardClosingDateDetail WITH (NOLOCK)
            WHERE CONVERT(DATE, FromDate) = CONVERT(DATE, @fromdate)
        )
        BEGIN
            SELECT 'f' AS Result;
            COMMIT TRANSACTION;
            RETURN;
        END

        DECLARE @FromD DATE = CONVERT(DATE, @fromdate);
        DECLARE @ToD   DATE = CONVERT(DATE, @todate);

        /* Period payments: booking sponsor + amount in date range */
        IF OBJECT_ID('tempdb..#PeriodPay') IS NOT NULL DROP TABLE #PeriodPay;
        SELECT
            bd.SponserId AS AssociateId,
            ISNULL(SUM(ISNULL(pd.instamt, 0)), 0) AS BusinessAmt
        INTO #PeriodPay
        FROM bookingdetail bd WITH (NOLOCK)
        INNER JOIN paymentdetail pd WITH (NOLOCK) ON pd.AccountNo = bd.AccountNo
        WHERE CONVERT(DATE, pd.paymentdate) >= @FromD
          AND CONVERT(DATE, pd.paymentdate) <= @ToD
        GROUP BY bd.SponserId;

        CREATE CLUSTERED INDEX IX_PeriodPay ON #PeriodPay (AssociateId);

        /* All associates active till closing (self business only for display) */
        IF OBJECT_ID('tempdb..#Assoc') IS NOT NULL DROP TABLE #Assoc;
        SELECT
            a.AssociateId,
            ISNULL(p.BusinessAmt, 0) AS SelfBusiness
        INTO #Assoc
        FROM AssociateDetail a WITH (NOLOCK)
        LEFT JOIN #PeriodPay p ON p.AssociateId = a.AssociateId
        WHERE CONVERT(DATE, a.MentionDate) <= @ToD;

        CREATE CLUSTERED INDEX IX_Assoc ON #Assoc (AssociateId);

        /* Direct-line period business via ParentAssociateId tree */
        IF OBJECT_ID('tempdb..#DirectLineBiz') IS NOT NULL DROP TABLE #DirectLineBiz;
        CREATE TABLE #DirectLineBiz
        (
            RootAssociateId NVARCHAR(100) NOT NULL,
            DirectId NVARCHAR(100) NOT NULL,
            BusinessAmt DECIMAL(18,2) NOT NULL
        );

        DECLARE @root NVARCHAR(100);
        DECLARE @direct NVARCHAR(100);

        DECLARE cur_root CURSOR LOCAL STATIC FOR
            SELECT AssociateId FROM #Assoc;

        OPEN cur_root;
        FETCH NEXT FROM cur_root INTO @root;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            DECLARE cur_dir CURSOR LOCAL STATIC FOR
                SELECT AssociateId
                FROM AssociateDetail WITH (NOLOCK)
                WHERE SponserId = @root;

            OPEN cur_dir;
            FETCH NEXT FROM cur_dir INTO @direct;

            WHILE @@FETCH_STATUS = 0
            BEGIN
                DECLARE @lineBiz DECIMAL(18,2) = 0;

                ;WITH Tree AS
                (
                    SELECT AssociateId
                    FROM AssociateDetail WITH (NOLOCK)
                    WHERE AssociateId = @direct

                    UNION ALL

                    SELECT c.AssociateId
                    FROM AssociateDetail c WITH (NOLOCK)
                    INNER JOIN Tree t ON c.ParentAssociateId = t.AssociateId
                    WHERE c.AssociateId <> @direct
                )
                SELECT @lineBiz = ISNULL(SUM(ISNULL(p.BusinessAmt, 0)), 0)
                FROM Tree t
                LEFT JOIN #PeriodPay p ON p.AssociateId = t.AssociateId
                OPTION (MAXRECURSION 0);

                INSERT INTO #DirectLineBiz (RootAssociateId, DirectId, BusinessAmt)
                VALUES (@root, @direct, @lineBiz);

                FETCH NEXT FROM cur_dir INTO @direct;
            END

            CLOSE cur_dir;
            DEALLOCATE cur_dir;

            FETCH NEXT FROM cur_root INTO @root;
        END

        CLOSE cur_root;
        DEALLOCATE cur_root;

        /* Power / Weaker per associate */
        IF OBJECT_ID('tempdb..#LegBiz') IS NOT NULL DROP TABLE #LegBiz;
        SELECT
            d.RootAssociateId AS AssociateId,
            MAX(d.BusinessAmt) AS PowerLegBusiness,
            (
                SELECT ISNULL(SUM(d2.BusinessAmt), 0)
                FROM #DirectLineBiz d2
                WHERE d2.RootAssociateId = d.RootAssociateId
                  AND d2.DirectId <>
                  (
                      SELECT TOP 1 d3.DirectId
                      FROM #DirectLineBiz d3
                      WHERE d3.RootAssociateId = d.RootAssociateId
                      ORDER BY d3.BusinessAmt DESC, d3.DirectId
                  )
            ) AS WeakerLegBusiness
        INTO #LegBiz
        FROM #DirectLineBiz d
        GROUP BY d.RootAssociateId;

        /* Qualify highest rank: Power >= 60% target, Weaker >= 40% target */
        IF OBJECT_ID('tempdb..#Qualified') IS NOT NULL DROP TABLE #Qualified;
        SELECT
            a.AssociateId,
            a.SelfBusiness,
            l.PowerLegBusiness,
            l.WeakerLegBusiness,
            CASE
                WHEN l.PowerLegBusiness <= l.WeakerLegBusiness THEN l.PowerLegBusiness
                ELSE l.WeakerLegBusiness
            END AS MatchingBusiness,
            q.LevelNo,
            q.Business AS TargetBusiness
        INTO #Qualified
        FROM #Assoc a
        INNER JOIN #LegBiz l ON l.AssociateId = a.AssociateId
        CROSS APPLY
        (
            SELECT TOP 1
                rl.LevelNo,
                rl.Business
            FROM RewardLevelMaster rl WITH (NOLOCK)
            WHERE l.PowerLegBusiness >= (ISNULL(rl.Business, 0) * 0.60)
              AND l.WeakerLegBusiness >= (ISNULL(rl.Business, 0) * 0.40)
            ORDER BY ISNULL(rl.Business, 0) DESC, rl.LevelNo DESC
        ) q;

        INSERT INTO RewardLevelAchievementDetail
        (
            FromDate,
            ToDate,
            AssociateId,
            TotalBooking,
            MentionBy,
            MentionDate,
            LevelNo,
            SelfBusiness,
            TeamBusiness,
            PowerLegBusiness,
            RemainingBusiness,
            MatchingBusiness
        )
        SELECT
            @fromdate,
            @todate,
            q.AssociateId,
            NULL,
            'admin',
            GETDATE(),
            q.LevelNo,
            q.SelfBusiness,
            (q.PowerLegBusiness + q.WeakerLegBusiness),
            q.PowerLegBusiness,
            q.WeakerLegBusiness,
            q.MatchingBusiness
        FROM #Qualified q
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM RewardLevelAchievementDetail x WITH (NOLOCK)
            WHERE x.AssociateId = q.AssociateId
              AND x.LevelNo = q.LevelNo
        );

        INSERT INTO RewardClosingDateDetail (FromDate, ToDate, MentionBy, MentionDate)
        VALUES (@fromdate, @todate, 'admin', GETDATE());

        SELECT 't' AS Result;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF CURSOR_STATUS('local', 'cur_dir') >= 0
        BEGIN
            CLOSE cur_dir;
            DEALLOCATE cur_dir;
        END
        IF CURSOR_STATUS('local', 'cur_root') >= 0
        BEGIN
            CLOSE cur_root;
            DEALLOCATE cur_root;
        END

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        INSERT INTO ErrorLog (procedurename, errormessage, entrydate, errorline)
        VALUES ('sp_generateRewardClosingPowerLeg', ERROR_MESSAGE(), GETDATE(), ERROR_LINE());

        SELECT '0' AS Result;
    END CATCH
END
GO
