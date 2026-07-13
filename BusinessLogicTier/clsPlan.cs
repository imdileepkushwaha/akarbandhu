using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataTier;
using System.Data.SqlClient;

namespace BusinessLogicTier
{
    public class clsPlan
    {
        Data ObjData = new Data();
        public string PlanId { get; set; }
        public string PlanName { get; set; }
        public string PlanType { get; set; }
        public decimal LandAmount { get; set; }
        public decimal BookingAmount { get; set; }
        public decimal BookingAmountPercent { get; set; }
        public int DepositTerm { get; set; }
        public string MentionBy { get; set; }

        public string BankAccountId { get; set; }
        public string AccountNo { get; set; }
        public string BankName { get; set; }
        public string IFSCCode { get; set; }


        public DataTable getPlan()
        {
            string str_query = "select * from PlanDetail order by PlanType,PlanName";

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
        public DataTable getPlanDetailByType(clsPlan objplan)
        {
            string str_query = "select * from PlanDetail where plantype='" + objplan.PlanType  + "'";

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
        public DataTable getPlanDetailById(clsPlan objplan)
        {
            string str_query = "select * from PlanDetail where planid="+objplan.PlanId+"";

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

        public DataTable getBankAccountDetail()
      
        {
            string str_query = "select *,AccountNo+'-'+BankName as accountno2 from BankAccountDetail";

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


        public string Insert_Plan(clsPlan objplan)
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
                s2 = "sp_addPlanDetail";
                SqlParameter[] parameter = {   
                new SqlParameter("@PlanType",objplan.PlanType),
                new SqlParameter("@PlanName",objplan.PlanName),
                new SqlParameter("@LandAmount",objplan.LandAmount),
                new SqlParameter("@BookingAmount",objplan.BookingAmountPercent),
                new SqlParameter("@DepositTerm",objplan.DepositTerm),               
                new SqlParameter("@MentionBy",objplan.MentionBy)
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

        public string Insert_BankAccountDetail(clsPlan objplan)
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
                s2 = "sp_addBankAccountDetail";
                SqlParameter[] parameter = {   
                new SqlParameter("@AccountNo",objplan.AccountNo),
                new SqlParameter("@BankName",objplan.BankName),
                new SqlParameter("@ifsccode",objplan.IFSCCode),                        
                new SqlParameter("@MentionBy",objplan.MentionBy)
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
