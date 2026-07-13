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
                loadcategory();

            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }


    void loadcategory()
    {
        ddcategory.Items.Clear();
        DataTable dt = new DataTable();
        dt = objbooking.getCategory();
        if (dt.Rows.Count > 0)
        {
            ddcategory.DataSource = dt;
            ddcategory.DataTextField = dt.Columns["categoryname"].ToString();
            ddcategory.DataValueField = dt.Columns["id"].ToString();
            ddcategory.DataBind();
        }
        ListItem li = new ListItem("Select Category", "0");
        ddcategory.Items.Insert(0, li);
    }

    void loadcaegorydetail()
    {
        if (ddcategory.SelectedValue.ToString() != "0")
        {
            DataTable dt = new DataTable();
            objbooking.Id = ddcategory.SelectedValue.ToString();
            dt = objbooking.getCategoryDetail(objbooking);
            if (dt.Rows.Count > 0)
            {

                txttenure.Text = dt.Rows[0]["InstallmentMode"].ToString();
                txttotalinstallment.Text = dt.Rows[0]["TotalInstallment"].ToString();
                txtbv.Text = dt.Rows[0]["bv"].ToString();
            }
            else
            {
                txttenure.Text = "";
                txttotalinstallment.Text = "";
                txtbv.Text = "";

            }

        }
        else
        {
            txttenure.Text = "";
            txttotalinstallment.Text = "";
            txtbv.Text = "";

        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text != "")
        {
            if (txtsaledate.Text != "")
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
                            objbooking.BookingDate = Message.GetIndianDate(txtsaledate.Text);
                            objbooking.SponserId = txtsponserid.Text;
                            objbooking.CategoryId = ddcategory.SelectedValue.ToString();
                            objbooking.PaidAmount = Convert.ToDecimal(txtamount.Text);
                            objbooking.ProductName = txtproduct.Text;
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
                            objbooking.MentionBy = Session["useradmin"].ToString();

                            objbooking.Remark = txtremark.Text;

                            string res = objbooking.Insert_SaleDetail(objbooking);
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
                                Message.Show("Sale Added Successfully.");
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
                Message.Show("Enter Sale Date...");
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
        txtsaledate.Text = "";
        txtusername.Text = "";
        txtuserid.Text = "";
        txtsponsername.Text = "";
        txtuserid.Text = "";
        ddcategory.SelectedValue = "0";


        txtremark.Text="";
        txttotalinstallment.Text = "";
        txttenure.Text = "";
        txtsaledate.Text = "";
        txtmobile.Text = "";
        txtemail.Text = "";
        txtsponsername.Text = "";
        txtsponserid.Text = "";
        txtbv.Text = "";
        txtamount.Text = "";
        clearpaymentdetail();
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

    protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadcaegorydetail();
    }
}