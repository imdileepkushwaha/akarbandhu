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
                LoadBlock();
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
        DataTable dt = new DataTable();
        dt = objProject.getBlockAll();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ddproject.SelectedValue != "0")
        {
            if (txtblockname.Text != "")
            {
                objProject.ProjectId = ddproject.SelectedValue.ToString();
                objProject.BlockName = txtblockname.Text;

                objProject.MentionBy = Session["useradmin"].ToString();
                string rs = objProject.Insert_Block(objProject);
                if (rs == "t")
                {
                    Message.Show("Block Added Successfully...!!!");
                    LoadBlock();
                    txtblockname.Text = "";

                    ddproject.SelectedValue = "0";
                }
                else
                    if (rs == "f")
                {
                    Message.Show("Block Name Already Exists In This Project...!!!");
                }
                else
                {
                    Message.Show("Unknown Error Occurred...!!!");
                }
            }
            else
            {
                Message.Show("Enter Block Name...!!!");
            }
        }
        else
        {
            Message.Show("Select Project...!!!");
        }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
       
            if (txtBlockedit.Text != "")
            {
                objProject.BlockId = TxtBLOCKid.Text;
                objProject.BlockName = txtBlockedit.Text;
                objProject.MentionBy = Session["useradmin"].ToString();
                string rs = objProject.Edit_Block(objProject);
                if (rs == "t")
                {
                    string popupScript = "toastr.success('Success', 'Block Edited Successfully');";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                    string popupScript2 = "Closepopup();";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
                    LoadBlock();
                    LoadProject();
                }
           

        }
                
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblblockid = (Label)GridView1.Rows[index].FindControl("lblblockid");
            Label lblblockname = (Label)GridView1.Rows[index].FindControl("lblblockname");
            TxtBLOCKid.Text = lblblockid.Text;
            txtBlockedit.Text = lblblockname.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}