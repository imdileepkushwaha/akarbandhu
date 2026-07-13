using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class admin_Dashboard : System.Web.UI.Page
{
    clsUser objuser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            loaddata();
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
    }
    void loaddata()
    {
        DataTable dt = new DataTable();
        dt = objuser.getDashboardAdmin();
        if (dt.Rows.Count > 0)
        {
            lbltotaluser.Text = dt.Rows[0]["totaluser"].ToString();
            lbltotalplot.Text = dt.Rows[0]["totalplot"].ToString();
            lbltotalipbooking.Text = dt.Rows[0]["totalipbooking"].ToString();
            lbltotalfpbooking.Text = dt.Rows[0]["totalfpbooking"].ToString();
        }
    }
}