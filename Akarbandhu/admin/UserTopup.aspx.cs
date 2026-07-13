using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_UserTopup : System.Web.UI.Page
{
    clsUser objUser = new clsUser();
    clsEPin objepin = new clsEPin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
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
        DataTable dt = new DataTable();
        dt = objepin.getPlan();
        ddplan.DataSource = dt;
        ddplan.DataTextField = "planname2";
        ddplan.DataValueField = "planid";
        ddplan.DataBind();
        ListItem li = new ListItem("Select Plan", "0");
        ddplan.Items.Insert(0, li);
    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        loadusername();
    }
    void loadusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserNameForTopup(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();
            //ddplan.SelectedValue = dt.Rows[0]["planid"].ToString(); 
        }
        else
        {
            txtusername.Text = "";
            txtuserid.Text = "";
            //ddplan.SelectedValue = "0";
            string popupScript = "toastr.error('Error', 'Invalid User Id');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
     
    }
    protected void ddepin_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtamount.Text = ddepin.SelectedValue.ToString();
    }
    void loadepin()
    {
        objepin.GenerateUserId = txtsponserid.Text;
        objepin.PlanId = ddplan.SelectedValue.ToString();
        ddepin.Items.Clear();
        DataTable dt = new DataTable();
        dt = objepin.getEPinForReg(objepin);
        ddepin.DataSource = dt;
        ddepin.DataTextField = "epinno";
        ddepin.DataValueField = "amount";
        ddepin.DataBind();
        ListItem li = new ListItem("Select Epin", "0");
        ddepin.Items.Insert(0, li);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objUser.EpinNo = ddepin.SelectedItem.ToString();
        objUser.UserId = txtuserid.Text;
        objUser.MentionBy = Session["useradmin"].ToString();
        string res = objUser.Insert_TopupUser(objUser);
        if (res == "t")
        {
            string popupScript = "toastr.success('Success', 'User Upgraded Up Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            txtuserid.Text = "";
            txtusername.Text = "";
            ddplan.SelectedValue = "0";
            loadepin();
            txtamount.Text = "0";
        }
        else
            if (res == "e")
            {
                string popupScript = "toastr.error('Error', 'Invalid Epin No');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
            else
                if (res == "f")
                {
                    string popupScript = "toastr.error('Error', 'User Already Topped Up');";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                }
            else
            {
                string popupScript = "toastr.error('Error', 'Unknow error occurred');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
    protected void ddplan_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadepin();
    }
    void loadsponsername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtsponserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtsponsername.Text = dt.Rows[0]["username"].ToString();
        }
        else
        {
            txtsponsername.Text = "";
            txtsponserid.Text = "";
            string popupScript = "toastr.error('Error', 'Invalid Sponser Id');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
    }
    protected void txtsponserid_TextChanged(object sender, EventArgs e)
    {
        loadsponsername();
    }
}