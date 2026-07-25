/*
  Upsert RewardLevelMaster for Power/Weaker Leg plan (reward chart).
  Business = incremental "Next" matching target for that rank.
  Note: Target column is INT — only set when Business fits in INT range.
*/

;WITH Src AS
(
    SELECT * FROM (VALUES
        (1,  N'Star',                         CAST(500000 AS DECIMAL(18,2)),      N'STAR KIT or 10000'),
        (2,  N'Sales Executive',              CAST(1000000 AS DECIMAL(18,2)),     N'MOBILE or 25000'),
        (3,  N'Senior Sales Executive',       CAST(2500000 AS DECIMAL(18,2)),     N'LAPTOP or 50000'),
        (4,  N'Sales Advisor',                CAST(5000000 AS DECIMAL(18,2)),     N'BIKE or 100000'),
        (5,  N'Senior Sales Advisor',         CAST(10000000 AS DECIMAL(18,2)),    N'ALTO or 250000'),
        (6,  N'Sales Manager',                CAST(25000000 AS DECIMAL(18,2)),    N'HONDA CITY or 500000'),
        (7,  N'Senior Sales Manager',         CAST(50000000 AS DECIMAL(18,2)),    N'SCORPIO or 1000000'),
        (8,  N'Business Development Manager', CAST(100000000 AS DECIMAL(18,2)),   N'FORTUNER or 2500000'),
        (9,  N'Dy. Chief Manager',            CAST(250000000 AS DECIMAL(18,2)),   N'2 BHK FLAT or 5000000'),
        (10, N'Chief Manager',                CAST(500000000 AS DECIMAL(18,2)),   N'MERCEDES or 10000000'),
        (11, N'Dy. General Manager',          CAST(1000000000 AS DECIMAL(18,2)),  N'BUNGLOW or 25000000'),
        (12, N'General Manager',              CAST(2500000000 AS DECIMAL(18,2)),  N'VILLA or 50000000'),
        (13, N'Advisory Board Member',        CAST(5000000000 AS DECIMAL(18,2)),  N'FARM HOUSE or 100000000'),
        (14, N'The Board of Director',        CAST(10000000000 AS DECIMAL(18,2)), N'RESORT or 250000000')
    ) v(LevelNo, LevelName, Business, RewardName)
)
MERGE RewardLevelMaster AS t
USING Src AS s
ON t.LevelNo = s.LevelNo
WHEN MATCHED THEN
    UPDATE SET
        t.LevelName = s.LevelName,
        t.Business = s.Business,
        t.TeamBusiness = s.Business,
        t.RewardName = s.RewardName,
        t.Target = CASE WHEN s.Business <= 2147483647 THEN CAST(s.Business AS INT) ELSE t.Target END
WHEN NOT MATCHED THEN
    INSERT (LevelNo, LevelName, Business, TeamBusiness, RewardName, Income, Target)
    VALUES (
        s.LevelNo,
        s.LevelName,
        s.Business,
        s.Business,
        s.RewardName,
        0,
        CASE WHEN s.Business <= 2147483647 THEN CAST(s.Business AS INT) ELSE 0 END
    );

-- Verify:
-- SELECT LevelNo, LevelName, Business, RewardName FROM RewardLevelMaster ORDER BY LevelNo;
GO
