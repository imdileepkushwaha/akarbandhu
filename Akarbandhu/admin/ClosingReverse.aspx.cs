using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserReport : System.Web.UI.Page
{
    clsClosing objclosing = new clsClosing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadclosingperiod();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }

    void loadclosingperiod()
    {
        ddclosingperiod.Items.Clear();
        DataTable dt = new DataTable();
        dt = objclosing.getClosingPeriodReverse();

        ddclosingperiod.DataSource = dt;
        ddclosingperiod.DataTextField = "closingperiod";
        ddclosingperiod.DataValueField = "id";
        ddclosingperiod.DataBind();
        ListItem li = new ListItem("Select Closing Period", "0");
        ddclosingperiod.Items.Insert(0, li);
    }

  
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string[] arr = ddclosingperiod.SelectedItem.ToString().Split('-');
        objclosing.FromDate = Message.GetIndianDate(arr[0].ToString());
        objclosing.ToDate = Message.GetIndianDate(arr[1].ToString());
        string res = objclosing.ReverseClosing(objclosing);
        if (res == "t")
        {
            Message.Show("Closing Reversed Successfully...!!!");
            loadclosingperiod();
        }
        else
        {
            Message.Show("Unknown Error Occurred...!!!");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
   
}