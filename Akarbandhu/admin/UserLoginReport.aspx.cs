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
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
               
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
   
    void loaduser()
    {
        objUser.UserName = txtname.Text;
        objUser.Mobile = txtmobile.Text;
        objUser.UserId = txtuserid.Text;
        
        if (txtfromdate.Text != "")
        {
            objUser.FromDate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objUser.FromDate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objUser.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objUser.ToDate = DateTime.MinValue;
        }
        DataTable dt = new DataTable();
        dt = objUser.getLoginReport(objUser);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "myactive")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lbluserid = (Label)GridView1.Rows[index].FindControl("lbluserid");
            objUser.UserId = lbluserid.Text;
            objUser.User_Activate(objUser);
            loaduser();
           
        }
        else
            if (e.CommandName == "mydeactive")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                Label lbluserid = (Label)GridView1.Rows[index].FindControl("lbluserid");
                objUser.UserId = lbluserid.Text;
                objUser.User_Deactivate(objUser);
                loaduser();

            }
    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
 
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lbactive = (LinkButton)e.Row.FindControl("lbactive");
            LinkButton llbdeactive = (LinkButton)e.Row.FindControl("llbdeactive");
            Label lblloginstatus = (Label)e.Row.FindControl("lblloginstatus");
            Label lblstatus = (Label)e.Row.FindControl("lblstatus");
            if (lblloginstatus.Text == "1")
            {
                lbactive.Visible = false;
                lblstatus.CssClass = "label label-success"; 
                llbdeactive.Visible = true;
            }
            else
            {
                lbactive.Visible = true;
                lblstatus.CssClass = "label label-danger";
                llbdeactive.Visible = false;
            }
        }
    }
}