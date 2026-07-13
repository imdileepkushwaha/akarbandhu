using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTier;
using System.Data;
using System.Data.SqlClient;
using ARA_StringHunt;

namespace BusinessLogicTier
{
    public class clsBooking
    {
        Data ObjData = new Data();
        public string BookingId { get; set; }
        public string Id { get; set; }
        public string CategoryId { get; set; }
        public string ProductName { get; set; }
        public DateTime BookingDate { get; set; }
        public string Prefix { get; set; }
        public string SponserId { get; set; }
        public string BusinessType { get; set; }
        public string AssociateId { get; set; }
        public string UserName { get; set; }
        public string UserId { get; set; }
        public string PlotId { get; set; }
        public string PlanId { get; set; }
        public int TotalInstallment { get; set; }
        public decimal InvestmentAmount { get; set; }
        public int Period { get; set; }
        public string Remark { get; set; }
        public string ReturnMode { get; set; }
        public decimal ReturnAmount { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime PaymentDate { get; set; }
        public decimal LandArea { get; set; }
        public decimal PLCCharge { get; set; }
        public decimal LandAmountUnit { get; set; }
        public decimal InstallmentAmount { get; set; }
        public decimal PlotAmount { get; set; }
        public decimal DevelopmentCharge { get; set; }
        public decimal OtherCharge { get; set; }
        public decimal BookingAmount { get; set; }
        public decimal PaidAmount { get; set; }
        public decimal SponserCredit { get; set; }
        public decimal AmountPerSqft { get; set; }
        public decimal InstallmentMode { get; set; }
        public DateTime NextDueDate { get; set; }
        public decimal NextInstAmount { get; set; }
        public string NomineeName { get; set; }
        public string NomineeAddress { get; set; }
        public string NomineeStateId { get; set; }
        public string NomineeCityId { get; set; }
        public string NomineeSpouseName { get; set; }
        public DateTime NomineeDOB { get; set; }
        public string NomineeRelation { get; set; }


        public string BranchId { get; set; }
        public string PaymentMode { get; set; }
        public string PLCName { get; set; }
        public string BankName { get; set; }
        public string BranchName { get; set; }
        public string ChequeNo { get; set; }
        public DateTime ChequeDate { get; set; }
        public string CashDepositlocation { get; set; }
        public string CashDepositAccountNo { get; set; }
        public string CashDepositBranchId { get; set; }
        public string CashDepositTransactionNo { get; set; }
        public string OnlineTransactionAccountNo { get; set; }
        public string OnlineTransactionTransactionNo { get; set; }
        public DateTime OnlineTransactionPaymentDate { get; set; }
        public string MentionBy { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }

        public string BlockId { get; set; }
        public string ProjectId { get; set; }
        public int DepositTerm { get; set; }
        public int InstNo { get; set; }
        public DateTime InstDate { get; set; }
        public decimal InstAmount { get; set; }
        public DateTime PaidDate { get; set; }
        public string PlanType { get; set; }
        public string ChequeStatus { get; set; }
        public string ChequeId { get; set; }
        public DateTime FullFinalDate { get; set; }
        public decimal FullFinalAmount { get; set; }

        public DataTable getBookingSummary()
        {
            string str_query = "SELECT count (*) AS totalbooking,(SELECT count (bd.bookingid) FROM BookingDetail bd LEFT JOIN plandetail pd ON bd.PlanId=pd.PlanId WHERE pd.PlanType='DP' ) AS DPBooking , (SELECT count (bd.bookingid) FROM BookingDetail bd LEFT JOIN plandetail pd ON bd.PlanId=pd.PlanId WHERE pd.PlanType='IP' ) AS IPBooking, (SELECT count (bd.bookingid) FROM BookingDetail bd LEFT JOIN plandetail pd ON bd.PlanId=pd.PlanId WHERE pd.PlanType='Flexi' ) AS FlexiBooking FROM BookingDetail ";


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

        public DataTable getBookingSummarySponser(clsBooking objbooking)
        {
            string str_query = "SELECT count (*) AS totalbooking,(SELECT count (bd.bookingid) FROM BookingDetail bd LEFT JOIN plandetail pd ON bd.PlanId=pd.PlanId WHERE pd.PlanType='DP' and Sponserid='" + objbooking.SponserId + "'  ) AS DPBooking , (SELECT count (bd.bookingid) FROM BookingDetail bd LEFT JOIN plandetail pd ON bd.PlanId=pd.PlanId WHERE pd.PlanType='IP' and Sponserid='" + objbooking.SponserId + "'  ) AS IPBooking, (SELECT count (bd.bookingid) FROM BookingDetail bd LEFT JOIN plandetail pd ON bd.PlanId=pd.PlanId WHERE pd.PlanType='Flexi' and Sponserid='" + objbooking.SponserId + "'  ) AS FlexiBooking FROM BookingDetail where Sponserid='" + objbooking.SponserId + "' ";


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

        public DataTable getBusinessSummary()
        {
            string str_query = "SELECT count(plotid) AS vacantplot ,(SELECT count(plotid)  FROM PlotDetail WHERE PlotStatus='Hold') AS holdplot,(SELECT count(plotid)  FROM PlotDetail WHERE PlotStatus='Booked') AS bookedplot,(SELECT sum(bookingamount)  FROM BookingDetail ) AS bookingamount,(SELECT sum(paidamount) FROM InstallmentDetail) AS installmentamount FROM PlotDetail WHERE PlotStatus='Vacant'";


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


        public DataTable getBusinessSummarySponser(clsBooking objbooking)
        {
            string str_query = "SELECT count(plotid) AS vacantplot ,(SELECT count(plotid)  FROM PlotDetail WHERE PlotStatus='Hold') AS holdplot,(SELECT count(plotid)  FROM PlotDetail WHERE PlotStatus='Booked') AS bookedplot,(SELECT isnull( sum(bookingamount),0.00)  FROM BookingDetail where Sponserid='" + objbooking.SponserId + "' ) AS bookingamount,(SELECT isnull( sum(ind.paidamount),0.00) FROM InstallmentDetail ind left join bookingdetail bd on ind.bookingid=bd.bookingid   where bd.Sponserid='" + objbooking.SponserId + "' ) AS installmentamount FROM PlotDetail WHERE PlotStatus='Vacant'";


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


        public DataTable getMonthlySale(string query)
        {
            //string str_query = "SELECT Count(*) AS value,DATENAME(MONTH, bookingdate) AS symbol  FROM BookingDetail  GROUP BY DATENAME(MONTH, bookingdate),datepart(yy,bookingdate ) ";


            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getBookingReport(clsBooking objbooking)
        {
            string str_query = "SELECT bd.*,cd.username,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName,pnd.PlanType FROM bookingdetail bd LEFT JOIN userdetail cd ON bd.userid=cd.userid LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN planmaster pnd ON bd.PlanId=pnd.PlanId WHERE 1=1   ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
            }
            if (objbooking.UserId != "")
            {
                str_query += "  and bd.userid='" + objbooking.UserId + "' ";
            }
            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.BookingId='" + objbooking.BookingId + "' ";
            }
            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }
            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }
            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }
            str_query += " order by bd.mentiondate desc";

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
        public DataTable getMISList(clsBooking objbooking)
        {
            string str_query = "SELECT mi.*,md.UserName FROM misdetail mi WITH (nolock) LEFT JOIN Userdetail md WITH (nolock) ON mi.Userid=md.UserId WHERE 1=1   ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and mi.paymentdate  >= '" + objbooking.FromDate + "'   and mi.paymentdate  <= '" + objbooking.ToDate + "' ";
            }
            if (objbooking.UserId != "")
            {
                str_query += "  and mi.Userid='" + objbooking.UserId + "' ";
            }
            if (objbooking.SponserId != "")
            {
                str_query += "  and mi.SponserId='" + objbooking.SponserId + "' ";
            }
            if (objbooking.BookingId != "")
            {
                str_query += "  and mi.accountno='" + objbooking.BookingId + "' ";
            }

            str_query += " order by mi.paymentdate desc";

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
        public DataTable getMISDetailForInst(clsBooking objbooking)
        {
            string str_query = "SELECT mi.*,(SELECT count(mil.id)+1 FROM MISInstallmentDetail mil WITH (nolock) WHERE mil.accountno=mi.AccountNo) as instno,case when mi.ReturnMode=1 THEN dateadd(month,(SELECT count(mil.id)+1 FROM MISInstallmentDetail mil WITH (nolock) WHERE mil.accountno=mi.AccountNo),mi.PaymentDate) when mi.returnmode=4 THEN dateadd(day,(SELECT count(mil.id)+1 FROM MISInstallmentDetail mil WITH (nolock) WHERE mil.accountno=mi.AccountNo)*7,mi.PaymentDate) ELSE '01/01/1900' END AS NextInstDate  , md.UserName FROM misdetail mi WITH (nolock) LEFT JOIN Userdetail md WITH (nolock) ON mi.Userid=md.UserId WHERE 1=1   ";


            str_query += "  and mi.accountno='" + objbooking.BookingId + "' ";


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
        public DataTable getGPBooking(clsBooking objbooking)
        {
            string str_query = @"SELECT isnull(  (select sum(ind.InstAmt) FROM installmentdetail ind with (nolock) where ind.accountno=bd.accountno  ),0) as totalpaid,
 bd.*,cd.UserName,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN Userdetail cd ON bd.Userid=cd.Userid LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE pnd.PlanType='DP'  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.Userid='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.accountno='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {
                str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
            }

            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }

            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }


            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.Username like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by bd.bookingdate desc";

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

        public DataTable getSaleReport(clsBooking objbooking)
        {
            string str_query = "SELECT sd.*,cd.categoryname,ud.username FROM SaleDetail sd WITH (nolock) left JOIN CateGoryMaster cd WITH (nolock) ON cd.id=sd.CategoryId LEFT JOIN userdetail ud WITH (nolock) ON ud.userid=sd.UserId WHERE 1=1 ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and  convert(date,sd.saledate ) >= convert(date,'" + objbooking.FromDate + "')   and convert(date,sd.saledate )   <= convert(date,'" + objbooking.ToDate + "') ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and sd.Userid='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and sd.InvoiceNo='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {
                str_query += "  and sd.SponserId='" + objbooking.SponserId + "' ";
            }

            if (objbooking.CategoryId != "0")
            {
                str_query += "  and sd.categoryid='" + objbooking.CategoryId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.Username like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by sd.saledate desc";

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
        public DataTable getCategory()
        {
            string str_query = "SELECT  * from CateGoryMaster with (nolock)";


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
    
        public DataTable getbusinessreport(clsBooking objbooking)
        {

            string str_condition = "  ";
            if (objbooking.SponserId != "")
            {

                if (objbooking.BusinessType == "Self")
                {
                    str_condition += "  and bd2.SponserId='" + objbooking.SponserId + "' ";
                }
                else
                 if (objbooking.BusinessType == "Team")
                {
                    str_condition += "  and bd2.SponserId  in (SELECT * FROM fn_getChild ('" + objbooking.SponserId + "')) ";
                }
                else
                {
                    str_condition += "  and bd2.SponserId  in (  (select '" + objbooking.SponserId + "' as Sponserid union  SELECT * FROM fn_getChild ('" + objbooking.SponserId + "'))) ";
                }
            }

            string str_query = "select * from BusinessDetail bd where 1=1    ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and convert(date, bd.paymentdate)  >= convert(date, '" + objbooking.FromDate + "')   and convert(date, bd.paymentdate)  <= convert(date, '" + objbooking.ToDate + "') ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.Userid='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.accountno='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {

                if (objbooking.BusinessType == "Self")
                {
                    str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
                }
                else
                 if (objbooking.BusinessType == "Team")
                {
                    str_query += "  and bd.SponserId  in (SELECT * FROM fn_getChild ('" + objbooking.SponserId + "')) ";
                }
                else
                {
                    str_query += "  and bd.SponserId  in (  (select '" + objbooking.SponserId + "' as Sponserid union  SELECT * FROM fn_getChild ('" + objbooking.SponserId + "'))) ";
                }
            }



            str_query += " order by bd.paymentdate desc";

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

        public string Insert_SaleDetail(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_add_SaleDetail";

                SqlParameter[] parameter = {

                new SqlParameter( "@Userid",  objbooking.UserId),
                new SqlParameter( "@SaleDate",  objbooking.BookingDate),
                new SqlParameter( "@CategoryId",  objbooking.CategoryId),
                new SqlParameter( "@SponserId",  objbooking.SponserId),
                new SqlParameter("@PaymentMode",objbooking.PaymentMode),
                new SqlParameter("@BankName",objbooking.BankName),
                new SqlParameter("@BranchName",objbooking.BranchName),
                new SqlParameter("@ChequeNo",objbooking.ChequeNo),
                new SqlParameter("@ChequeDate",objbooking.ChequeDate),
                new SqlParameter("@OnlineTransactionId",objbooking.OnlineTransactionTransactionNo),
                new SqlParameter("@MentionBy",objbooking.MentionBy),
                new SqlParameter("@PaidAmount",objbooking.PaidAmount),
                new SqlParameter("@Remark",objbooking.Remark),
                new SqlParameter("@ProductName",objbooking.ProductName),



                };
                DataTable dt = new DataTable();
                dt = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                res = dt.Rows[0][0].ToString();
                if (res == "t")
                {
                    //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=SECURE&password=SECURE&msisdn=" + dt.Rows[0]["mobile"].ToString() + "&sid=SECURE&msg=" + "Dear User your plot is successfully booked on securemaxs.com. Your booking id is : " + dt.Rows[0]["accountno"].ToString() + "&fl=0&gwid=2";
                    //string Result = url.CallURL();
                    //Insert_SendSMS(dt.Rows[0]["mobile"].ToString(), Result, url);
                    i = 1;
                    //   res = dt.Rows[0]["accountno"].ToString();
                }

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

        public DataTable getCategoryDetail(clsBooking objbooking)
        {
            string str_query = "SELECT  * from CateGoryMaster with (nolock) where id='" + objbooking.Id + "'";


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
        public string Insert_FlexiBooking(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_add_FlexiBooking";

                SqlParameter[] parameter = {

                new SqlParameter( "@Userid",  objbooking.UserId),
                new SqlParameter( "@BookingDate",  objbooking.BookingDate),
                new SqlParameter( "@PlotId",  objbooking.PlotId),
                new SqlParameter( "@PlanId", objbooking.PlanId),
                new SqlParameter( "@AmtPerSqft",  objbooking.LandAmountUnit),
                new SqlParameter( "@PlotAmount",  objbooking.PlotAmount),
                new SqlParameter( "@OtherCharges",  objbooking.OtherCharge),
                new SqlParameter( "@BookingAmount",  objbooking.BookingAmount),
                new SqlParameter( "@TotalAmount",  objbooking.TotalAmount),
                new SqlParameter( "@SponserId",  objbooking.SponserId),
                new SqlParameter( "@NomineeName",  objbooking.NomineeName),
                new SqlParameter( "@NomineeRelation",  objbooking.NomineeRelation),
                new SqlParameter("@PaymentMode",objbooking.PaymentMode),
                new SqlParameter("@BankName",objbooking.BankName),
                new SqlParameter("@BranchName",objbooking.BranchName),
                new SqlParameter("@ChequeNo",objbooking.ChequeNo),
                new SqlParameter("@ChequeDate",objbooking.ChequeDate),
                new SqlParameter("@OnlineTransactionId",objbooking.OnlineTransactionTransactionNo),
                new SqlParameter("@MentionBy",objbooking.MentionBy),
                new SqlParameter("@PaidAmount",objbooking.PaidAmount),
                new SqlParameter("@PLCName",objbooking.PLCName),



                };
                DataTable dt = new DataTable();
                dt = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                res = dt.Rows[0][0].ToString();
                if (res == "t")
                {

                    //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=sandhya&password=sandhya12&msisdn=" + dt.Rows[0]["mobile"].ToString() + "&sid=SENDIT&msg=" + "Dear User your plot is successfully booked on prideandproperty.net.in. Your booking id is : " + dt.Rows[0]["accountno"].ToString() + "&fl=0&gwid=2";
                    //string Result = url.CallURL();
                    //Insert_SendSMS(dt.Rows[0]["mobile"].ToString(), Result, url);

                    //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=SECURE&password=SECURE&msisdn=" + dt.Rows[0]["mobile"].ToString() + "&sid=SECURE&msg=" + "Dear User your plot is successfully booked on securemaxs.com. Your booking id is : " + dt.Rows[0]["accountno"].ToString() + "&fl=0&gwid=2";
                    //string Result = url.CallURL();
                    //Insert_SendSMS(dt.Rows[0]["mobile"].ToString(), Result, url);
                    i = 1;
                    //   res = dt.Rows[0]["accountno"].ToString();
                }

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

        public DataTable getFPBookingAssociate(clsBooking objbooking)
        {
            string str_query = "SELECT  case when  isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno  ),0)<bd.totalamount then '1' else '0' end as paymentstatus,  isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno  ),0) as totalpaid , bd.*,cd.Username,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN Userdetail cd ON bd.Userid=cd.Userid LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE pnd.PlanType='FX'  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.SponserId='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.accountno='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {
                str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
            }

            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }

            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }


            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.Username like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by bd.bookingdate desc";

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

        public DataTable getFPBooking(clsBooking objbooking)
        {
            string str_query = "SELECT  case when  isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno  ),0)<bd.totalamount then '1' else '0' end as paymentstatus,  isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno  ),0) as totalpaid , bd.*,cd.Username,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN Userdetail cd ON bd.Userid=cd.Userid LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE pnd.PlanType='FX'  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.Userid='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.accountno='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {
                str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
            }

            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }

            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }


            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.Username like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by bd.bookingdate desc";

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

        public DataTable getBookingDetailForFlexiInst(clsBooking objbooking)
        {
            string str_query = "SELECT   isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno ),0) as totalpaid ,bd.bookingamount-isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno ),0) as balancedp , 0 AS instamt,  convert(varchar, dateadd (dd,1,(SELECT max(ind.InstDate) FROM installmentdetail ind WITH (nolock) WHERE ind.AccountNo=bd.AccountNo)),103) AS InstDate, (SELECT count(ind.id) FROM installmentdetail ind WITH (nolock) WHERE ind.AccountNo=bd.AccountNo)+1 AS newinstno, bd.*,cd.UserName,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN Userdetail cd ON bd.UserId=cd.UserId LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId  WHERE  bd.accountno='" + objbooking.BookingId + "'  ";


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
        public DataTable getIPBookingReverse(clsBooking objbooking)
        {
            string str_query = "SELECT  isnull((select sum(dpd.instamt) from PaymentDetailHIstory dpd with (nolock) where dpd.accountno=bd.accountno ),0) as totalpaid , bd.*,cd.username,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM BookingDetailHistory bd LEFT JOIN userdetail cd ON bd.userid=cd.userid LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE pnd.PlanType='IP'  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.userid='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.accountno='" + objbooking.BookingId + "' ";
            }

            if (objbooking.AssociateId != "")
            {
                str_query += "  and bd.AssociateId='" + objbooking.AssociateId + "' ";
            }

            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }

            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }


            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.username like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by bd.deletedate desc";

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

        public DataTable getChequereport(clsBooking objbooking)
        {
            string str_query = "select cq.*,bd.instamt,isnull(cq.status,'Pending') as status2 from chequedetail cq with (nolock) left join  BusinessDetail bd on cq.transactionid=bd.transactionid where 1=1 ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and convert(date, cq.chequedate)  >= convert(date, '" + objbooking.FromDate + "')   and convert(date, cq.chequedate)  <= convert(date, '" + objbooking.ToDate + "') ";
            }

            if (objbooking.ChequeNo != "")
            {
                str_query += "  and cq.chequeno='" + objbooking.ChequeNo + "' ";
            }
            str_query += " order by cq.chequedate desc";

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

        public DataTable getbookingledger(clsBooking objbooking)
        {
            string str_query = @"SELECT ind.AccountNo,ind.PaymentDate,ind.PaymentMode,ind.instamt,bd.SponserId,bd.UserId,md.UserName,ad.SponserName,
bd.TotalAmount,bd.PlotAmount,bd.OtherCharges,pld.PlotNo,bm.BlockName,pd.ProjectName,
(SELECT sum(ind2.instamt) FROM paymentdetail ind2 WITH (nolock) where ind2.AccountNo=ind.AccountNo) AS totalpaid 
FROM paymentdetail ind WITH (nolock) 
LEFT JOIN bookingdetail bd WITH (nolock) ON ind.AccountNo=bd.AccountNo 
LEFT JOIN Userdetail md WITH (nolock) on bd.UserId=md.UserId
LEFT JOIN Sponserdetail ad WITH (nolock) ON ad.SponserId=bd.SponserId
LEFT JOIN plotdetail pld ON pld.PlotId=bd.Plotid
LEFT JOIN blockdetail bm WITH (nolock) ON bm.BlockId=pld.BlockId
LEFT JOIN projectdetail pd WITH (nolock) ON pd.ProjectId=bm.ProjectId
WHERE ind.AccountNo='" + objbooking.BookingId+"' order by ind.paymentdate  ";

           
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
        public DataTable getbookingledger2(clsBooking objbooking)
        {
            string str_query = @"SELECT  ROW_NUMBER() OVER(ORDER BY PaymentDate) as sno, ind.AccountNo, convert(varchar, ind.PaymentDate,103) as PaymentDate,ind.PaymentMode,ind.instamt,bd.SponserId,bd.UserId,md.UserName,ad.SponserName,
bd.TotalAmount,bd.PlotAmount,bd.OtherCharges,pld.PlotNo,bm.BlockName,pd.ProjectName,
(SELECT sum(ind2.instamt) FROM paymentdetail ind2 WITH (nolock) where ind2.AccountNo=ind.AccountNo) AS totalpaid 
FROM paymentdetail ind WITH (nolock) 
LEFT JOIN bookingdetail bd WITH (nolock) ON ind.AccountNo=bd.AccountNo 
LEFT JOIN Userdetail md WITH (nolock) on bd.UserId=md.UserId
LEFT JOIN Sponserdetail ad WITH (nolock) ON ad.SponserId=bd.SponserId
LEFT JOIN plotdetail pld ON pld.PlotId=bd.Plotid
LEFT JOIN blockdetail bm WITH (nolock) ON bm.BlockId=pld.BlockId
LEFT JOIN projectdetail pd WITH (nolock) ON pd.ProjectId=bm.ProjectId
WHERE ind.AccountNo='" + objbooking.BookingId + "' order by ind.paymentdate  ";


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
        public DataTable getSponserLedger(clsBooking objbooking)
        {
            string str_query = "SELECT ac.*,isnull(ac.recovery,0) as recovery2, (SELECT ((sum(ac2.Payout)-sum(ac2.Payment))-sum(ac2.Advance))-sum(isnull(ac2.recovery,0)) FROM Sponserledger ac2 WITH (nolock) WHERE ac2.SponserId=ac.SponserId AND ac2.PaymentDate<=ac.PaymentDate ) AS balance,ad.SponserName FROM Sponserledger ac WITH (nolock) LEFT JOIN Sponserdetail ad WITH (nolock) ON ac.SponserId=ad.SponserId where ac.Sponserid='"+objbooking.SponserId+"'   ORDER BY ac.PaymentDate ";
            
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

        public DataTable getFlexiBooking(clsBooking objbooking)
        {
            string str_query = "SELECT bd.*,cd.UserName,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN customerdetail cd ON bd.UserId=cd.UserId LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE pnd.PlanType='Flexi'  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.UserId='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.BookingId='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {
                str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
            }

            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }

            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }


            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.UserName like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by bd.bookingdate desc";

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
        public DataTable getDPBooking(clsBooking objbooking)
        {
            string str_query = "SELECT  isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno and dpd.entrytype='DownPayment' ),0) as totalpaid , bd.*,cd.Username,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN Userdetail cd ON bd.Userid=cd.Userid LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE pnd.PlanType='FP'  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.Userid='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.accountno='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {
                str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
            }

            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }

            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }


            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.Username like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by bd.bookingdate desc";

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

        public DataTable getIPBooking(clsBooking objbooking)
        {
            string str_query = "SELECT  isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno and dpd.entrytype='DownPayment' ),0) as totalpaid , bd.*,cd.Username,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN Userdetail cd ON bd.Userid=cd.Userid LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE pnd.PlanType='IP'  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.Userid='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.accountno='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {
                str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
            }

            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }

            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }


            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.Username like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by bd.bookingdate desc";

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

