using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class admin_DPReport : System.Web.UI.Page
{
    clsBooking objbooking = new clsBooking();
    clsProject objProject = new clsProject();
    clsPlan objplan = new clsPlan();
    int counter = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
                LoadProject();
                //       loadbankAccountNo();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    //void loadbankAccountNo()
    //{
    //    ddcashaccountno.Items.Clear();
    //    ddonlineaccountno.Items.Clear();

    //    DataTable dt = new DataTable();
    //    dt = objplan.getBankAccountDetail();
    //    if (dt.Rows.Count > 0)
    //    {
    //        ddcashaccountno.DataSource = dt;
    //        ddcashaccountno.DataTextField = dt.Columns["AccountNo2"].ToString();
    //        ddcashaccountno.DataValueField = dt.Columns["AccountNo"].ToString();
    //        ddcashaccountno.DataBind();
    //    }

    //    if (dt.Rows.Count > 0)
    //    {
    //        ddonlineaccountno.DataSource = dt;
    //        ddonlineaccountno.DataTextField = dt.Columns["AccountNo2"].ToString();
    //        ddonlineaccountno.DataValueField = dt.Columns["AccountNo"].ToString();
    //        ddonlineaccountno.DataBind();
    //    }


    //    ListItem li = new ListItem("Select Account No", "0");
    //    ddcashaccountno.Items.Insert(0, li);
    //    ddonlineaccountno.Items.Insert(0, li);
    //}
    void LoadProject()
    {
        ddproject.Items.Clear();
        DataTable dt = new DataTable();
        dt = objProject.getProject();
        if (dt.Rows.Count > 0)
        {
            ddproject.DataSource = dt;
            ddproject.DataTextField = dt.Columns["ProjectName"].ToString();
            ddproject.DataValueField = dt.Columns["ProjectId"].ToString();
            ddproject.DataBind();
        }
        ListItem li = new ListItem("Select Project", "0");
        ddproject.Items.Insert(0, li);
    }
    void LoadBlock()
    {
        ddblock.Items.Clear();
        DataTable dt = new DataTable();
        objProject.ProjectId = ddproject.SelectedValue.ToString();
        dt = objProject.getBlock(objProject);
        if (dt.Rows.Count > 0)
        {
            ddblock.DataSource = dt;
            ddblock.DataTextField = dt.Columns["BlockName"].ToString();
            ddblock.DataValueField = dt.Columns["BlockId"].ToString();
            ddblock.DataBind();
        }
        ListItem li = new ListItem("Select Block", "0");
        ddblock.Items.Insert(0, li);
    }
    void loadplot()
    {
        ddplot.Items.Clear();
        DataTable dt = new DataTable();
        objProject.ProjectId = ddproject.SelectedValue.ToString();
        objProject.BlockId = ddblock.SelectedValue.ToString();
        objProject.PlotNo = "";
        dt = objProject.getPlot(objProject);
        if (dt.Rows.Count > 0)
        {
            ddplot.DataSource = dt;
            ddplot.DataTextField = dt.Columns["PlotNo"].ToString();
            ddplot.DataValueField = dt.Columns["PlotId"].ToString();
            ddplot.DataBind();
        }
        ListItem li = new ListItem("Select Plot", "0");
        ddplot.Items.Insert(0, li);
    }
    protected void ddproject_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadBlock();
        loadplot();
    }
    void loaddata()
    {
        objbooking.UserName = txtcustomername.Text.Trim();
        objbooking.UserId = txtcustomerid.Text.Trim();
        objbooking.BookingId = txtbookingid.Text;
        objbooking.AssociateId = txtassociateid.Text;
        objbooking.ProjectId = ddproject.SelectedValue.ToString();
        objbooking.BlockId = ddblock.SelectedValue.ToString();
        objbooking.PlotId = ddplot.SelectedValue.ToString();
        if (txtfromdate.Text != "" && txttodate.Text != "")
        {
            objbooking.FromDate = Message.GetIndianDate(txtfromdate.Text);
            objbooking.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objbooking.FromDate = DateTime.MinValue;
            objbooking.ToDate = DateTime.MinValue;
        }
        DataTable dt = new DataTable();
        dt = objbooking.getIPBookingReverse(objbooking);
        if (dt.Rows.Count > 0)
        {
            pnllist.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.FooterRow.Cells[9].Text = "Total";
            GridView1.FooterRow.Cells[10].Text = dt.Compute("Sum(plotamount)", "").ToString();
            GridView1.FooterRow.Cells[11].Text = dt.Compute("Sum(bookingamount)", "").ToString();
            GridView1.FooterRow.Cells[12].Text = dt.Compute("Sum(totalpaid)", "").ToString();
        }
        else
        {
            pnllist.Visible = false;
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaddata();
    }
    protected void ddblock_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadplot();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       
            if (e.CommandName == "mypay")
        {
            DataTable dt2 = new DataTable();
            int index = Convert.ToInt32(e.CommandArgument);

            Label lblregid = (Label)GridView1.Rows[index].FindControl("lblBookingid");
            Label lblpaidamount = (Label)GridView1.Rows[index].FindControl("lblpaidamount");

            lblbookingidedit.Text = lblregid.Text;
            lblpaidamountedit.Text = lblpaidamount.Text;
          

            pnlDPPayment.Visible = true;
          
        }
    }
    protected void grdInstallment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    Label lblinststatus = (Label)e.Row.FindControl("lblinststatus");
        //    Label lblBookingid = (Label)e.Row.FindControl("lblBookingid");
        //    Label lblinstno = (Label)e.Row.FindControl("lblinstno");
        //    Literal ltinstaction = (Literal)e.Row.FindControl("ltinstaction");
        //    if (lblinststatus.Text == "DUE")
        //    {
        //        if (counter == 0)
        //        {
        //            ltinstaction.Text = @"<a href='IPInstallment.aspx?BookingId=" + lblBookingid.Text + @"&InstNo=" + lblinstno.Text + "' >Pay</a>";
        //        }
        //        counter++;
        //    }
        //    else
        //        if (lblinststatus.Text == "PAID")
        //        {
        //            ltinstaction.Text = @"<a href='InstallmentReceipt.aspx?BookingId=" + lblBookingid.Text + @"&InstNo=" + lblinstno.Text + "' target='_blank' >Receipt</a>";
        //        }
        //}
    }

 
 
   

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    Label lblreversestatus = (Label)e.Row.FindControl("lblreversestatus");
        //    LinkButton btnPay = (LinkButton)e.Row.FindControl("btnPay");
        //    if (lblreversestatus.Text== "Not Paid")
        //    {
        //        btnPay.Visible = true;
             
        //    }
        //    else
        //    {
        //        btnPay.Visible = false;
                
        //    }

        //}
    }

    protected void ddpaymentmodedp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddpaymentmodeedit.SelectedValue.ToString() == "Cheque")
        {
            Div1DP.Visible = true;
        }
        else
        {
            Div1DP.Visible = false;
        }
    }

    protected void btnPayDP_Click(object sender, EventArgs e)
    {
       
        //    if (txtpaymentdateedit.Text != "")
        //    {
        //        if (ddpaymentmodeedit.SelectedValue.ToString() != "0")
        //        {


        //            string str_chequedate = "";
        //            if (txtchequedateedit.Text != "")
        //            {
        //                str_chequedate = Message.GetIndianDate(txtchequedateedit.Text).ToString();
        //            }


        //            objbooking.BookingId = lblbookingidedit.Text;
        //            objbooking.InstAmount = Convert.ToDecimal(lblpaidamountedit.Text);
        //            objbooking.PaidDate = Message.GetIndianDate(txtpaymentdateedit.Text);
        //            objbooking.PaymentMode = ddpaymentmodeedit.SelectedValue.ToString();
        //            objbooking.BankName = txtbanknameedit.Text;
        //            objbooking.BranchName = txtbranchnameedit.Text;
        //            objbooking.ChequeNo = txtchequenoedit.Text;
        //            objbooking.ChequeDate = Message.GetIndianDate(txtchequedateedit.Text);
        //            objbooking.ChequeNo = txtchequenoedit.Text;
        //            if (txtchequedateedit.Text != "")
        //            {
        //                objbooking.ChequeDate = Message.GetIndianDate(txtchequedateedit.Text);
        //            }
        //            else
        //            {
        //                objbooking.ChequeDate = Message.GetIndianDate("01/01/1900");
        //            }
        //            objbooking.BankName = txtbanknameedit.Text;
        //            objbooking.BranchName = txtbranchnameedit.Text;
        //            objbooking.OnlineTransactionTransactionNo = txttransactionidedit.Text;

        //             objbooking.MentionBy = Session["useradmin"].ToString();
        //            string res = objbooking.Pay_IPReversePayment(objbooking);
        //            if (res == "t")
        //            {
        //                Message.Show("DP Paid Succerssfully...!!!");
        //                pnlDPPayment.Visible = false;
        //                txtbanknameedit.Text = "";
        //                txtbranchnameedit.Text = "";
        //                txtchequenoedit.Text = "";
        //                txtchequedateedit.Text = "";

        //                txttransactionidedit.Text = "";
        //                ddpaymentmodeedit.SelectedValue = "0";
        //                loaddata();
        //            }
        //        }
        //        else
        //        {
        //            Message.Show("Select Payment Mode...!!!");
        //        }

        //    }
        //    else
        //    {
        //        Message.Show("Enter Payment Date");
        //    }
       
        //END:;

    }
}