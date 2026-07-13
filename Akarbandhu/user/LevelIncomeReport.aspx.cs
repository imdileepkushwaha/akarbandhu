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
    clsAccount objaccount = new clsAccount();
    clsClosing objclosing = new clsClosing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                loadclosingperiod();
                txtuserid.Text = Session["userid"].ToString();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    void loadclosingperiod()
    {
        ddclosingperiod.Items.Clear();
        DataTable dt = new DataTable();
        dt = objclosing.getClosingPeriod();

        ddclosingperiod.DataSource = dt;
        ddclosingperiod.DataTextField = "closingperiod";
        ddclosingperiod.DataValueField = "id";
        ddclosingperiod.DataBind();
        ListItem li = new ListItem("Select Closing Period", "0");
        ddclosingperiod.Items.Insert(0, li);
    }
    void loaduser()
    {

        string Fromdate = "";
        string Todatedate = "";
       

        objaccount.UserId = txtuserid.Text;
        string[] arr = ddclosingperiod.SelectedItem.ToString().Split('-');
        Fromdate = arr[0].ToString();
        Todatedate = arr[1].ToString();
        DataTable dt = new DataTable();
        dt = objaccount.getLevelIncomeUser(objaccount, Fromdate, Todatedate);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}