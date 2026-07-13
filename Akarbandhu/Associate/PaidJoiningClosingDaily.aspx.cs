﻿using BusinessLogicTier;
using System;
using System.Collections;
using DataTier;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaidJoiningClosingDaily : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    clsClosing objCL = new clsClosing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["associateid"] != null)
            {

                TxtUserId.Text = Session["associateid"].ToString();
                loaduser();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            Label lblstatus = (Label)e.Row.FindControl("lblstatus");
            CheckBox chk = (CheckBox)e.Row.FindControl("chk");
            if (lblstatus.Text == "PAID")
            {
                chk.Checked = false;
                chk.Enabled = false;

            }
        }
    }
    protected void btnpay_Click(object sender, EventArgs e)
    {
        int chkcount = 0;
        ArrayList IdList = new ArrayList();
        ArrayList UserList = new ArrayList();
        ArrayList AmountList = new ArrayList();
        ArrayList MobileList = new ArrayList();
        ArrayList TList = new ArrayList();
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("chk");
            Label lblPaybleAmount = (Label)GridView1.Rows[i].FindControl("lblmathingBv");
            Label lblId = (Label)GridView1.Rows[i].FindControl("lblId");
            Label lbluserid = (Label)GridView1.Rows[i].FindControl("lbluserid");
            Label LabMobile = (Label)GridView1.Rows[i].FindControl("LabMobile");
            TextBox TxtTransaction = (TextBox)GridView1.Rows[i].FindControl("TxtTransaction");


            if (chk.Checked == true)
            {
                IdList.Add(lblId.Text);
                UserList.Add(lbluserid.Text);
                AmountList.Add(lblPaybleAmount.Text);
                MobileList.Add(LabMobile.Text);
                TList.Add(TxtTransaction.Text);
                chkcount = chkcount + 1;
            }

        }

        if (chkcount == 0)
        {
            Message.Show("Please select any row");
            return;
        }
        else
        {
            int c = TransferPayoutmonthly(IdList, UserList, AmountList, MobileList, TList);
            if (c == 1)
            {
                loaddata();
                Message.Show("Payout Transferred Successfully");
            }
            else
            {
                Message.Show("Some Error Occurred");
            }
        }

    }



    public int TransferPayoutmonthly(ArrayList arrId, ArrayList arrUser, ArrayList arrAmount, ArrayList arrmobile, ArrayList TList)
    {
        int c = 0;
        int arrcount = 0;
        SqlConnection cn;
        SqlTransaction tr = null;
        DataSet ds = new DataSet();
        cn = ObjData.StartConnectionInTransaction();
        tr = cn.BeginTransaction(IsolationLevel.Serializable);
        try
        {
            string str = "Proc_TransferPayout_Binary";

            for (int i = 0; i < arrId.Count; i++)
            {

                SqlParameter[] sqm = new SqlParameter[]
                {
                 new SqlParameter("@Amount", arrAmount[i].ToString()),
                 new SqlParameter("@UserId", arrUser[i].ToString()),
                 new SqlParameter("@id", arrId[i].ToString()),
                   new SqlParameter("@paymentTransactionId", TList[i].ToString())

                };
                DataTable dt = ObjData.RunDataTableProcedureTRans(str, tr, sqm);

                if (dt.Rows[0][0].ToString() == "-1")
                {
                    c = 0;
                    tr.Rollback();
                    break;
                }

                //    string url = string.Concat(new string[]
                //{
                //    "http://sms.sandhyasoftware.com/vendorsms/pushsms.aspx?user=mdsm&password=mdsm12&msisdn=",
                //    arrmobile[i].ToString(),
                //    "&sid=MANAVD&msg=Congratulation ! You have achieved Payout Rs. " + arrAmount[i].ToString() + " successfully from mdsm.in",
                //    "&fl=0&gwid=2"
                //});
                //    string Result = url.CallURL();

                //    //string smsBody = "Congratulation ! You have achieved Payout Rs. " + arrAmount[i].ToString() + " successfully from mdsm.in";
                //    //string url = "http://www.apihub.online/api/Services/transact?token=99a9eea2b24341ad760c2ac9e4c45031&skey=SST&to=" + arrmobile[i].ToString() + "&sender=ETOPUP&smstext=" + smsBody + "&smsformat=TEXT&format=json";
                //    //string Result = url.CallURL();
                //    string s2 = "insert into SendSms(CreateDate,Mobile,Result,Message)  values (getdate(),'" + arrmobile[i].ToString() + "','" + Result + "','" + url + "') ";
                //    ObjData.RunInsUpDelQueryTrans(s2, tr);
                arrcount = arrcount + 1;
            }

            if (arrcount == arrId.Count)
            {
                c = 1;
                tr.Commit();
            }
            else
            {
                c = 0;
                tr.Rollback();
            }

        }
        catch (Exception ex)
        {
            c = 0;
            tr.Rollback();
        }
        finally
        {
            ObjData.EndConnection();
            tr.Dispose();
        }
        return c;
    }

    void loaduser()
    {

        DataTable dt = new DataTable();
        dt = getMonthJoiningClosingDate();
        DDlstFromdate.DataSource = dt;
        DDlstFromdate.DataTextField = "ClosingDate";
        DDlstFromdate.DataValueField = "ClosingDate";
        DDlstFromdate.DataBind();
        ListItem li = new ListItem("Select Date", "0");
        DDlstFromdate.Items.Insert(0, li);
    }
    public DataTable getMonthJoiningClosingDate()
    {
        string str_query = "select Distinct Fromdate,Todate,'' AS ClosingDate from WeeklyClosingMaster";

        DataTable ds = null;
        ObjData.StartConnection();
        try
        {

            ds = ObjData.RunDataTable(str_query);
            if (ds.Rows.Count > 0)
            {

                foreach (DataRow Dr in ds.Rows)
                {
                    Dr["ClosingDate"] = Convert.ToDateTime(Dr["Fromdate"].ToString()).ToString("dd/MMM/yyyy") + "=" + Convert.ToDateTime(Dr["Todate"].ToString()).ToString("dd/MMM/yyyy");
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
    void loaddata()
    {
        string Fromdate = "";
        string Todatedate = "";
        string UserId = "";
        if (DDlstFromdate.SelectedIndex != 0)
        {
            string[] str = DDlstFromdate.SelectedValue.Split('=');
            Fromdate = str[0].ToString();
            Todatedate = str[1].ToString();
        }
        DataTable Dt = getMonthleyJoiningClosingReportDue(Fromdate, Todatedate, TxtUserId.Text);
        GridView1.DataSource = Dt;
        GridView1.DataBind();
        
    }


    public DataTable getMonthleyJoiningClosingReportDue(string FromDate, string Todate, string UserId)
    {
        {
            string str_query = "";
            str_query = "   SELECT w.leadershipincomee AS income,w.ID, W.TotalIncome,W.WeekNo,Convert(CHAR,W.Fromdate,103) AS Fromdate,Convert(CHAR,W.ToDate,103) AS Todate,W.UserID,W.Status,CASE WHEN W.Status=0 THEN 'DUE' ELSE 'PAID' END AS Status1,U.associatename,W.TransactionID,Convert(CHAR,GenerateDate,103) AS GenerateDate,Convert(CHAR,PaymentDate,103) AS PaymentDate,W.tds,W.tdsper,W.admincharge,W.paybleamount,W.Weekno,U.Mobile,U.accountno,U.ifsccode,U.AccountHolderName FROM WeeklyClosing W with(nolock) INNER JOIN AssociateDetail U with(nolock) ON W.UserID=U.associateid where 1=1 and W.Status=1";


            if (FromDate != string.Empty)
            {
                str_query += " and Cast(W.Fromdate as date)='" + FromDate + "'";
            }
            if (Todate != string.Empty)
            {
                str_query += " and Cast(W.ToDate as date)=dateadd(day,1,'" + Todate + "')";
            }
            if (UserId != string.Empty)
            {
                str_query += " and W.userid='" + UserId + "'";
            }
            str_query += " order by W.Weekno";
            DataTable ds = null;
            ObjData.StartConnection();
            try
            {
                ds = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            ObjData.EndConnection();
            return ds;
        }
    }
 
    protected void chckchanged(object sender, EventArgs e)
    {

        CheckBox chckheader = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox1");

        foreach (GridViewRow row in GridView1.Rows)
        {

            CheckBox chckrw = (CheckBox)row.FindControl("chk");

            if (chckheader.Checked == true)
            {
                chckrw.Checked = true;
            }
            else
            {
                chckrw.Checked = false;
            }

        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaddata();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    protected void ExportToExcel(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=PayoutReport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages


            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }


    //protected void BtnMessage_Click(object sender, EventArgs e)
    //{
    //    int chkcount = 0;
    //    ArrayList IdList = new ArrayList();
    //    ArrayList UserList = new ArrayList();
    //    ArrayList AmountList = new ArrayList();
    //    ArrayList MobileList = new ArrayList();
    //    ArrayList TList = new ArrayList();
    //    for (int i = 0; i < GridView1.Rows.Count; i++)
    //    {
    //        CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("chk");
    //        Label lblPaybleAmount = (Label)GridView1.Rows[i].FindControl("lblPaybleAmount");
    //        Label lblId = (Label)GridView1.Rows[i].FindControl("lblId");
    //        Label lbluserid = (Label)GridView1.Rows[i].FindControl("lblusername");
    //        Label LabMobile = (Label)GridView1.Rows[i].FindControl("LabMobile");
    //        TextBox TxtTransaction = (TextBox)GridView1.Rows[i].FindControl("TxtTransaction");


    //        if (chk.Checked == true)
    //        {
    //            IdList.Add(lblId.Text);
    //            UserList.Add(lbluserid.Text);
    //            AmountList.Add(lblPaybleAmount.Text);
    //            MobileList.Add(LabMobile.Text);
    //            TList.Add(TxtTransaction.Text);
    //            chkcount = chkcount + 1;
    //        }

    //    }

    //    if (chkcount == 0)
    //    {
    //        Message.Show("Please select any row");
    //        return;
    //    }
    //    else
    //    {
    //        int c = objCL.TransferPayoutMessgesend(IdList, UserList, AmountList, MobileList, TList);
    //        if (c == 1)
    //        {
    //            loaddata();
    //            Message.Show("Message send Successfully");
    //        }
    //        else
    //        {
    //            Message.Show("Some Error Occurred");
    //        }
    //    }

    //}

}