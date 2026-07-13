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
    clsEPin objEPin = new clsEPin();
    clsUser objUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {

        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    void loadusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();
            txtsponserid.Text = dt.Rows[0]["sponserid"].ToString();
            txtsponsername.Text = dt.Rows[0]["sponsername"].ToString();
        }
        else
        {
            txtusername.Text = "";
            txtuserid.Text = "";
            Message.Show("Invalid User Id...!!!");
        }
    }
    void loadtransferusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txttransferuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txttransferusername.Text = dt.Rows[0]["username"].ToString();
        }
        else
        {
            txttransferusername.Text = "";
            txttransferuserid.Text = "";
            Message.Show("Invalid User Id...!!!");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text != "")
        {
            if (txttransferuserid.Text != "")
            {


                objUser.UserId = txtuserid.Text;
                objUser.SponserId = txtsponserid.Text;
                objUser.NewSponserId = txttransferuserid.Text;
                objUser.MentionBy = Session["useradmin"].ToString();
                string rs = objUser.SponserEdit(objUser);
                if (rs == "t")
                {
                    Message.Show("Sponser Edited  Successfully...!!!");
                    txttransferuserid.Text = "";
                    txttransferusername.Text = "";
                    txtuserid.Text = "";
                    txtusername.Text = "";
                    txtsponserid.Text = "";
                    txtsponsername.Text = "";
                }
                else
                    if (rs == "f")
                    {
                        Message.Show("Invalid New Sponser Id...!!!");
                    }
                        else
                        {
                            Message.Show("Unknown Error Occurred...!!!");
                        }
            }
            else
            {
                Message.Show("Enter transfer user id...!!!");
            }
        }
        else
        {
            Message.Show("Enter user id...!!!");
        }
    }


    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        loadusername();
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