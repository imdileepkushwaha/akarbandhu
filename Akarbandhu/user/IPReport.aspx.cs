using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserReport : System.Web.UI.Page
{
    clsBooking objbooking = new clsBooking();
    clsProject objProject = new clsProject();
    clsPlan objplan = new clsPlan();
    int counter = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            if (!IsPostBack)
            {
                txtcustomerid.Text = Session["userid"].ToString();
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
        objbooking.SponserId = txtassociateid.Text;
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
        dt = objbooking.getIPBooking(objbooking);
        if (dt.Rows.Count > 0)
        {
            //   pnllist.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.FooterRow.Cells[8].Text = "Total";
            GridView1.FooterRow.Cells[9].Text = dt.Compute("Sum(plotamount)", "").ToString();
            GridView1.FooterRow.Cells[10].Text = dt.Compute("Sum(bookingamount)", "").ToString();
            GridView1.FooterRow.Cells[11].Text = dt.Compute("Sum(totalpaid)", "").ToString();
        }
        else
        {
            // pnllist.Visible = false;
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
        if (e.CommandName == "Inst")
        {
            int index = Convert.ToInt32(e.CommandArgument);

            Label lblregid = (Label)GridView1.Rows[index].FindControl("lblBookingid");
            objbooking.BookingId = lblregid.Text;
            DataTable dt = new DataTable();
            dt = objbooking.getInstallment(objbooking);

            grdInstallment.DataSource = dt;
            grdInstallment.DataBind();


            DataTable dt2 = new DataTable();
            objbooking.BookingId = lblregid.Text;
            dt2 = objbooking.getBookingDetailForInst(objbooking);

            if (dt2.Rows.Count > 0)
            {
                lblBookingid.Text = dt2.Rows[0]["accountno"].ToString();
                lblcustomerid.Text = dt2.Rows[0]["userid"].ToString();
                lblcustomername.Text = dt2.Rows[0]["username"].ToString();
                lblplanname.Text = dt2.Rows[0]["PlanName"].ToString();
                lblbookingdate.Text = Convert.ToDateTime(dt2.Rows[0]["bookingdate"].ToString()).ToString("dd/MM/yyyy");
                lblbookingamount.Text = dt2.Rows[0]["BookingAmount"].ToString();
                lblinstno.Text = dt2.Rows[0]["newinstno"].ToString();
                lblinstamount.Text = dt2.Rows[0]["instamt"].ToString();
                lblinstduedate.Text = dt2.Rows[0]["instdate"].ToString();
            }

            pnlInstallment.Visible = true;
         //   pnlDPPayment.Visible = false;
        }
        //else
        //    if (e.CommandName == "mypay")
        //{
        //    DataTable dt2 = new DataTable();
        //    int index = Convert.ToInt32(e.CommandArgument);

        //    Label lblregid = (Label)GridView1.Rows[index].FindControl("lblBookingid");
        //    objbooking.BookingId = lblregid.Text;
        //    dt2 = objbooking.getBookingDetailForInst(objbooking);

        //    if (dt2.Rows.Count > 0)
        //    {
        //        lblbookingiddp.Text = dt2.Rows[0]["accountno"].ToString();
        //        lblcustomeriddp.Text = dt2.Rows[0]["memberid"].ToString();
        //        lblcustomernamedp.Text = dt2.Rows[0]["membername"].ToString();
        //        lblplannamedp.Text = dt2.Rows[0]["PlanName"].ToString();
        //        lblbookingdatedp.Text = Convert.ToDateTime(dt2.Rows[0]["bookingdate"].ToString()).ToString("dd/MM/yyyy");
        //        lblbookingamountdp.Text = dt2.Rows[0]["BookingAmount"].ToString();
        //        lblpaidamountdp.Text = dt2.Rows[0]["totalpaid"].ToString();
        //        txtbalanceamountdp.Text = dt2.Rows[0]["balancedp"].ToString();
        //        lblbalanceamountdp.Text = dt2.Rows[0]["balancedp"].ToString();

        //    }

        //    pnlDPPayment.Visible = true;
        //    pnlInstallment.Visible = false;
        //}
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
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        if (txtpaymentdate.Text != "")
        {
            if (ddpaymentmode.SelectedValue.ToString() != "0")
            {


                string str_chequedate = "";
                if (txtchequedate.Text != "")
                {
                    str_chequedate = Message.GetIndianDate(txtchequedate.Text).ToString();
                }


                objbooking.BookingId = lblBookingid.Text;
                objbooking.InstNo = Convert.ToInt32(lblinstno.Text);
                objbooking.InstAmount = Convert.ToDecimal(lblinstamount.Text);
                objbooking.PaidDate = Message.GetIndianDate(txtpaymentdate.Text);
                objbooking.PaymentMode = ddpaymentmode.SelectedValue.ToString();
                objbooking.BankName = txtbankname.Text;
                objbooking.BranchName = txtbranchname.Text;
                objbooking.ChequeNo = txtchequeno.Text;
                objbooking.ChequeDate = Message.GetIndianDate(txtchequedate.Text);
                objbooking.InstDate = Message.GetIndianDate(lblinstduedate.Text);
                objbooking.ChequeNo = txtchequeno.Text;
                if (txtchequedate.Text != "")
                {
                    objbooking.ChequeDate = Message.GetIndianDate(txtchequedate.Text);
                }
                else
                {
                    objbooking.ChequeDate = Message.GetIndianDate("01/01/1900");
                }
                objbooking.BankName = txtbankname.Text;
                objbooking.BranchName = txtbranchname.Text;
                objbooking.OnlineTransactionTransactionNo = txtonlinetransactionid.Text;

                objbooking.OnlineTransactionTransactionNo = txtonlinetransactionid.Text;
                objbooking.MentionBy = Session["useradmin"].ToString();
                string res = objbooking.Pay_IPInstallment(objbooking);
                if (res == "t")
                {
                    Message.Show("Installment Paid Succerssfully...!!!");
                    pnlInstallment.Visible = false;
                }
                else
                    if (res == "f")
                {
                    Message.Show("Please Pay Previous Installment First...!!!");
                }
                else
                        if (res == "r")
                {
                    Message.Show("Installment Already Paid...!!!");
                }


            }
            else
            {
                Message.Show("Select Payment Mode...!!!");
            }

        }
        else
        {
            Message.Show("Enter Payment Date");
        }
        END:;
    }

    protected void ddpaymentmode_SelectedIndexChanged(object sender, EventArgs e)
    {
        changepaymentmode();
    }
    void changepaymentmode()
    {
        if (ddpaymentmode.SelectedValue.ToString() == "Cheque")
        {
            ChequeDetail.Visible = true;
        }
        else
        {
            ChequeDetail.Visible = false;
        }
    }

    void clearpaymentdetail()
    {
        txtbankname.Text = "";
        txtbranchname.Text = "";
        txtchequeno.Text = "";
        txtchequedate.Text = "";

        txtonlinetransactionid.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}