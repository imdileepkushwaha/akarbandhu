-- Jeevan Bhumi Bonus Plan: Coupon & Cashback Voucher tables
-- Run this script once on www_akarbandhu_db

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.JeevanBhumiCouponDetail') AND type = N'U')
BEGIN
    CREATE TABLE dbo.JeevanBhumiCouponDetail
    (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        CouponNo NVARCHAR(50) NOT NULL UNIQUE,
        BookingId NVARCHAR(50) NULL,
        AccountNo NVARCHAR(50) NULL,
        UserId NVARCHAR(50) NULL,
        UserName NVARCHAR(200) NULL,
        AssociateId NVARCHAR(50) NULL,
        AssociateName NVARCHAR(200) NULL,
        AssociateMobile NVARCHAR(50) NULL,
        PlotId NVARCHAR(50) NULL,
        PlotArea DECIMAL(18,2) NULL,
        PlotAmount DECIMAL(18,2) NULL,
        CouponAmount DECIMAL(18,2) NULL,
        BookingDate DATETIME NULL,
        QRText NVARCHAR(1000) NULL,
        MentionBy NVARCHAR(50) NULL,
        MentionDate DATETIME NOT NULL DEFAULT GETDATE()
    );
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.JeevanBhumiCashbackVoucher') AND type = N'U')
BEGIN
    CREATE TABLE dbo.JeevanBhumiCashbackVoucher
    (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        VoucherNo NVARCHAR(50) NOT NULL UNIQUE,
        BookingId NVARCHAR(50) NULL,
        AccountNo NVARCHAR(50) NULL,
        UserId NVARCHAR(50) NULL,
        UserName NVARCHAR(200) NULL,
        AssociateId NVARCHAR(50) NULL,
        AssociateName NVARCHAR(200) NULL,
        AssociateMobile NVARCHAR(50) NULL,
        PlotId NVARCHAR(50) NULL,
        PlotArea DECIMAL(18,2) NULL,
        PlotAmount DECIMAL(18,2) NULL,
        VoucherNo_Seq INT NULL,
        VoucherDate DATETIME NULL,
        CommissionPercent DECIMAL(18,2) NULL,
        CashbackAmount DECIMAL(18,2) NULL,
        BookingDate DATETIME NULL,
        QRText NVARCHAR(1000) NULL,
        MentionBy NVARCHAR(50) NULL,
        MentionDate DATETIME NOT NULL DEFAULT GETDATE()
    );

    CREATE INDEX IX_JeevanBhumiCashbackVoucher_AccountNo
        ON dbo.JeevanBhumiCashbackVoucher(AccountNo);
END
GO
