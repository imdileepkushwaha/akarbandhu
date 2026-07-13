using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_BankAdd : System.Web.UI.Page
{
    clsProject objProject = new clsProject();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
                LoadProject();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loadplotlist();
    }
    void loadplotlist()
    {
        DataTable dt = new DataTable();
        objProject.ProjectId = ddproject.SelectedValue.ToString();
        objProject.BlockId = ddblock.SelectedValue.ToString();
        objProject.PlotNo = txtplotno.Text;
        objProject.PlotStatus = ddstatus.SelectedValue.ToString();
        dt = objProject.getPlot(objProject);
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
    }
    protected void ddproject_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadBlock();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblstatus = (Label)e.Row.FindControl("lblstatus");
            LinkButton lbEdit = (LinkButton)e.Row.FindControl("lbEdit");
            if (lblstatus.Text == "Vacant")
            {
                lblstatus.CssClass = "label label-danger";
            }
            else if (lblstatus.Text == "Booked")
            {
                lblstatus.CssClass = "label label-success";
                lbEdit.Enabled = false;
            }
            else if (lblstatus.Text == "Hold")
            {
                lblstatus.CssClass = "label label-warning";
            }
            else if (lblstatus.Text == "Final")
            {
                lblstatus.CssClass = "label label-primary";
            }

            //if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            //{
            //    DropDownList ddPLC = (DropDownList)e.Row.FindControl("ddPLC");
            //    //bind dropdownlist
            //    DataTable dt = new DataTable();
            //    dt = objProject.getPLC();
            //    if (dt.Rows.Count > 0)
            //    {
            //        ddPLC.DataSource = dt;
            //        ddPLC.DataTextField = dt.Columns["PLCName"].ToString();
            //        ddPLC.DataValueField = dt.Columns["PLCId"].ToString();
            //        ddPLC.DataBind();
            //    }
            //    ListItem li = new ListItem("Select PLC", "0");
            //    ddPLC.Items.Insert(0, li);

            //}
            //if (GridView1.EditIndex == e.Row.RowIndex)
            //{
            //    DropDownList ddPLC = (DropDownList)e.Row.FindControl("ddPLC");

            //    ddPLC.Items.FindByValue((e.Row.FindControl("lblplcid") as Label).Text).Selected = true;
            //}



        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        loadplotlist();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        loadplotlist();
        //DropDownList ddPLC = GridView1.Rows[e.NewEditIndex].FindControl("ddPLC") as DropDownList;
        //Label lblplcid = GridView1.Rows[e.NewEditIndex].FindControl("lblplcid") as Label;
        //DataTable dt = new DataTable();
        //dt = objProject.getPLC();
        //if (dt.Rows.Count > 0)
        //{
        //    ddPLC.DataSource = dt;
        //    ddPLC.DataTextField = dt.Columns["PLCName"].ToString();
        //    ddPLC.DataValueField = dt.Columns["PLCId"].ToString();
        //    ddPLC.DataBind();
        //}
        //ListItem li = new ListItem("Select PLC", "0");
        //ddPLC.Items.Insert(0, li);

        //ddPLC.Items.FindByValue(lblplcid.Text).Selected = true;

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        Label lblplotid = (Label)row.FindControl("lblId");
        TextBox txtlandarea = (TextBox)row.FindControl("txtlandarea");
        TextBox txtdimension = (TextBox)row.FindControl("txtdimension");
        if (txtlandarea.Text != "")
        {
            if (txtdimension.Text != "")
            {


                objProject.PlotId = lblplotid.Text;
                objProject.Landarea = Convert.ToDecimal(txtlandarea.Text);
                objProject.Dimension = txtdimension.Text;

                string rs = objProject.Edit_Plot(objProject);
                if (rs == "t")
                {
                    Message.Show("Plot Details Updated Successfully...!!!");
                    GridView1.EditIndex = -1;
                    loadplotlist();
                }
                else
                {
                    Message.Show("Unknown Error Occurred...!!!");
                }

            }
            else
            {
                Message.Show("Enter message...!!!");
            }


            //objMD.MainMenuTitle = txtmainmenutitlegrid.Text;
            //objMD.MainMenuUrl = txtmainmenuurlgrid.Text;
            //objMD.MainMenuid = lblmenuid.Text;

            //int rs = objMD.Main_Menu_Update(objMD);
            //if (rs == 1)
            //{
            //    Message.Show("Menu Details Updated Successfully...!!!");
            //    grdSavingAccount.EditIndex = -1;
            //    loadmainmenu();
            //}
            //else
            //{
            //    Message.Show("Unknown Error Occurred...!!!");
            //}
        }
        else
        {
            Message.Show("Enter Landarea...!!!");
        }
    }
}