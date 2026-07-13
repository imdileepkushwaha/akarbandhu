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
            if (!IsPostBack)
            {
                loaplan();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    void loaplan()
    {
        ddplan.Items.Clear();
        DataTable dt = new DataTable();
        dt = objEPin.getPlan();
        ddplan.DataSource = dt;
        ddplan.DataTextField = "planname2";
        ddplan.DataValueField = "planid";
        ddplan.DataBind();
        ListItem li = new ListItem("Select Plan", "0");
        ddplan.Items.Insert(0, li);
    }
    void loadsusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();
        }
        else
        {
            txtusername.Text = "";
            txtuserid.Text = "";
            string popupScript = "toastr.error('Error', 'Invalid User Id');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
    }
    void loadplandetail()
    {
        DataTable dt = new DataTable();
        objEPin.PlanId = ddplan.SelectedValue.ToString();
        dt = objEPin.getPlanDetail(objEPin);
        if (dt.Rows.Count > 0)
        {
            txtamount.Text = dt.Rows[0]["amount"].ToString();
        }
        else
        {
            txtamount.Text = "0";
        }
    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        loadsusername();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        objEPin.GenerateUserId = txtuserid.Text;
        objEPin.Amount = Convert.ToDecimal(txtamount.Text);
        objEPin.NoOfEPins = Convert.ToInt32(txtnoofepin.Text);
        objEPin.MentionBy = Session["useradmin"].ToString();
        objEPin.PlanId = ddplan.SelectedValue.ToString();
        string res = objEPin.Insert_EPin(objEPin);
        if (res == "t")
        {
            string popupScript = "toastr.success('Success', 'E-Pin Generated Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            txtuserid.Text = "";
            txtusername.Text = "";
            txtnoofepin.Text = "";
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
        loadplandetail();
    }
}