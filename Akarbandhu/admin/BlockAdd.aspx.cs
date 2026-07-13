using BusinessLogicTier;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
            Response.Redirect("logout.aspx");
        }
    }

    void LoadProject()
    {
        ddproject.Items.Clear();
        DataTable dt = objProject.getProject();
        if (dt != null && dt.Rows.Count > 0)
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
        DataTable dt = objProject.getBlockAll();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ddproject.SelectedValue == "0")
        {
            Toast("toastr.warning('Warning', 'Select Project');");
            return;
        }
        if (string.IsNullOrWhiteSpace(txtblockname.Text))
        {
            Toast("toastr.warning('Warning', 'Enter Block Name');");
            return;
        }

        objProject.ProjectId = ddproject.SelectedValue.ToString();
        objProject.BlockName = txtblockname.Text.Trim();
        objProject.MentionBy = Session["useradmin"].ToString();
        string rs = objProject.Insert_Block(objProject);
        if (rs == "t")
        {
            Toast("toastr.success('Success', 'Block added successfully');");
            LoadBlock();
            txtblockname.Text = "";
            ddproject.SelectedValue = "0";
        }
        else if (rs == "f")
        {
            Toast("toastr.error('Error', 'Block name already exists in this project');");
        }
        else
        {
            Toast("toastr.error('Error', 'Unknown error occurred');");
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtBlockedit.Text) || string.IsNullOrWhiteSpace(TxtBLOCKid.Text))
            return;

        objProject.BlockId = TxtBLOCKid.Text;
        objProject.BlockName = txtBlockedit.Text.Trim();
        objProject.MentionBy = Session["useradmin"].ToString();
        string rs = objProject.Edit_Block(objProject);
        if (rs == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.success('Success', 'Block updated successfully'); Closepopup();", true);
            LoadBlock();
        }
        else
        {
            Toast("toastr.error('Error', 'Unable to update block');");
        }
    }

    string DeleteBlock(string blockId)
    {
        int id;
        if (!int.TryParse(blockId, out id))
            return "0";

        string conn = ConfigurationManager.ConnectionStrings["Connection String"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(conn))
        {
            cn.Open();
            using (SqlTransaction tr = cn.BeginTransaction())
            {
                try
                {
                    int plotCount = 0;
                    using (SqlCommand cmd = new SqlCommand("select count(1) from plotdetail where blockid=@bid", cn, tr))
                    {
                        cmd.Parameters.AddWithValue("@bid", id);
                        plotCount = Convert.ToInt32(cmd.ExecuteScalar());
                    }

                    if (plotCount > 0)
                    {
                        tr.Rollback();
                        return "f";
                    }

                    using (SqlCommand cmd = new SqlCommand("delete from BlockDetail where blockid=@bid", cn, tr))
                    {
                        cmd.Parameters.AddWithValue("@bid", id);
                        cmd.ExecuteNonQuery();
                    }

                    tr.Commit();
                    return "t";
                }
                catch
                {
                    tr.Rollback();
                    return "0";
                }
            }
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        if (!int.TryParse(Convert.ToString(e.CommandArgument), out index))
            return;
        if (index < 0 || index >= GridView1.Rows.Count)
            return;

        Label lblblockid = (Label)GridView1.Rows[index].FindControl("lblblockid");
        if (lblblockid == null || string.IsNullOrWhiteSpace(lblblockid.Text))
            return;

        if (e.CommandName == "edt")
        {
            Label lblblockname = (Label)GridView1.Rows[index].FindControl("lblblockname");
            TxtBLOCKid.Text = lblblockid.Text;
            txtBlockedit.Text = lblblockname != null ? lblblockname.Text : "";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "showModal();", true);
        }
        else if (e.CommandName == "mydel")
        {
            string res = DeleteBlock(lblblockid.Text);
            if (res == "t")
            {
                Toast("toastr.success('Success', 'Block deleted successfully');");
                LoadBlock();
            }
            else if (res == "f")
            {
                Toast("toastr.error('Error', 'Cannot delete. Plots exist under this block.');");
            }
            else
            {
                Toast("toastr.error('Error', 'Unable to delete block');");
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtblockname.Text = "";
        ddproject.SelectedValue = "0";
    }

    void Toast(string script)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), script, true);
    }
}