        public DataTable getIPDPPaidBooking(clsBooking objbooking)
        {
            string str_query = "SELECT dpd.id as paymentid,  dpd.paidamt,dpd.PaymentDate, bd.*,cd.Username,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM DownPaymentDetail dpd WITH (nolock) left join bookingdetail bd with (nolock) on dpd.accountno=bd.accountno LEFT JOIN Userdetail cd ON bd.Userid=cd.Userid LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE pnd.PlanType='IP'  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and convert(date, dpd.paymentdate)  >= convert(date,'" + objbooking.FromDate + "')   and convert(date,dpd.paymentdate ) <= convert(date,'" + objbooking.ToDate + "') ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.Userid='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.accountno='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {
                str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
            }

            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }

            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }


            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.Username like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by dpd.PaymentDate desc";

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

        public DataTable getBookingFullFinal(clsBooking objbooking)
        {
            string str_query = "SELECT bd.*,cd.UserName,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName,pnd.PlanType FROM bookingdetail bd LEFT JOIN customerdetail cd ON bd.UserId=cd.UserId LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE 1=1 and pd.plotstatus='Final'  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
            }

            if (objbooking.UserId != "")
            {
                str_query += "  and bd.UserId='" + objbooking.UserId + "' ";
            }

            if (objbooking.BookingId != "")
            {
                str_query += "  and bd.BookingId='" + objbooking.BookingId + "' ";
            }

            if (objbooking.SponserId != "")
            {
                str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
            }

            if (objbooking.BlockId != "0")
            {
                str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
            }

            if (objbooking.ProjectId != "0")
            {
                str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
            }


            if (objbooking.PlotId != "0")
            {
                str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
            }

            if (objbooking.UserName != "")
            {
                str_query += "  and cd.UserName like '%" + objbooking.UserName + "%' ";
            }

            str_query += " order by bd.bookingdate desc";

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

        public DataTable getBookingDetailForFullFinal(clsBooking objbooking)
        {
            string str_query = "SELECT bd.bookingid, bd.PlotId,bd.BookingAmount+ isnull((SELECT sum(PaidAmount) FROM installmentdetail ind3 WHERE ind3.BookingId=bd.BookingId),0.00) AS PaidAmount,bd.LandArea,bd.PlotAmount,pnd.PlanType,cd.UserName,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN customerdetail cd ON bd.UserId=cd.UserId LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId  WHERE pd.PlotStatus !='Final' and bd.BookingId='" + objbooking.BookingId + "'  ";

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
        public DataTable getChequeDetails(clsBooking objbooking)
        {
            string str_query = "SELECT  * from  ChequeDetail where 1=1  ";

            if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
            {
                str_query += "  and chequedate  >= '" + objbooking.FromDate + "'   and chequedate <= '" + objbooking.ToDate + "' ";
            }

            if (objbooking.ChequeNo != "")
            {
                str_query += "  and ChequeNo='" + objbooking.ChequeNo + "' ";
            }
            if (objbooking.ChequeStatus != "0")
            {
                str_query += "  and ChequeStatus='" + objbooking.ChequeStatus + "' ";
            }


            str_query += " order by chequedate desc";

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



        //public DataTable getBookingReport(clsBooking objbooking)
        //{
        //    string str_query = "SELECT pnd.PlanType, bd.*,cd.UserName,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN customerdetail cd ON bd.UserId=cd.UserId LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE 1=1  ";

        //    if (objbooking.FromDate != DateTime.MinValue && objbooking.ToDate != DateTime.MinValue)
        //    {
        //        str_query += "  and bd.bookingdate  >= '" + objbooking.FromDate + "'   and bd.bookingdate  <= '" + objbooking.ToDate + "' ";
        //    }

        //    if (objbooking.UserId != "")
        //    {
        //        str_query += "  and bd.UserId='" + objbooking.UserId + "' ";
        //    }

        //    if (objbooking.BookingId != "")
        //    {
        //        str_query += "  and bd.BookingId='" + objbooking.BookingId + "' ";
        //    }

        //    if (objbooking.SponserId != "")
        //    {
        //        str_query += "  and bd.SponserId='" + objbooking.SponserId + "' ";
        //    }

        //    if (objbooking.BlockId != "0")
        //    {
        //        str_query += "  and bld.blockid='" + objbooking.BlockId + "' ";
        //    }

        //    if (objbooking.ProjectId != "0")
        //    {
        //        str_query += "  and bld.projectid='" + objbooking.ProjectId + "' ";
        //    }


        //    if (objbooking.PlotId != "0")
        //    {
        //        str_query += "  and bd.plotid='" + objbooking.PlotId + "' ";
        //    }

        //    if (objbooking.UserName != "")
        //    {
        //        str_query += "  and cd.UserName like '%" + objbooking.UserName + "%' ";
        //    }


        //    if (objbooking.PlanType != "0")
        //    {
        //        str_query += "  and pnd.PlanType= '" + objbooking.PlanType + "' ";
        //    }

        //    str_query += " order by bd.bookingdate desc";

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


        public DataTable getBookingReceipt(clsBooking objbooking)
        {
            string str_query = @"SELECT  pd.LandArea AS PlotArea,pd.Dimension AS PlotSize, ud.UserName,ud.Address,bm.BlockName+'-'+ convert(NVARCHAR, pd.PlotNo) AS plotno,pj.ProjectName, bd.AccountNo,bd.UserId,bd.SponserId,bd.PlanId,bd.PlotId,bd.PlotAmount,convert(NVARCHAR, bd.bookingdate ,103) AS bookingdate ,bd.PaymentMode,bd.TransactionId,bd.BookingAmount FROM bookingdetail bd WITH (nolock) LEFT JOIN plotdetail pd WITH (nolock) ON bd.PlotId=pd.PlotId LEFT JOIN blockdetail bm with (nolock) ON pd.BlockId=bm.BlockId LEFT JOIN projectdetail pj WITH (nolock) ON bm.ProjectId=pj.ProjectId LEFT JOIN userdetail ud WITH (nolock) ON bd.UserId=ud.UserId where bd.accountno='" + objbooking.BookingId+"' ";
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

        public DataTable getDPPaymentReceipt(clsBooking objbooking)
        {
            string str_query = @"SELECT bd.BookingAmount, dpd.paidamt,convert(NVARCHAR, dpd.PaymentDate ,103)AS paymentdate, pj.ProjectName, ad.SponserId,ad.Sponsername,  CASE WHEN pl.PlanType='DP' THEN bd.BookingDate ELSE dateadd(month,pl.DepositTerm,bd.BookingDate) END AS MaturityDate,  bk.BlockName+'-'+ pd.PlotNo AS plotno,pd.LandArea AS PlotSize,pd.Dimension AS PlotArea,md.UserName,md.FatherName,md.Mobile, bd.AccountNo,bd.UserId,bd.SponserId,bd.PlotAmount,bd.BookingAmount AS PaidAmount,dpd.transactionid,md.Address FROM   DownPaymentDetail dpd WITH (nolock) left join bookingdetail bd with (nolock) on dpd.accountno=bd.accountno  
LEFT JOIN Userdetail md WITH(nolock) ON bd.UserId = md.UserId LEFT JOIN plotdetail pd ON bd.PlotId = pd.PlotId LEFT JOIN blockdetail bk ON pd.BlockId = bk.BlockId
left join Sponserdetail ad on ad.Sponserid=bd.SponserId
LEFT JOIN plandetail pl ON pl.PlanId = bd.PlanId 
LEFT JOIN projectdetail pj ON bk.ProjectId=pj.ProjectId where dpd.id='" + objbooking.BookingId + "' ";
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

        public DataTable getInstallmentReceipt(clsBooking objbooking)
        {
            string str_query = @"SELECT bd.BookingAmount, dpd.InstAmt as PaidAmt,dpd.instno,convert(NVARCHAR, dpd.PaymentDate ,103)AS paymentdate, pj.ProjectName, ad.SponserId,ad.AssociateName as Sponsername,  CASE WHEN pl.PlanType='DP' THEN bd.BookingDate ELSE dateadd(month,pl.DepositTerm,bd.BookingDate) END AS MaturityDate,  bk.BlockName+'-'+ pd.PlotNo AS plotno,pd.LandArea AS PlotSize,pd.Dimension AS PlotArea,md.UserName as MemberName,'' AS FatherName,md.Mobile, bd.AccountNo,bd.UserId,bd.SponserId,bd.PlotAmount,bd.BookingAmount AS PaidAmount,dpd.transactionid,md.Address,bd.totalamount-isnull((select sum(instamt) from installmentdetail ind2 with (nolock) where ind2.accountno=bd.accountno and ind2.instno<='" + objbooking.InstNo + @"'),0) as balanceamount FROM  installmentdetail dpd WITH (nolock) left join bookingdetail bd with (nolock) on dpd.accountno=bd.accountno  
LEFT JOIN Userdetail md WITH(nolock) ON bd.UserId = md.UserId LEFT JOIN plotdetail pd ON bd.PlotId = pd.PlotId LEFT JOIN blockdetail bk ON pd.BlockId = bk.BlockId
left join associatedetail ad on ad.AssociateId=bd.SponserId
LEFT JOIN plandetail pl ON pl.PlanId = bd.PlanId 
LEFT JOIN projectdetail pj ON bk.ProjectId=pj.ProjectId where dpd.AccountNo='" + objbooking.BookingId + "' AND  dpd.InstNo='" + objbooking.InstNo + "' ";
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

        public DataTable getInstallment(clsBooking objbooking)
        {
            string str_query = "select * from InstallmentDetail  WHERE accountno='" + objbooking.BookingId + "'  order by instno   ";
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


        public DataTable getBookingDetail(clsBooking objbooking)
        {
            string str_query = "SELECT (SELECT count(ind.id) FROM installmentdetail ind WITH (nolock) WHERE ind.AccountNo=bd.AccountNo)+1 AS newinstno, bd.*,cd.UserName,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN Userdetail cd ON bd.UserId=cd.UserId LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId WHERE  bd.accountno='" + objbooking.BookingId + "'  ";


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
        public DataTable getBookingDetailForInst(clsBooking objbooking)
        {
            string str_query = "SELECT   isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno ),0) as totalpaid ,bd.bookingamount-isnull((select sum(dpd.InstAmt) from PaymentDetail dpd with (nolock) where dpd.accountno=bd.accountno ),0) as balancedp , convert(decimal(18,2) ,(bd.TotalAmount-bd.BookingAmount)/pnd.DepositTerm) AS instamt,  convert(varchar, dateadd (dd,1,(SELECT max(ind.InstDate) FROM installmentdetail ind WITH (nolock) WHERE ind.AccountNo=bd.AccountNo)),103) AS InstDate, (SELECT count(ind.id) FROM installmentdetail ind WITH (nolock) WHERE ind.AccountNo=bd.AccountNo)+1 AS newinstno, bd.*,cd.UserName,bld.BlockName+' - ' + convert(NVARCHAR(100), pd.plotno) AS plotname, pjd.ProjectName , pnd.PlanName FROM bookingdetail bd LEFT JOIN Userdetail cd ON bd.UserId=cd.UserId LEFT JOIN plotdetail pd ON pd.PlotId=bd.PlotId LEFT JOIN Blockdetail bld on pd.blockid=bld.BlockId  LEFT JOIN projectdetail pjd ON bld.ProjectId=pjd.ProjectId LEFT JOIN plandetail pnd ON bd.PlanId=pnd.PlanId  WHERE  bd.accountno='" + objbooking.BookingId + "'  ";


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
        public DataTable getInstDetail(clsBooking objbooking)
        {
            string str_query = "select * from InstallmentDetail  where BookingId='" + objbooking.BookingId + "' and instno=" + objbooking.InstNo + " ";


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

        public string Insert_IPBooking(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_add_IPBooking";

                SqlParameter[] parameter = {

                new SqlParameter( "@Userid",  objbooking.UserId),
                new SqlParameter( "@BookingDate",  objbooking.BookingDate),
                new SqlParameter( "@PlotId",  objbooking.PlotId),
                new SqlParameter( "@PlanId", objbooking.PlanId),
                new SqlParameter( "@AmtPerSqft",  objbooking.LandAmountUnit),
                new SqlParameter( "@PlotAmount",  objbooking.PlotAmount),
                new SqlParameter( "@OtherCharges",  objbooking.OtherCharge),
                new SqlParameter( "@BookingAmount",  objbooking.BookingAmount),
                new SqlParameter( "@TotalAmount",  objbooking.TotalAmount),
                new SqlParameter( "@SponserId",  objbooking.SponserId),
                new SqlParameter( "@NomineeName",  objbooking.NomineeName),
                new SqlParameter( "@NomineeRelation",  objbooking.NomineeRelation),
                new SqlParameter("@PaymentMode",objbooking.PaymentMode),
                new SqlParameter("@BankName",objbooking.BankName),
                new SqlParameter("@BranchName",objbooking.BranchName),
                new SqlParameter("@ChequeNo",objbooking.ChequeNo),
                new SqlParameter("@ChequeDate",objbooking.ChequeDate),
                new SqlParameter("@OnlineTransactionId",objbooking.OnlineTransactionTransactionNo),
                new SqlParameter("@MentionBy",objbooking.MentionBy),
                new SqlParameter("@PaidAmount",objbooking.PaidAmount),
              


                };
                DataTable dt = new DataTable();
                dt = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                res = dt.Rows[0][0].ToString();
                if (res == "t")
                {

                    //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=sandhya&password=sandhya12&msisdn=" + dt.Rows[0]["mobile"].ToString() + "&sid=SENDIT&msg=" + "Dear User your plot is successfully booked on prideandproperty.net.in. Your booking id is : " + dt.Rows[0]["accountno"].ToString() + "&fl=0&gwid=2";
                    //string Result = url.CallURL();
                    //Insert_SendSMS(dt.Rows[0]["mobile"].ToString(), Result, url);

                    //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=SECURE&password=SECURE&msisdn=" + dt.Rows[0]["mobile"].ToString() + "&sid=SECURE&msg=" + "Dear User your plot is successfully booked on securemaxs.com. Your booking id is : " + dt.Rows[0]["accountno"].ToString() + "&fl=0&gwid=2";
                    //string Result = url.CallURL();
                    //Insert_SendSMS(dt.Rows[0]["mobile"].ToString(), Result, url);
                    i = 1;
                    //   res = dt.Rows[0]["accountno"].ToString();
                }

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

        public string Reverse_IPBooking(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_reverseIpBooking";
                SqlParameter[] parameter = {
                 new SqlParameter("@accountno",objbooking.BookingId),
                new SqlParameter("@deleteby",objbooking.MentionBy),
                new SqlParameter("@remark",objbooking.Remark),
                };
                DataTable dt = new DataTable();
                dt = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                res = dt.Rows[0][0].ToString();
                if (res == "t")
                {
                    i = 1;
                    //   res = dt.Rows[0]["accountno"].ToString();
                }

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
        public string Insert_DPBooking(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_add_DPBooking";

                SqlParameter[] parameter = {

                new SqlParameter( "@Userid",  objbooking.UserId),
                new SqlParameter( "@BookingDate",  objbooking.BookingDate),
                new SqlParameter( "@PlotId",  objbooking.PlotId),
                new SqlParameter( "@PlanId", objbooking.PlanId),
                new SqlParameter( "@AmtPerSqft",  objbooking.LandAmountUnit),
                new SqlParameter( "@PlotAmount",  objbooking.PlotAmount),
                new SqlParameter( "@OtherCharges",  objbooking.OtherCharge),
                new SqlParameter( "@BookingAmount",  objbooking.BookingAmount),
                new SqlParameter( "@TotalAmount",  objbooking.TotalAmount),
                new SqlParameter( "@SponserId",  objbooking.SponserId),
                new SqlParameter( "@NomineeName",  objbooking.NomineeName),
                new SqlParameter( "@NomineeRelation",  objbooking.NomineeRelation),
                new SqlParameter("@PaymentMode",objbooking.PaymentMode),
                new SqlParameter("@BankName",objbooking.BankName),
                new SqlParameter("@BranchName",objbooking.BranchName),
                new SqlParameter("@ChequeNo",objbooking.ChequeNo),
                new SqlParameter("@ChequeDate",objbooking.ChequeDate),
                new SqlParameter("@OnlineTransactionId",objbooking.OnlineTransactionTransactionNo),
                new SqlParameter("@MentionBy",objbooking.MentionBy),
                new SqlParameter("@PaidAmount",objbooking.PaidAmount),
                new SqlParameter("@PLCName",objbooking.PLCName),



                };
                DataTable dt = new DataTable();
                dt = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                res = dt.Rows[0][0].ToString();
                if (res == "t")
                {
                    //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=SECURE&password=SECURE&msisdn=" + dt.Rows[0]["mobile"].ToString() + "&sid=SECURE&msg=" + "Dear User your plot is successfully booked on securemaxs.com. Your booking id is : " + dt.Rows[0]["accountno"].ToString() + "&fl=0&gwid=2";
                    //string Result = url.CallURL();
                    //Insert_SendSMS(dt.Rows[0]["mobile"].ToString(), Result, url);
                    i = 1;
                    //   res = dt.Rows[0]["accountno"].ToString();
                }

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
        public string Insert_MISDetail(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_add_MISDetail";

                SqlParameter[] parameter = {
                new SqlParameter("@UserId",  objbooking.UserId),
                new SqlParameter("@SponserId",  objbooking.SponserId),
                new SqlParameter("@InvestmentAmount",  objbooking.InvestmentAmount),
                new SqlParameter("@Period",  objbooking.Period),
                new SqlParameter("@ReturnMode",  objbooking.ReturnMode),
                new SqlParameter("@ReturnAmount",  objbooking.ReturnAmount),
                new SqlParameter("@TotalAmount",  objbooking.TotalAmount),
                new SqlParameter("@PaymentDate",  objbooking.PaymentDate),
                new SqlParameter("@PaymentMode",objbooking.PaymentMode),
                new SqlParameter("@BankName",objbooking.BankName),
                new SqlParameter("@BranchName",objbooking.BranchName),
                new SqlParameter("@ChequeNo",objbooking.ChequeNo),
                new SqlParameter("@ChequeDate",objbooking.ChequeDate),
                new SqlParameter("@OnlineTransactionId",objbooking.OnlineTransactionTransactionNo),
                new SqlParameter("@MentionBy",objbooking.MentionBy)
                };
                DataTable dt = new DataTable();
                dt = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                res = dt.Rows[0][0].ToString();
                if (res == "t")
                {
                    //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=SECURE&password=SECURE&msisdn=" + dt.Rows[0]["mobile"].ToString() + "&sid=SECURE&msg=" + "Dear User your MIS account is successfully booked on securemaxs.com. Your booking id is : " + dt.Rows[0]["accountno"].ToString() + "&fl=0&gwid=2";
                    //string Result = url.CallURL();
                    //Insert_SendSMS(dt.Rows[0]["mobile"].ToString(), Result, url);
                    i = 1;
                    //   res = dt.Rows[0]["accountno"].ToString();
                }

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
        public string Insert_MISInstallmentDetail(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_add_MISInstallmentDetail";

                SqlParameter[] parameter = {
                new SqlParameter("@accountno",  objbooking.BookingId),
                new SqlParameter("@instno",  objbooking.InstNo),
                new SqlParameter("@instdate",  objbooking.InstDate),
                new SqlParameter("@instamount",  objbooking.InstAmount),
                new SqlParameter("@PaymentDate",  objbooking.PaymentDate),
                new SqlParameter("@PaymentMode",objbooking.PaymentMode),
                new SqlParameter("@BankName",objbooking.BankName),
                new SqlParameter("@BranchName",objbooking.BranchName),
                new SqlParameter("@ChequeNo",objbooking.ChequeNo),
                new SqlParameter("@ChequeDate",objbooking.ChequeDate),
                new SqlParameter("@OnlineTransactionId",objbooking.OnlineTransactionTransactionNo),
                new SqlParameter("@MentionBy",objbooking.MentionBy)
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);

                //string msg = "";
                //msg = "Dear User " + objUser.UserName + " ,You are registerd Successfully on " + objUser.RegDate.ToString("dd/MM/yyyy") + ", Your User Id " + res + " and password is " + objUser.Mobile;
                //ObjData.SendMsg(objUser.Mobile, msg);

                i = 1;

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

        public string Insert_SendSMS(string str_Mobile, string str_Result, string str_Message)
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
                s2 = "insert into SendSms(CreateDate,Mobile,Result,Message)  values (getdate(),'" + str_Mobile + "','" + str_Result + "','" + str_Message + "') ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
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
        public string Insert_Booking(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_add_BookingDetail";

                SqlParameter[] parameter = {

                new SqlParameter( "@UserId",  objbooking.UserId),
                new SqlParameter( "@PlotId",  objbooking.PlotId),
                new SqlParameter( "@AmountPerSqft",  objbooking.AmountPerSqft),
                new SqlParameter( "@TotalAmount",  objbooking.TotalAmount),
                new SqlParameter( "@PlanId", objbooking.PlanId),
                new SqlParameter( "@TotalInstallment",  objbooking.TotalInstallment),
                new SqlParameter( "@InstallmentAmount",  objbooking.InstallmentAmount),
                new SqlParameter( "@MentionBy",  objbooking.MentionBy),


                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);

                //string msg = "";
                //msg = "Dear User " + objUser.UserName + " ,You are registerd Successfully on " + objUser.RegDate.ToString("dd/MM/yyyy") + ", Your User Id " + res + " and password is " + objUser.Mobile;
                //ObjData.SendMsg(objUser.Mobile, msg);

                i = 1;

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


        public string Pay_IPInstallment(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_PayIPInstallment";

                SqlParameter[] parameter = {

                new SqlParameter( "@accountno",  objbooking.BookingId),
                new SqlParameter( "@InstNo",  objbooking.InstNo),
                new SqlParameter( "@paymentdate",  objbooking.PaidDate),
                new SqlParameter( "@instdate",  objbooking.InstDate),
                new SqlParameter( "@instamt",  objbooking.InstAmount),
                new SqlParameter("@PaymentMode",objbooking.PaymentMode),
                new SqlParameter("@BankName",objbooking.BankName),
                new SqlParameter("@BranchName",objbooking.BranchName),
                new SqlParameter("@ChequeNo",objbooking.ChequeNo),
                new SqlParameter("@ChequeDate",objbooking.ChequeDate),
                new SqlParameter("@OnlineTransactionId",objbooking.OnlineTransactionTransactionNo),
                new SqlParameter("@MentionBy",objbooking.MentionBy)


                };
                DataTable dt = new DataTable();
                dt = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                res = dt.Rows[0][0].ToString();
                if (res == "t")
                {

                    //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=sandhya&password=sandhya12&msisdn=" + dt.Rows[0]["mobile"].ToString() + "&sid=SENDIT&msg=" + "Dear User Installment of amount Rs " + objbooking.InstAmount .ToString()+ " of account no "+objbooking.BookingId+" paid successfully on prideandproperty.net.in.&fl=0&gwid=2";
                    //string Result = url.CallURL();
                    //Insert_SendSMS(dt.Rows[0]["mobile"].ToString(), Result, url);

                    //string url = "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=SECURE&password=SECURE&msisdn=" + dt.Rows[0]["mobile"].ToString() + "&sid=SECURE&msg=" + "Dear User your plot is successfully booked on securemaxs.com. Your booking id is : " + dt.Rows[0]["accountno"].ToString() + "&fl=0&gwid=2";
                    //string Result = url.CallURL();
                    //Insert_SendSMS(dt.Rows[0]["mobile"].ToString(), Result, url);
                    i = 1;
                    //   res = dt.Rows[0]["accountno"].ToString();
                }




                i = 1;

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

        public string Pay_IPBalanceDP(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_PayIPBalanceDP";

                SqlParameter[] parameter = {

                new SqlParameter( "@accountno",  objbooking.BookingId),
                new SqlParameter( "@paymentdate",  objbooking.PaidDate),
                new SqlParameter( "@Paidamt",  objbooking.InstAmount),
                new SqlParameter("@PaymentMode",objbooking.PaymentMode),
                new SqlParameter("@BankName",objbooking.BankName),
                new SqlParameter("@BranchName",objbooking.BranchName),
                new SqlParameter("@ChequeNo",objbooking.ChequeNo),
                new SqlParameter("@ChequeDate",objbooking.ChequeDate),
                new SqlParameter("@OnlineTransactionId",objbooking.OnlineTransactionTransactionNo),
                new SqlParameter("@MentionBy",objbooking.MentionBy)


                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);

                i = 1;

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

        public string Edit_ChequeStatus(clsBooking objbooking)
        {
            int i = 0;
            string s2 = "";
            string res = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_editchequestatus";

                SqlParameter[] parameter = {

                new SqlParameter( "@id",  objbooking.Id),
              
                new SqlParameter("@Status",objbooking.ChequeStatus)


                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);

                i = 1;

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
        public string ClearCheque(clsBooking objbooking)
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
                s2 = "select * from chequedetail where id=" + objbooking.ChequeId + " and chequestatus='Pending' ";
                DataTable dt = new DataTable();
                dt = ObjData.RunSelectQueryTTrans(s2, tr);
                if (dt.Rows.Count == 0)
                {
                    s2 = "update ChequeDetail set ChequeStatus='Clear' , PaymentStatus='Clear' , ClearingDate =getdate()   where  id=" + objbooking.ChequeId + " ";
                    ObjData.RunInsUpDelQueryTrans(s2, tr);
                    res = "t";
                }
                else
                {
                    res = "f";
                }
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



        public string FullFinalBooking(clsBooking objbooking)
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
                s2 = "select * from plotdetail where  plotid=" + objbooking.PlotId + " and PlotStatus !='Final' ";
                DataTable dt = new DataTable();
                dt = ObjData.RunSelectQueryTTrans(s2, tr);
                if (dt.Rows.Count > 0)
                {
                    s2 = "update bookingdetail  set FullFinalAmount='" + objbooking.FullFinalAmount + "' , FullFinalDate='" + objbooking.FullFinalDate + "'    where  bookingid='" + objbooking.BookingId + "' ";
                    ObjData.RunInsUpDelQueryTrans(s2, tr);

                    s2 = "update plotdetail  set PlotStatus ='Final'     where   plotid=" + objbooking.PlotId + "  ";
                    ObjData.RunInsUpDelQueryTrans(s2, tr);

                    res = "t";
                }
                else
                {
                    res = "f";
                }
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
