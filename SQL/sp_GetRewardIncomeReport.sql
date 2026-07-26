IF OBJECT_ID('dbo.sp_GetRewardIncomeReport', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_GetRewardIncomeReport;
GO

CREATE PROCEDURE dbo.sp_GetRewardIncomeReport
    @fromdate    NVARCHAR(50) = NULL,
    @todate      NVARCHAR(50) = NULL,
    @AssociateId NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    /*
      Reward Income Report (Power / Weaker Leg plan)
      - Uses LevelNo achieved in closing
      - Shows PowerLeg / WeakerLeg / Matching from RewardLevelAchievementDetail
      - No self-business eligibility filter
      - RewardName from RewardLevelMaster
    */

    SELECT
        cd.AssociateId,
        ud.associatename,
        cd.FromDate,
        cd.ToDate,
        cd.MentionDate,
        ISNULL(NULLIF(cd.MatchingBusiness, 0),
            ISNULL(NULLIF(cd.TeamBusiness, 0), 0)) AS TeamBusiness,
        ISNULL(cd.SelfBusiness, 0) AS SelfBusiness,
        ISNULL(cd.PowerLegBusiness, 0) AS PowerLegBusiness,
        ISNULL(cd.RemainingBusiness, 0) AS WeakerLegBusiness,
        cd.LevelNo AS AchievedLevelNo,
        rl.LevelNo,
        rl.LevelName,
        rl.Business AS TargetBusiness,
        rl.RewardName
    FROM RewardLevelAchievementDetail cd WITH (NOLOCK)
    LEFT JOIN associatedetail ud WITH (NOLOCK) ON cd.AssociateId = ud.AssociateId
    INNER JOIN RewardLevelMaster rl WITH (NOLOCK) ON rl.LevelNo = cd.LevelNo
    WHERE (@fromdate IS NULL OR LTRIM(RTRIM(@fromdate)) = '' OR CONVERT(DATE, cd.FromDate) = CONVERT(DATE, @fromdate))
      AND (@todate IS NULL OR LTRIM(RTRIM(@todate)) = '' OR CONVERT(DATE, cd.ToDate) = CONVERT(DATE, @todate))
      AND (@AssociateId IS NULL OR LTRIM(RTRIM(@AssociateId)) = '' OR cd.AssociateId = @AssociateId)
    ORDER BY cd.ToDate DESC, rl.Business DESC, cd.AssociateId DESC;
END
GO
