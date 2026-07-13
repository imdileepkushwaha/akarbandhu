using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserAdd : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    clsProject objProject = new clsProject();
    clsBooking objbooking = new clsBooking();
    clsPlan objplan = new clsPlan();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                LoadProject();
                loadplan();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loadplan()
    {
        ddplan.Items.Clear();
        objplan.PlanType = "IP";
        DataTable dt = new DataTable();
        dt = objplan.getPlanDetailByType(objplan);
        if (dt.Rows.Count > 0)
        {
            ddplan.DataSource = dt;
            ddplan.DataTextField = dt.Columns["PlanName"].ToString();
            ddplan.DataValueField = dt.Columns["PlanId"].ToString();
            ddplan.DataBind();
        }
        ListItem li = new ListItem("Select Plan", "0");
        ddplan.Items.Insert(0, li);
    }
    protected void ddplan_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddplot.SelectedValue != "0")
        {
            loadplandetail();
        }
        else
        {
            Message.Show("Please Select Plot First...!!!");
            ddplan.SelectedValue = "0";
        }
    }
    void loadplandetail()
    {
        if (ddplan.SelectedValue.ToString() != "0")
        {
            DataTable dt = new DataTable();
            objplan.PlanId = ddplan.SelectedValue.ToString();
            dt = objplan.getPlanDetailById(objplan);
            if (dt.Rows.Count > 0)
            {

                lblterms.Text = dt.Rows[0]["DepositTerm"].ToString();
                txtttoalinst.Text = dt.Rows[0]["DepositTerm"].ToString();
                lblbookingamount.Text = dt.Rows[0]["BookingAmount"].ToString();
                txtlandamount.Text = dt.Rows[0]["LandAmount"].ToString();
                txtplotamount.Text = Math.Round(((Convert.ToDecimal(txtlandamount.Text) * Convert.ToDecimal(txtlandarea.Text))), 2).ToString();
                txtothercharge.Text = "0";
                txttotalamount.Text = (Convert.ToDecimal(txtplotamount.Text) + Convert.ToDecimal(txtothercharge.Text)).ToString();
                //  txtbookingamount.Text = Math.Round((Convert.ToDecimal(txtlandamount.Text) * Convert.ToDecimal(txtlandarea.Text) * Convert.ToDecimal(dt.Rows[0]["BookingAmount"].ToString()) / 100), 2).ToString();
                txtbookingamount.Text =dt.Rows[0]["BookingAmount"].ToString();
                txtpaidamount.Text = txtbookingamount.Text;
                txtinstamount.Text = ((Convert.ToDecimal(txttotalamount.Text) - Convert.ToDecimal(txtbookingamount.Text)) / Convert.ToInt32(dt.Rows[0]["DepositTerm"].ToString())).ToString();
            }
            else
            {
                txtlandamount.Text = "";
                txtplotamount.Text = "";
                txtothercharge.Text = "";
                txttotalamount.Text = "";
                txtbookingamount.Text = "";
                lblterms.Text = "0";
            }

        }

    }
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
    void LoadPlot()
    {
        ddplot.Items.Clear();
        DataTable dt = new DataTable();
        objProject.ProjectId = ddproject.SelectedValue.ToString();
        objProject.BlockId = ddblock.SelectedValue.ToString();
        objProject.PlotNo = "";
        dt = objProject.getPlotForBooking(objProject);
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text != "")
        {
            if (txtbookingdate.Text != "")
            {
                if (txtusername.Text != "")
                {
                    if (txtsponserid.Text != "")
                    {

                        if (ddpaymentmode.SelectedValue.ToString() != "0")
                        {
                            if (ddpaymentmode.SelectedValue == "Cash")
                            {


                            }
                            else
                                if (ddpaymentmode.SelectedValue != "Cheque")
                            {

                            }
                            else
                                    if (ddpaymentmode.SelectedValue != "Online")
                            {

                            }
                            string str_chequedate = "";
                            if (txtchequedate.Text != "")
                            {
                                str_chequedate = Message.GetIndianDate(txtchequedate.Text).ToString();
                            }





                            objbooking.UserId = txtuserid.Text;
                            objbooking.BookingDate = Message.GetIndianDate(txtbookingdate.Text);
                            objbooking.SponserId = txtsponserid.Text;
                            objbooking.NomineeName = txtnomineename.Text;
                            objbooking.PlotId = ddplot.SelectedValue.ToString();
                            objbooking.PlanId = ddplan.SelectedValue.ToString();
                            objbooking.LandArea = Convert.ToDecimal(txtlandarea.Text);
                            objbooking.AmountPerSqft = Convert.ToDecimal(txtlandamount.Text);
                            objbooking.PlotAmount = Convert.ToDecimal(txtplotamount.Text);
                            objbooking.OtherCharge = Convert.ToDecimal(txtothercharge.Text);
                            objbooking.TotalAmount = Convert.ToDecimal(txttotalamount.Text);
                            objbooking.BookingAmount = Convert.ToDecimal(txtbookingamount.Text);



                            objbooking.NomineeRelation = txtnomineerelation.Text;

                            objbooking.PaymentMode = ddpaymentmode.SelectedValue.ToString();
                            objbooking.BankName = txtbankname.Text;
                            objbooking.BranchName = txtbranchname.Text;
                            objbooking.ChequeNo = txtchequeno.Text;
                            objbooking.ChequeDate = Message.GetIndianDate(txtchequedate.Text);
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
                            objbooking.PaidAmount = Convert.ToDecimal(txtpaidamount.Text);
                            objbooking.MentionBy = Session["useradmin"].ToString();
                            string res = objbooking.Insert_IPBooking(objbooking);
                            if (res == "0")
                            {
                                Message.Show("Unknown Error Occurred...!!!");
                            }
                            else
                                if (res == "f")
                            {
                                Message.Show("Can not Able To Book This Plot. This Plot Is Already Booked..!!!");
                            }
                            else
                            {
                                Message.Show("Plot Booked Successfully.");
                                clearvalues();

                            }
                        }
                        else
                        {
                            Message.Show("Select Payment Mode...!!!");
                        }

                    }
                    else
                    {
                        Message.Show("Enter Reference ID..");
                    }
                }

                else
                {
                    Message.Show("Enter Customer ID...");
                }
            }
            else
            {
                Message.Show("Enter Booking Date...");
            }
        }
        else
        {
            Message.Show("Enter Customer id...!!!");
        }
        END:;
    }
    void clearvalues()
    {
        txtbookingdate.Text = "";
        txtusername.Text = "";
        txtuserid.Text = "";
        txtsponsername.Text = "";
        txtnomineename.Text = "";
        txtnomineerelation.Text = "";
        txtuserid.Text = "";
        ddproject.SelectedValue = "0";
        LoadBlock();
        LoadPlot();
        ddplan.SelectedValue = "0";
        txtlandarea.Text = "";

        txtlandamount.Text = "";
        txtplotamount.Text = "";

        txtothercharge.Text = "";
        txttotalamount.Text = "";
        txtbookingamount.Text = "";
        txtmobile.Text = "";
        txtemail.Text = "";
        txtsponsername.Text = "";
        txtsponserid.Text = "";
        txtinstamount.Text = "";
        txtttoalinst.Text = "";
        clearpaymentdetail();
    }

    protected void ddproject_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadBlock();
    }


    void loadsusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();
            txtsponserid.Text = dt.Rows[0]["sponserid"].ToString();
            txtsponsername.Text = dt.Rows[0]["sponsername"].ToString();
            txtemail.Text = dt.Rows[0]["email"].ToString();
            txtmobile.Text = dt.Rows[0]["mobile"].ToString();
        }
        else
        {
            txtuserid.Text = "";
            txtusername.Text = "";
            txtsponserid.Text = "";
            txtsponsername.Text = "";
            txtemail.Text = "";
            txtmobile.Text = "";
            string popupScript = "toastr.error('Error', 'Invalid User Id');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {

        loadsusername();
    }

    protected void ddblock_TextChanged(object sender, EventArgs e)
    {
        LoadPlot();
    }
    protected void txtbookingamount_TextChanged(object sender, EventArgs e)
    {
        txtinstamount.Text = Math.Round((Convert.ToDecimal(txttotalamount.Text) - Convert.ToDecimal(txtbookingamount.Text)) / Convert.ToInt32(txtttoalinst.Text), 2).ToString();
    }

    protected void txtplotamount_TextChanged(object sender, EventArgs e)
    {
        txtinstamount.Text = Math.Round((Convert.ToDecimal(txttotalamount.Text) - Convert.ToDecimal(txtbookingamount.Text)) / Convert.ToInt32(txtttoalinst.Text), 2).ToString();
    }

    protected void txtlandamount_TextChanged(object sender, EventArgs e)
    {

        loadtotal();
    }
    void loadtotal()
    {
        decimal AmtPerSqft = 0.00M;
        decimal OtherCharges = 0.00M;
        decimal LandArea = 0.00M;
        decimal PlotAmount = 0.00M;
        decimal TotalAmount = 0.00M;
        decimal bookingamount = 0.00M;
        if (txtlandamount.Text != "")
        {
            AmtPerSqft = Convert.ToDecimal(txtlandamount.Text);
        }
        if (txtothercharge.Text != "")
        {
            OtherCharges = Convert.ToDecimal(txtothercharge.Text);
        }
        if (txtlandarea.Text != "")
        {
            LandArea = Convert.ToDecimal(txtlandarea.Text);
        }
        PlotAmount = LandArea * AmtPerSqft;
        TotalAmount = PlotAmount + OtherCharges;
        txtplotamount.Text = Math.Round(PlotAmount, 2).ToString();
        txttotalamount.Text = Math.Round(TotalAmount, 2).ToString();
     //   txtbookingamount.Text = Math.Round((Convert.ToDecimal(txtlandamount.Text) * Convert.ToDecimal(txtlandarea.Text) * Convert.ToDecimal(lblbookingamount.Text) / 100), 2).ToString();
        txtbookingamount.Text =lblbookingamount.Text;
        txtpaidamount.Text = txtbookingamount.Text;
        txtinstamount.Text = Math.Round((Convert.ToDecimal(txttotalamount.Text) - Convert.ToDecimal(txtbookingamount.Text)) / Convert.ToInt32(txtttoalinst.Text), 2).ToString();
    }

    protected void txtothercharge_TextChanged(object sender, EventArgs e)
    {
        loadtotal();
    }

    void loadplotdetail()
    {
        DataTable dt = new DataTable();
        objProject.PlotId = ddplot.SelectedValue.ToString();
        dt = objProject.getPlotDetailById(objProject);
        if (dt.Rows.Count > 0)
        {
            txtlandarea.Text = dt.Rows[0]["landarea"].ToString();

        }
        else
        {
            txtlandarea.Text = "";

        }
    }
    protected void ddplot_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadplotdetail();
        loadplandetail();
    }

    protected void txtsponserid_TextChanged(object sender, EventArgs e)
    {

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
}