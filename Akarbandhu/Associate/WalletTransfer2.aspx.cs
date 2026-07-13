using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;
using BusinessLogicTier;

public partial class admin_EPinAdd : System.Web.UI.Page
{

    clsUser objUser = new clsUser();
    clsAccount objaccount = new clsAccount();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["associateid"] != null)
        {
            txtuserid.Text = Session["associateid"].ToString();
            txtusername.Text = Session["associatename"].ToString();
            loadbalance();
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    void loadbalance()
    {
        objaccount.UserId = Session["associateid"].ToString();
        DataTable dt = new DataTable();
        dt = objaccount.getUserWalletBalance(objaccount);
        if (dt.Rows.Count > 0)
        {
            lbluserbalance.Text = dt.Rows[0][0].ToString();
        }
        else
        {
            lbluserbalance.Text = "0.00";
        }
    }

    void loadtransferusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = Session["associateid"].ToString();
        objUser.TransferUserId = txttransferuserid.Text;
        dt = objUser.getAssociateName(objUser);
        if (dt.Rows.Count > 0)
        {
            txttransferusername.Text = dt.Rows[0]["associatename"].ToString();
        }
        else
        {
            txttransferusername.Text = "";
            txttransferuserid.Text = "";
            Message.Show("Invalid associate Id...!!!");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txttransferuserid.Text != "")
        {
            if (txtamount.Text != "")
            {
                string str_remark = "";
                if (txtremark.Text != "")
                {
                    str_remark = txtremark.Text;
                }
                else
                {
                    str_remark = "Amount credited by " + Session["associateid"].ToString() + " to " + txttransferuserid.Text;
                }
                objUser.UserId = Session["userid"].ToString();
                objUser.TransferUserId = txttransferuserid.Text;
                objUser.Amount = Convert.ToDecimal(txtamount.Text);
                decimal dcadminchage = (Convert.ToDecimal(txtamount.Text) * 5) / 100;
                decimal dctotalmaount = Convert.ToDecimal(txtamount.Text)+((Convert.ToDecimal(txtamount.Text) * 5) / 100);
                objUser.AdminCharge = dcadminchage;
                objUser.TotalAmount = dctotalmaount;
                objUser.Remark = str_remark;
                objUser.MentionBy = Session["associateid"].ToString();
                string rs = objUser.WalletTransferUser(objUser);
                if (rs == "t")
                {
                    Message.Show("Amount Transferred Successfully...!!!");
                    txttransferuserid.Text = "";
                    txttransferusername.Text = "";
                    txtamount.Text = "";
                    txtremark.Text = "";
                    loadbalance();
                }
                else
                    if (rs == "f")
                    {
                        Message.Show("Invalid Transfer User Id...!!!");
                    }
                    else
                        if (rs == "b")
                        {
                            Message.Show("User do not have sufficient E-Pins...!!!");
                        }
                        else
                            if (rs == "b")
                            {
                                Message.Show("Invalid From User Id...!!!");
                            }
                            else
                            {
                                Message.Show("Unknown Error Occurred...!!!");
                            }
            }
            else
            {
                Message.Show("Enter amount...!!!");
            }
        }
        else
        {
            Message.Show("Enter transfer user id...!!!");
        }
    }
    protected void txttransferuserid_TextChanged(object sender, EventArgs e)
    {
        loadtransferusername();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}