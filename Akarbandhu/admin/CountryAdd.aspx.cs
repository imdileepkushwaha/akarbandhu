using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_CountryAdd : System.Web.UI.Page
{
    clsState objState = new clsState();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
                loaddata();
            else
                Response.Redirect("logout.aspx");
        }
    }

    void loaddata()
    {
        DataTable dt = objState.getCountry();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    void ClearForm()
    {
        lblcountryid.Text = "";
        txtcountryname.Text = "";
        rowid.Visible = false;
        btnSubmit.Text = "Submit";
        ltFormTitle.Text = "Add Country";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtcountryname.Text))
            return;

        // Edit mode
        if (!string.IsNullOrWhiteSpace(lblcountryid.Text))
        {
            objState.CountryId = lblcountryid.Text.Trim();
            objState.CountryName = txtcountryname.Text.Trim();
            string res = objState.Update_Country(objState);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.success('Success', 'Country updated successfully');", true);
                ClearForm();
                loaddata();
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.error('Error', 'Unable to update country');", true);
            }
            return;
        }

        // Add mode
        objState.CountryName = txtcountryname.Text.Trim();
        objState.MentionBy = Session["useradmin"].ToString();
        string addRes = objState.Insert_Country(objState);
        if (addRes == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.success('Success', 'Country Added Successfully');", true);
            ClearForm();
            loaddata();
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'Unknown error occurred');", true);
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "edt")
            return;

        int index = Convert.ToInt32(e.CommandArgument.ToString());
        Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
        Label lblCountryname = (Label)GridView1.Rows[index].FindControl("lblcountryname");
        if (lblid == null || lblCountryname == null)
            return;

        lblcountryid.Text = lblid.Text;
        txtcountryname.Text = lblCountryname.Text;
        rowid.Visible = false;
        btnSubmit.Text = "Update";
        ltFormTitle.Text = "Edit Country";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
}
