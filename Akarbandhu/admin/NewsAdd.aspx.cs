using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_NewsAdd : System.Web.UI.Page
{
    clsNews objnews = new clsNews();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loaddata();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }

    void loaddata()
    {
        DataTable dt = objnews.getNews();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    void ClearForm()
    {
        lblnewsid.Text = "";
        txtnews.Text = "";
        btnSubmit.Text = "Submit";
        ltFormTitle.Text = "Add News";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtnews.Text))
            return;

        // Edit mode
        if (!string.IsNullOrWhiteSpace(lblnewsid.Text))
        {
            objnews.NewsDetail = txtnews.Text.Trim();
            objnews.NewsId = lblnewsid.Text;
            string res = objnews.Update_News(objnews);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.success('Success', 'News updated successfully');", true);
                ClearForm();
                loaddata();
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.error('Error', 'Unable to update news');", true);
            }
            return;
        }

        // Add mode
        objnews.NewsDetail = txtnews.Text.Trim();
        objnews.MentionBy = Session["useradmin"].ToString();
        string insertRes = objnews.Insert_News(objnews);
        if (insertRes == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.success('Success', 'News Added Successfully');", true);
            ClearForm();
            loaddata();
        }
        else if (insertRes == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'News already exists.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'Unknown error occurred');", true);
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblnews = (Label)GridView1.Rows[index].FindControl("lblnews");
            if (lblid == null || lblnews == null)
                return;

            lblnewsid.Text = lblid.Text;
            txtnews.Text = lblnews.Text;
            btnSubmit.Text = "Update";
            ltFormTitle.Text = "Edit News";
        }
        else if (e.CommandName == "mydel")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            if (lblid == null)
                return;

            objnews.NewsId = lblid.Text;
            objnews.Delete_News(objnews);
            ClearForm();
            loaddata();
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.success('Success', 'News Deleted Successfully');", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
}
