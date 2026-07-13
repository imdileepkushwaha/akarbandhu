using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class admin_AssociateReport : System.Web.UI.Page
{
    clsProject objProject = new clsProject();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["associateid"] != null)
            {
                LoadProject();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void LoadProject()
    {
        ddproject.Items.Clear();
        DataTable dt = new DataTable();
        dt = objProject.getProject();
        if (dt.Rows.Count > 0)
        {
            ddproject.DataSource = dt;
            ddproject.DataTextField = dt.Columns["ProjectName"].ToString();
            ddproject.DataValueField = dt.Columns["ProjectId"].ToString();
            ddproject.DataBind();
        }
        ListItem li = new ListItem("Select Project", "0");
        ddproject.Items.Insert(0, li);
    }
    void LoadBlock()
    {
        ddblock.Items.Clear();
        DataTable dt = new DataTable();
        objProject.ProjectId = ddproject.SelectedValue.ToString();
        dt = objProject.getBlock(objProject);
        if (dt.Rows.Count > 0)
        {
            ddblock.DataSource = dt;
            ddblock.DataTextField = dt.Columns["BlockName"].ToString();
            ddblock.DataValueField = dt.Columns["BlockId"].ToString();
            ddblock.DataBind();
        }
        ListItem li = new ListItem("Select Block", "0");
        ddblock.Items.Insert(0, li);
    }
    protected void ddproject_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadBlock();
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        objProject.ProjectId = ddproject.SelectedValue.ToString();
        objProject.BlockId = ddblock.SelectedValue.ToString();
        objProject.PlotNo = "";
        objProject.PlotStatus = "0";
        dt = objProject.getPlot(objProject);
        if (dt.Rows.Count > 0)
        {

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        else
        {
            //pnllist.Visible = false;
            DataList1.DataSource = null;
            DataList1.DataBind();
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");
            Literal ltimage = (Literal)e.Item.FindControl("ltimage");
            if (lblstatus.Text == "Vacant")
            {
                ltimage.Text = @"<img src='assets/images/available.png' alt='Vacant' />";
            }
            else if (lblstatus.Text == "Booked")
            {
                ltimage.Text = @"<img src='assets/images/booked.png' alt='Booked' />";
            }
            else if (lblstatus.Text == "Sold")
            {
                ltimage.Text = @"<img src='assets/images/sold.png' alt='Sold' />";
            }

        }
    }
}