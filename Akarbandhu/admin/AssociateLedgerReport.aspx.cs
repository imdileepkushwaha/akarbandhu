using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_DownlineReport : System.Web.UI.Page
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
    void loaddata()
    {
        objUser.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = objUser.getAssociateLedger(objUser);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
        decimal dcramount = 0, dcdramount = 0,  dcbalance = 0;
        foreach (GridViewRow r in GridView1.Rows)
        {
            Label lblcramount = (Label)r.FindControl("lblcramount");
            Label lbldramount = (Label)r.FindControl("lbldramount");
            Label lblbalance = (Label)r.FindControl("lblbalance");

            dcramount += Convert.ToDecimal(lblcramount.Text);
            dcdramount += Convert.ToDecimal(lbldramount.Text);

            dcbalance = dcdramount-dcramount;
            lblbalance.Text = dcbalance.ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaddata();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}