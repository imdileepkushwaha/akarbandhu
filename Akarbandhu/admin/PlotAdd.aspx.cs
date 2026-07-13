using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_StateAdd : System.Web.UI.Page
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
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //objState.StateName = txtstatenameedit.Text;
        //objState.StateId = lblstateid.Text;
        //string res = objState.Update_State(objState);
        //if (res == "t")
        //{
        //    string popupScript = "toastr.success('Success', 'State Edited Successfully');";
        //    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        //    string popupScript2 = "Closepopup();";
        //    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
        //    loadstate();
        //}
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ddproject.SelectedValue != "0")
        {
            if (ddblock.SelectedValue != "0")
            {
                if (txtplotnofrom.Text != "")
                {
                    if (txtplotnoto.Text != "")
                    {
                        if (txtlandarea.Text != "")
                        {
                            if (txtdimension.Text != "")
                            {

                                objProject.ProjectId = ddproject.SelectedValue.ToString();
                                objProject.BlockId = ddblock.SelectedValue.ToString();
                                objProject.PlotNoFrom = txtplotnofrom.Text;
                                objProject.PlotNoTo = txtplotnoto.Text;
                                objProject.Landarea = Convert.ToDecimal(txtlandarea.Text);
                                objProject.Dimension = txtdimension.Text;

                                objProject.MentionBy = Session["useradmin"].ToString();
                                string rs = objProject.Insert_Plot(objProject);
                                if (rs == "t")
                                {
                                    Message.Show("Plot Added Successfully...!!!");
                                    txtplotnofrom.Text = "";
                                    txtplotnoto.Text = "0";
                                    txtlandarea.Text = "";
                                    txtdimension.Text = "";
                                }

                                else
                                    if (rs == "e")
                                {
                                    Message.Show("Unknown Error Occurred...!!!");
                                }

                                else
                                {
                                    Message.Show("Plot No Already Exists In This Block...!!!");
                                }

                            }
                            else
                            {
                                Message.Show("Enter Dimension...!!!");
                            }



                        }
                        else
                        {
                            Message.Show("");
                        }
                    }
                    else
                    {
                        Message.Show("Select Plot No To...!!!");
                    }
                }
                else
                {
                    Message.Show("Select Plot From...!!!");
                }
            }
            else
            {
                Message.Show("Select block...!!!");
            }
        }
        else
        {
            Message.Show("Select Project...!!!");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //if (e.CommandName == "edt")
        //{
        //    int index = Convert.ToInt32(e.CommandArgument.ToString());
        //    Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
        //    Label lblstatename = (Label)GridView1.Rows[index].FindControl("lblstatename");
        //    lblstateid.Text = lblid.Text;
        //    txtstatenameedit.Text = lblstatename.Text;
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        //}
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void ddproject_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadBlock();
    }
}