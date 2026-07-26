using System;
using System.Data;
using System.Data.SqlClient;
using DataTier;

namespace BusinessLogicTier
{
    public class clsJeevanBhumi
    {
        Data ObjData = new Data();

        public string AssociateId { get; set; }
        public string AccountNo { get; set; }
        public string BookingId { get; set; }
        public string UserId { get; set; }
        public string MentionBy { get; set; }
        public string VerifyBaseUrl { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
        public decimal PlotAreaFilter { get; set; }

        private static readonly decimal[] CommissionPercents = { 10m, 10m, 10m, 10m, 10m, 10m, 10m, 30m };

        public DataTable getAssociateListForBonus()
        {
            string str_query = @"
SELECT DISTINCT ad.AssociateId, ad.AssociateName,
       ad.AssociateId + ' - ' + ISNULL(ad.AssociateName,'') AS DisplayName
FROM BookingDetail bd WITH (NOLOCK)
LEFT JOIN PlotDetail pd WITH (NOLOCK) ON bd.PlotId = pd.PlotId
LEFT JOIN AssociateDetail ad WITH (NOLOCK) ON bd.SponserId = ad.AssociateId
WHERE CAST(ISNULL(pd.LandArea, bd.LandArea) AS DECIMAL(18,2)) IN (10,25,50,100)
  AND ISNULL(bd.SponserId,'') <> ''
  AND (
        NOT EXISTS (SELECT 1 FROM JeevanBhumiCouponDetail c WITH (NOLOCK) WHERE c.AccountNo = bd.AccountNo)
     OR NOT EXISTS (SELECT 1 FROM JeevanBhumiCashbackVoucher v WITH (NOLOCK) WHERE v.AccountNo = bd.AccountNo)
      )
ORDER BY ad.AssociateName";

            return RunQuery(str_query);
        }

        public DataTable getPendingBonusBookings(clsJeevanBhumi obj)
        {
            string str_query = @"
SELECT bd.BookingId, bd.AccountNo, bd.UserId, ISNULL(ud.UserName,'') AS UserName,
       CONVERT(VARCHAR, bd.BookingDate, 103) AS BookingDateText, bd.BookingDate,
       CAST(ISNULL(pd.LandArea, bd.LandArea) AS DECIMAL(18,2)) AS PlotArea,
       bd.PlotAmount, bd.PlotId, bd.SponserId AS AssociateId,
       ISNULL(ad.AssociateName,'') AS AssociateName, ISNULL(ad.Mobile,'') AS AssociateMobile,
       CASE WHEN EXISTS (SELECT 1 FROM JeevanBhumiCouponDetail c WITH (NOLOCK) WHERE c.AccountNo = bd.AccountNo)
            THEN 1 ELSE 0 END AS IsCouponGenerated,
       CASE WHEN EXISTS (SELECT 1 FROM JeevanBhumiCashbackVoucher v WITH (NOLOCK) WHERE v.AccountNo = bd.AccountNo)
            THEN 1 ELSE 0 END AS IsVoucherGenerated
FROM BookingDetail bd WITH (NOLOCK)
LEFT JOIN PlotDetail pd WITH (NOLOCK) ON bd.PlotId = pd.PlotId
LEFT JOIN UserDetail ud WITH (NOLOCK) ON bd.UserId = ud.UserId
LEFT JOIN AssociateDetail ad WITH (NOLOCK) ON bd.SponserId = ad.AssociateId
WHERE CAST(ISNULL(pd.LandArea, bd.LandArea) AS DECIMAL(18,2)) IN (10,25,50,100)
  AND (
        NOT EXISTS (SELECT 1 FROM JeevanBhumiCouponDetail c WITH (NOLOCK) WHERE c.AccountNo = bd.AccountNo)
     OR NOT EXISTS (SELECT 1 FROM JeevanBhumiCashbackVoucher v WITH (NOLOCK) WHERE v.AccountNo = bd.AccountNo)
      ) ";

            if (!string.IsNullOrEmpty(obj.AssociateId) && obj.AssociateId != "0")
            {
                str_query += " AND bd.SponserId = '" + Escape(obj.AssociateId) + "' ";
            }
            if (obj.PlotAreaFilter > 0)
            {
                str_query += " AND CAST(ISNULL(pd.LandArea, bd.LandArea) AS DECIMAL(18,2)) = " + obj.PlotAreaFilter + " ";
            }

            str_query += " ORDER BY bd.BookingDate DESC";
            return RunQuery(str_query);
        }

        public DataTable getBookingForGenerate(clsJeevanBhumi obj)
        {
            string str_query = @"
SELECT TOP 1 bd.BookingId, bd.AccountNo, bd.UserId, ISNULL(ud.UserName,'') AS UserName,
       bd.BookingDate, CAST(ISNULL(pd.LandArea, bd.LandArea) AS DECIMAL(18,2)) AS PlotArea,
       bd.PlotAmount, bd.PlotId, bd.SponserId AS AssociateId,
       ISNULL(ad.AssociateName,'') AS AssociateName, ISNULL(ad.Mobile,'') AS AssociateMobile
FROM BookingDetail bd WITH (NOLOCK)
LEFT JOIN PlotDetail pd WITH (NOLOCK) ON bd.PlotId = pd.PlotId
LEFT JOIN UserDetail ud WITH (NOLOCK) ON bd.UserId = ud.UserId
LEFT JOIN AssociateDetail ad WITH (NOLOCK) ON bd.SponserId = ad.AssociateId
WHERE bd.AccountNo = '" + Escape(obj.AccountNo) + @"'
  AND CAST(ISNULL(pd.LandArea, bd.LandArea) AS DECIMAL(18,2)) IN (10,25,50,100)";
            return RunQuery(str_query);
        }

        public string CreateCoupon(clsJeevanBhumi obj)
        {
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                DataTable dtCheck = ObjData.RunSelectQueryTTrans(
                    "SELECT Id FROM JeevanBhumiCouponDetail WITH (NOLOCK) WHERE AccountNo='" + Escape(obj.AccountNo) + "'", tr);
                if (dtCheck != null && dtCheck.Rows.Count > 0)
                {
                    res = "f";
                    tr.Rollback();
                    return res;
                }

                DataTable dt = getBookingForGenerateTrans(obj.AccountNo, tr);
                if (dt == null || dt.Rows.Count == 0)
                {
                    res = "n";
                    tr.Rollback();
                    return res;
                }

                DataRow r = dt.Rows[0];
                string couponNo = "JBCP" + DateTime.Now.ToString("yyMMddHHmmss") + new Random().Next(100, 999);
                string associateId = Convert.ToString(r["AssociateId"]);
                string associateName = Convert.ToString(r["AssociateName"]);
                string associateMobile = Convert.ToString(r["AssociateMobile"]);
                decimal plotArea = Convert.ToDecimal(r["PlotArea"]);
                decimal plotAmount = Convert.ToDecimal(r["PlotAmount"]);
                string verifyUrl = (obj.VerifyBaseUrl ?? "").TrimEnd('/') + "/VerifyBonus.aspx?type=C&code=" + couponNo;
                string qrText = "AKAR BANDHU PVT LTD | Genuine Coupon | CouponNo:" + couponNo
                    + " | AssociateId:" + associateId
                    + " | Name:" + associateName
                    + " | Mobile:" + associateMobile
                    + " | PlotArea:" + plotArea
                    + " | PlotAmount:" + plotAmount
                    + " | Verify:" + verifyUrl;

                string insert = @"
INSERT INTO JeevanBhumiCouponDetail
(CouponNo, BookingId, AccountNo, UserId, UserName, AssociateId, AssociateName, AssociateMobile,
 PlotId, PlotArea, PlotAmount, CouponAmount, BookingDate, QRText, MentionBy, MentionDate)
VALUES
('" + Escape(couponNo) + @"',
 '" + Escape(Convert.ToString(r["BookingId"])) + @"',
 '" + Escape(Convert.ToString(r["AccountNo"])) + @"',
 '" + Escape(Convert.ToString(r["UserId"])) + @"',
 '" + Escape(Convert.ToString(r["UserName"])) + @"',
 '" + Escape(associateId) + @"',
 '" + Escape(associateName) + @"',
 '" + Escape(associateMobile) + @"',
 '" + Escape(Convert.ToString(r["PlotId"])) + @"',
 " + plotArea + @",
 " + plotAmount + @",
 " + plotAmount + @",
 '" + Convert.ToDateTime(r["BookingDate"]).ToString("yyyy-MM-dd HH:mm:ss") + @"',
 '" + Escape(qrText) + @"',
 '" + Escape(obj.MentionBy) + @"',
 GETDATE())";

                ObjData.RunInsUpDelQueryTrans(insert, tr);
                tr.Commit();
                res = couponNo;
            }
            catch
            {
                res = "0";
                try { tr.Rollback(); } catch { }
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string CreateCashbackVouchers(clsJeevanBhumi obj)
        {
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                DataTable dtCheck = ObjData.RunSelectQueryTTrans(
                    "SELECT Id FROM JeevanBhumiCashbackVoucher WITH (NOLOCK) WHERE AccountNo='" + Escape(obj.AccountNo) + "'", tr);
                if (dtCheck != null && dtCheck.Rows.Count > 0)
                {
                    res = "f";
                    tr.Rollback();
                    return res;
                }

                DataTable dt = getBookingForGenerateTrans(obj.AccountNo, tr);
                if (dt == null || dt.Rows.Count == 0)
                {
                    res = "n";
                    tr.Rollback();
                    return res;
                }

                DataRow r = dt.Rows[0];
                DateTime bookingDate = Convert.ToDateTime(r["BookingDate"]);
                string associateId = Convert.ToString(r["AssociateId"]);
                string associateName = Convert.ToString(r["AssociateName"]);
                string associateMobile = Convert.ToString(r["AssociateMobile"]);
                decimal plotArea = Convert.ToDecimal(r["PlotArea"]);
                decimal plotAmount = Convert.ToDecimal(r["PlotAmount"]);
                string batch = DateTime.Now.ToString("yyMMddHHmmss") + new Random().Next(10, 99);

                for (int i = 0; i < 8; i++)
                {
                    int seq = i + 1;
                    DateTime voucherDate = bookingDate.AddMonths(6 * seq);
                    decimal percent = CommissionPercents[i];
                    decimal cashback = Math.Round(plotAmount * percent / 100m, 2);
                    string voucherNo = "JBCB" + batch + seq.ToString("00");
                    string verifyUrl = (obj.VerifyBaseUrl ?? "").TrimEnd('/') + "/VerifyBonus.aspx?type=V&code=" + voucherNo;
                    string qrText = "AKAR BANDHU PVT LTD | Genuine Cashback Voucher | VoucherNo:" + voucherNo
                        + " | AssociateId:" + associateId
                        + " | Name:" + associateName
                        + " | Mobile:" + associateMobile
                        + " | PlotArea:" + plotArea
                        + " | PlotAmount:" + plotAmount
                        + " | Commission:" + percent + "%"
                        + " | Cashback:" + cashback
                        + " | VoucherDate:" + voucherDate.ToString("dd/MM/yyyy")
                        + " | Verify:" + verifyUrl;

                    string insert = @"
INSERT INTO JeevanBhumiCashbackVoucher
(VoucherNo, BookingId, AccountNo, UserId, UserName, AssociateId, AssociateName, AssociateMobile,
 PlotId, PlotArea, PlotAmount, VoucherNo_Seq, VoucherDate, CommissionPercent, CashbackAmount,
 BookingDate, QRText, MentionBy, MentionDate)
VALUES
('" + Escape(voucherNo) + @"',
 '" + Escape(Convert.ToString(r["BookingId"])) + @"',
 '" + Escape(Convert.ToString(r["AccountNo"])) + @"',
 '" + Escape(Convert.ToString(r["UserId"])) + @"',
 '" + Escape(Convert.ToString(r["UserName"])) + @"',
 '" + Escape(associateId) + @"',
 '" + Escape(associateName) + @"',
 '" + Escape(associateMobile) + @"',
 '" + Escape(Convert.ToString(r["PlotId"])) + @"',
 " + plotArea + @",
 " + plotAmount + @",
 " + seq + @",
 '" + voucherDate.ToString("yyyy-MM-dd HH:mm:ss") + @"',
 " + percent + @",
 " + cashback + @",
 '" + bookingDate.ToString("yyyy-MM-dd HH:mm:ss") + @"',
 '" + Escape(qrText) + @"',
 '" + Escape(obj.MentionBy) + @"',
 GETDATE())";

                    ObjData.RunInsUpDelQueryTrans(insert, tr);
                }

                tr.Commit();
                res = "t";
            }
            catch
            {
                res = "0";
                try { tr.Rollback(); } catch { }
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public DataTable getCouponByNo(string couponNo)
        {
            string str_query = "SELECT * FROM JeevanBhumiCouponDetail WITH (NOLOCK) WHERE CouponNo='" + Escape(couponNo) + "'";
            return RunQuery(str_query);
        }

        public DataTable getCouponByAccount(string accountNo)
        {
            string str_query = "SELECT * FROM JeevanBhumiCouponDetail WITH (NOLOCK) WHERE AccountNo='" + Escape(accountNo) + "'";
            return RunQuery(str_query);
        }

        public DataTable getVoucherByNo(string voucherNo)
        {
            string str_query = "SELECT * FROM JeevanBhumiCashbackVoucher WITH (NOLOCK) WHERE VoucherNo='" + Escape(voucherNo) + "'";
            return RunQuery(str_query);
        }

        public DataTable getVouchersByAccount(string accountNo)
        {
            string str_query = @"SELECT *, CONVERT(VARCHAR, VoucherDate, 103) AS VoucherDateText,
CONVERT(VARCHAR, BookingDate, 103) AS BookingDateText, CONVERT(VARCHAR, MentionDate, 103) AS MentionDateText
FROM JeevanBhumiCashbackVoucher WITH (NOLOCK)
WHERE AccountNo='" + Escape(accountNo) + "' ORDER BY VoucherNo_Seq";
            return RunQuery(str_query);
        }

        public DataTable getGeneratedReport(clsJeevanBhumi obj)
        {
            string str_query = @"
SELECT 'Coupon' AS DocType, c.CouponNo AS DocNo, c.AccountNo, c.UserId, c.UserName,
       c.AssociateId, c.AssociateName, c.AssociateMobile, c.PlotArea, c.PlotAmount,
       c.CouponAmount AS Amount, NULL AS CommissionPercent, NULL AS VoucherDate,
       CONVERT(VARCHAR, c.BookingDate, 103) AS BookingDateText,
       CONVERT(VARCHAR, c.MentionDate, 103) AS MentionDateText, c.MentionBy
FROM JeevanBhumiCouponDetail c WITH (NOLOCK)
WHERE 1=1 ";

            if (!string.IsNullOrEmpty(obj.AssociateId))
                str_query += " AND c.AssociateId='" + Escape(obj.AssociateId) + "' ";
            if (!string.IsNullOrEmpty(obj.UserId))
                str_query += " AND c.UserId='" + Escape(obj.UserId) + "' ";
            if (!string.IsNullOrEmpty(obj.AccountNo))
                str_query += " AND c.AccountNo='" + Escape(obj.AccountNo) + "' ";
            if (obj.FromDate != DateTime.MinValue && obj.ToDate != DateTime.MinValue)
                str_query += " AND c.MentionDate >= '" + obj.FromDate.ToString("yyyy-MM-dd") + "' AND c.MentionDate < DATEADD(day,1,'" + obj.ToDate.ToString("yyyy-MM-dd") + "') ";

            str_query += @"
UNION ALL
SELECT 'Cashback Voucher' AS DocType, v.VoucherNo AS DocNo, v.AccountNo, v.UserId, v.UserName,
       v.AssociateId, v.AssociateName, v.AssociateMobile, v.PlotArea, v.PlotAmount,
       v.CashbackAmount AS Amount, v.CommissionPercent, CONVERT(VARCHAR, v.VoucherDate, 103) AS VoucherDate,
       CONVERT(VARCHAR, v.BookingDate, 103) AS BookingDateText,
       CONVERT(VARCHAR, v.MentionDate, 103) AS MentionDateText, v.MentionBy
FROM JeevanBhumiCashbackVoucher v WITH (NOLOCK)
WHERE 1=1 ";

            if (!string.IsNullOrEmpty(obj.AssociateId))
                str_query += " AND v.AssociateId='" + Escape(obj.AssociateId) + "' ";
            if (!string.IsNullOrEmpty(obj.UserId))
                str_query += " AND v.UserId='" + Escape(obj.UserId) + "' ";
            if (!string.IsNullOrEmpty(obj.AccountNo))
                str_query += " AND v.AccountNo='" + Escape(obj.AccountNo) + "' ";
            if (obj.FromDate != DateTime.MinValue && obj.ToDate != DateTime.MinValue)
                str_query += " AND v.MentionDate >= '" + obj.FromDate.ToString("yyyy-MM-dd") + "' AND v.MentionDate < DATEADD(day,1,'" + obj.ToDate.ToString("yyyy-MM-dd") + "') ";

            str_query += " ORDER BY MentionDateText DESC, DocType, DocNo";
            return RunQuery(str_query);
        }

        private DataTable getBookingForGenerateTrans(string accountNo, SqlTransaction tr)
        {
            string str_query = @"
SELECT TOP 1 bd.BookingId, bd.AccountNo, bd.UserId, ISNULL(ud.UserName,'') AS UserName,
       bd.BookingDate, CAST(ISNULL(pd.LandArea, bd.LandArea) AS DECIMAL(18,2)) AS PlotArea,
       bd.PlotAmount, bd.PlotId, bd.SponserId AS AssociateId,
       ISNULL(ad.AssociateName,'') AS AssociateName, ISNULL(ad.Mobile,'') AS AssociateMobile
FROM BookingDetail bd WITH (NOLOCK)
LEFT JOIN PlotDetail pd WITH (NOLOCK) ON bd.PlotId = pd.PlotId
LEFT JOIN UserDetail ud WITH (NOLOCK) ON bd.UserId = ud.UserId
LEFT JOIN AssociateDetail ad WITH (NOLOCK) ON bd.SponserId = ad.AssociateId
WHERE bd.AccountNo = '" + Escape(accountNo) + @"'
  AND CAST(ISNULL(pd.LandArea, bd.LandArea) AS DECIMAL(18,2)) IN (10,25,50,100)";
            return ObjData.RunSelectQueryTTrans(str_query, tr);
        }

        private DataTable RunQuery(string str_query)
        {
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        private string Escape(string value)
        {
            if (value == null) return "";
            return value.Replace("'", "''");
        }
    }
}
