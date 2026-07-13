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
    clsProduct objproduct = new clsProduct();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
                loadpackage();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    void loadpackage()
    {
        ddpackage.Items.Clear();
        DataTable dt = new DataTable();
        dt = objproduct.getPackage();
        ddpackage.DataSource = dt;
        ddpackage.DataTextField = "PackageName2";
        ddpackage.DataValueField = "packageID";
        ddpackage.DataBind();
        ListItem li = new ListItem("Select Package", "0");
        ddpackage.Items.Insert(0, li);
    }
    void loadsusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserNameForUpgrade(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();
            txtpackagename.Text = dt.Rows[0]["packagename2"].ToString();
            lbloldpackageid.Text = dt.Rows[0]["packageid"].ToString();
        }
        else
        {
            txtusername.Text = "";
            txtuserid.Text = "";
            string popupScript = "toastr.error('Error', 'Invalid User Id');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        loadsusername();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        objUser.UserId = txtuserid.Text;
        objUser.PrevPackageId = lbloldpackageid.Text;
        objUser.PackageId = ddpackage.SelectedValue.ToString();
        objUser.MentionBy = Session["useradmin"].ToString();
        string res = objUser.InsertUserUpgradeDetail(objUser);
        if (res == "t")
        {
            string popupScript = "toastr.success('Success', 'Package Upgraded Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            txtuserid.Text = "";
            txtusername.Text = "";
            lbloldpackageid.Text = "0";
            txtpackagename.Text = "";
            ddpackage.SelectedValue = "0";
        }
        else
        {
            string popupScript = "toastr.error('Error', 'Unknown error occurred');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
}