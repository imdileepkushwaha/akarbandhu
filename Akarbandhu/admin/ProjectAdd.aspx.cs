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
    clsBank objbank = new clsBank();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
                loadProject();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    void loadProject()
    {
        DataTable dt = new DataTable();
        dt = objProject.getProject();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objProject.ProjectName = txtprojectnameedit.Text;
        objProject.ProjectId = lblbankid.Text;
        string res = objProject.Update_Project(objProject);
        if (res == "t")
        {
            string popupScript = "toastr.success('Success', 'Bank Edited Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            string popupScript2 = "Closepopup();";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
            loadProject();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtprojectname.Text != "")
        {
          
                objProject.ProjectName = txtprojectname.Text;
                objProject.BV = Convert.ToDecimal("0");
                objProject.MentionBy = Session["useradmin"].ToString();
                string rs = objProject.Insert_Project(objProject);
                if (rs == "t")
                {
                    Message.Show("Project Added Successfully...!!!");
                    loadProject();
                    txtprojectname.Text = "";
                }
                else
                    if (rs == "f")
                {
                    Message.Show("Project Name Already Exists...!!!");
                }
                else
                {
                    Message.Show("Unknown Error Occurred...!!!");
                }
         
        }
        else
        {
            Message.Show("Enter Project Name...!!!");
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
           Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblbankname = (Label)GridView1.Rows[index].FindControl("lblbankname");
            lblbankid.Text = lblid.Text;
            txtbanknameedit.Text = lblbankname.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
    }
}