using BusinessLogicTier;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
                loadProject();
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
    }

    void loadProject()
    {
        DataTable dt = objProject.getProject();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtprojectname.Text = "";
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtprojectnameedit.Text) || string.IsNullOrWhiteSpace(lblprojectid.Text))
            return;

        objProject.ProjectName = txtprojectnameedit.Text.Trim();
        objProject.ProjectId = lblprojectid.Text;
        string res = objProject.Update_Project(objProject);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.success('Success', 'Project updated successfully'); Closepopup();", true);
            loadProject();
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'Unable to update project');", true);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtprojectname.Text))
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.warning('Warning', 'Enter Project Name');", true);
            return;
        }

        objProject.ProjectName = txtprojectname.Text.Trim();
        objProject.BV = Convert.ToDecimal("0");
        objProject.MentionBy = Session["useradmin"].ToString();
        string rs = objProject.Insert_Project(objProject);
        if (rs == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.success('Success', 'Project added successfully');", true);
            loadProject();
            txtprojectname.Text = "";
        }
        else if (rs == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'Project name already exists');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'Unknown error occurred');", true);
        }
    }

    string DeleteProject(string projectId)
    {
        if (string.IsNullOrWhiteSpace(projectId))
            return "0";

        // Safe numeric id only
        int id;
        if (!int.TryParse(projectId, out id))
            return "0";

        string conn = ConfigurationManager.ConnectionStrings["Connection String"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(conn))
        {
            cn.Open();
            using (SqlTransaction tr = cn.BeginTransaction())
            {
                try
                {
                    int blockCount = 0;
                    using (SqlCommand cmd = new SqlCommand("select count(1) from BlockDetail where projectid=@pid", cn, tr))
                    {
                        cmd.Parameters.AddWithValue("@pid", id);
                        blockCount = Convert.ToInt32(cmd.ExecuteScalar());
                    }

                    if (blockCount > 0)
                    {
                        tr.Rollback();
                        return "f";
                    }

                    using (SqlCommand cmd = new SqlCommand("delete from ProjectDetail where Projectid=@pid", cn, tr))
                    {
                        cmd.Parameters.AddWithValue("@pid", id);
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

        Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
        if (lblid == null || string.IsNullOrWhiteSpace(lblid.Text))
            return;

        if (e.CommandName == "edt")
        {
            Label lblprojectname = (Label)GridView1.Rows[index].FindControl("lblprojectname");
            lblprojectid.Text = lblid.Text;
            txtprojectnameedit.Text = lblprojectname != null ? lblprojectname.Text : "";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "showModal();", true);
        }
        else if (e.CommandName == "mydel")
        {
            string res = DeleteProject(lblid.Text);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.success('Success', 'Project deleted successfully');", true);
                loadProject();
            }
            else if (res == "f")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.error('Error', 'Cannot delete. Blocks exist under this project.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.error('Error', 'Unable to delete project');", true);
            }
        }
    }
}
