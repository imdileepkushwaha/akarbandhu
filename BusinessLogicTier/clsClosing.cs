using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTier;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLogicTier
{
    public class clsClosing
    {
        Data ObjData = new Data();
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string MentionBy { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }

        public DataSet getStartDate()
        {
            string str_query = "SELECT dateadd(dd,1, max (todate)) as End_Date FROM ClosingDateDetail;SELECT convert(varchar,min(mentiondate),103) AS Start_Date FROM userdetail";
            DataSet ds = null;
            ObjData.StartConnection();
            try
            {
                ds = ObjData.RunSelectQuery(str_query);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }
        public DataSet getStartDateReward()
        {
            string str_query = "SELECT dateadd(dd,1, max (todate)) as End_Date FROM RewardClosingDateDetail;SELECT convert(varchar,min(mentiondate),103) AS Start_Date FROM userdetail";
            DataSet ds = null;
            ObjData.StartConnection();
            try
            {
                ds = ObjData.RunSelectQuery(str_query);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }
        public DataSet getStartDateDirectIcnome()
        {
            string str_query = "SELECT dateadd(dd,1, max (todate)) as End_Date FROM DirectIncomeClosingDateDetail;SELECT convert(varchar,min(mentiondate),103) AS Start_Date FROM paymentdetail";
            DataSet ds = null;
            ObjData.StartConnection();
            try
            {
                ds = ObjData.RunSelectQuery(str_query);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }
        public DataTable getClosingPeriod()
        {
            string str_query = "select Distinct fromdate,Todate,'' AS closingperiod from ClosingDateDetail";

            DataTable ds = null;
            ObjData.StartConnection();
            try
            {

                ds = ObjData.RunDataTable(str_query);
                if (ds.Rows.Count > 0)
                {

                    foreach (DataRow Dr in ds.Rows)
                    {
                        Dr["closingperiod"] = Convert.ToDateTime(Dr["fromdate"].ToString()).ToString("dd/MMM/yyyy") + "=" + Convert.ToDateTime(Dr["Todate"].ToString()).ToString("dd/MMM/yyyy");
                    }

                }
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }

        //public DataTable getClosingPeriod()
        //{
        //    string str_query = "select *, convert(nvarchar, fromdate,103)+'-'+convert(nvarchar, todate,103) as closingperiod from   ClosingDateDetail ";
        //    DataTable dt = null;
        //    ObjData.StartConnection();
        //    try
        //    {
        //        dt = ObjData.RunDataTable(str_query);
        //    }
        //    catch (Exception ex)
        //    {
        //        dt = null;
        //    }
        //    ObjData.EndConnection();
        //    return dt;
        //}
        public DataTable getClosingPeriodReverse()
        {
            string str_query = "SELECT top 1  *, convert(nvarchar, fromdate,103)+'-'+convert(nvarchar, todate,103) as closingperiod from   ClosingDateDetail with (nolock) ORDER BY  fromdate desc";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getClosingPeriodReward()
        {
            string str_query = "select Distinct fromdate,Todate,'' AS closingperiod from RewardClosingDateDetail";

            DataTable ds = null;
            ObjData.StartConnection();
            try
            {

                ds = ObjData.RunDataTable(str_query);
                if (ds.Rows.Count > 0)
                {

                    foreach (DataRow Dr in ds.Rows)
                    {
                        Dr["closingperiod"] = Convert.ToDateTime(Dr["fromdate"].ToString()).ToString("dd/MMM/yyyy") + "=" + Convert.ToDateTime(Dr["Todate"].ToString()).ToString("dd/MMM/yyyy");
                    }

                }
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }
    
        public string GenerateClosingSale(clsClosing objclosing)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_generatesaleclosing";
                SqlParameter[] parameter = {
                new SqlParameter("@fromdate",objclosing.FromDate),
                new SqlParameter("@todate",objclosing.ToDate),
                new SqlParameter("@mentionby",objclosing.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public DataTable getClosingReportSaleROI(clsClosing objclosing)
        {
            string str_query = "select cd.*,ud.username,ud.AccountHolderName,ud.AccountNo,ud.IFSCCode,ud.BankName,ud.BranchName,ud.PanNumber from saleROIClosingDetail  cd left join userdetail ud on cd.userid=ud.userid where 1=1 and cd.CommissionAmount>0  ";

            if (objclosing.FromDate != DateTime.MinValue && objclosing.ToDate != DateTime.MinValue)
            {
                str_query += "  and cd.fromdate  >= '" + objclosing.FromDate + "'   and cd.todate   <= '" + objclosing.ToDate + "' ";
            }
            if (objclosing.UserId != "")
            {
                str_query += "  and cd.userid = '" + objclosing.UserId + "' ";
            }
            str_query += " order by cd.userid  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public string GenerateClosingSaleROI(clsClosing objclosing)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_generateSaleROIClosing";
                SqlParameter[] parameter = {
                new SqlParameter("@fromdate",objclosing.FromDate),
                new SqlParameter("@todate",objclosing.ToDate),
                new SqlParameter("@mentionby",objclosing.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public DataSet getStartDateSaleROI()
        {
            string str_query = "SELECT dateadd(dd,1, max (todate)) as End_Date FROM saleROIClosingDateDetail;SELECT min(saledate) AS Start_Date FROM saledetail";
            DataSet ds = null;
            ObjData.StartConnection();
            try
            {
                ds = ObjData.RunSelectQuery(str_query);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }
        public DataTable getClosingPeriodSale()
        {
            string str_query = "select *, convert(nvarchar, fromdate,103)+'-'+convert(nvarchar, todate,103) as closingperiod from   saleClosingDateDetail ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataSet getStartDateSale()
        {
            string str_query = "SELECT dateadd(dd,1, max (todate)) as End_Date FROM saleClosingDateDetail;SELECT convert(varchar,min(saledate),103) AS Start_Date FROM saledetail";
            DataSet ds = null;
            ObjData.StartConnection();
            try
            {
                ds = ObjData.RunSelectQuery(str_query);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }
        public DataTable getClosingReportSale(clsClosing objclosing)
        {
            string str_query = "select cd.*,ud.associatename,ud.AccountHolderName,ud.AccountNo,ud.IFSCCode,ud.BankName,ud.BranchName,ud.PanNumber from saleClosingDetail  cd left join associatedetail ud on cd.associateid=ud.associateid where 1=1 and cd.CommissionAmount>0  ";

            if (objclosing.FromDate != DateTime.MinValue && objclosing.ToDate != DateTime.MinValue)
            {
                str_query += "  and cd.fromdate  >= '" + objclosing.FromDate + "'   and cd.todate   <= '" + objclosing.ToDate + "' ";
            }
            if (objclosing.UserId != "")
            {
                str_query += "  and cd.associateid = '" + objclosing.UserId + "' ";
            }
            str_query += " order by cd.associateid  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getClosingPeriodSaleROI()
        {
            string str_query = "select *, convert(nvarchar, fromdate,103)+'-'+convert(nvarchar, todate,103) as closingperiod from   saleROIClosingDateDetail ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getDirectIncomeClosingPeriodReverse()
        {
            string str_query = "SELECT top 1  *, convert(nvarchar, fromdate,103)+'-'+convert(nvarchar, todate,103) as closingperiod from   DirectIncomeclosingdatedetail with (nolock) ORDER BY  fromdate desc";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getClosingReport(clsClosing objclosing)
        {
            string str_query = "select cd.*,ud.associatename,ud.AccountHolderName,ud.AccountNo,ud.IFSCCode,ud.BankName,ud.BranchName,ud.PanNumber from ClosingDetail  cd left join associatedetail ud on cd.userid=ud.associateid where 1=1 and cd.CommissionAmount>0 ";

            if (objclosing.FromDate != DateTime.MinValue && objclosing.ToDate != DateTime.MinValue)
            {
                str_query += "  and cd.fromdate  >= '" + objclosing.FromDate + "'   and cd.todate   <= '" + objclosing.ToDate + "' ";
            }
            if (objclosing.UserId != "")
            {
                str_query += "  and cd.userid = '" + objclosing.UserId + "' ";
            }
            str_query += " order by cd.userid  desc";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public string GenerateClosing(clsClosing objclosing)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_generateClosingWithLevel2";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@fromdate",objclosing.FromDate),
                new SqlParameter("@todate",objclosing.ToDate),
                new SqlParameter("@mentionby",objclosing.MentionBy),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string GenerateClosingReward(clsClosing objclosing)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_generateRewardClosing";
                SqlParameter[] parameter = {
                new SqlParameter("@fromdate",objclosing.FromDate),
                new SqlParameter("@todate",objclosing.ToDate),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string GenerateClosingDirectIncome(clsClosing objclosing)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_generateDirectIncomeClosing";
                SqlParameter[] parameter = {
                new SqlParameter("@FromDate",objclosing.FromDate),
                new SqlParameter("@ToDate",objclosing.ToDate),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }


        public string ReverseClosing(clsClosing objclosing)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_reverseclosing";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@fromdate",objclosing.FromDate), 
                new SqlParameter("@todate",objclosing.ToDate), 
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string ReverseDirectIncomeClosing(clsClosing objclosing)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_reverseDirectclosing";
                SqlParameter[] parameter = {
                new SqlParameter("@fromdate",objclosing.FromDate),
                new SqlParameter("@todate",objclosing.ToDate),
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
    }
}
