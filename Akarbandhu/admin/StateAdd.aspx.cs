using BusinessLogicTier;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_StateAdd : System.Web.UI.Page
{
    clsState objState = new clsState();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadcountry();
                loadstate();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }

    void loadcountry()
    {
        ddcountry.Items.Clear();
        DataTable dt = objState.getCountry();
        ddcountry.DataSource = dt;
        ddcountry.DataTextField = "CountryName";
        ddcountry.DataValueField = "CountryID";
        ddcountry.DataBind();
        ddcountry.Items.Insert(0, new ListItem("Select Country", "0"));
    }

    void loadstate()
    {
        DataTable dt = objState.getStateAll();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    void ClearForm()
    {
        lblstateid.Text = "";
        txtstatename.Text = "";
        if (ddcountry.Items.FindByValue("0") != null)
            ddcountry.SelectedValue = "0";
        rowid.Visible = false;
        btnSubmit.Text = "Submit";
        ltFormTitle.Text = "Add State";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ddcountry.SelectedValue == "0" || string.IsNullOrWhiteSpace(txtstatename.Text))
            return;

        // Edit mode
        if (!string.IsNullOrWhiteSpace(lblstateid.Text))
        {
            if (UpdateStateFull(lblstateid.Text.Trim(), ddcountry.SelectedValue, txtstatename.Text.Trim()))
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.success('Success', 'State updated successfully');", true);
                ClearForm();
                loadstate();
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.error('Error', 'Unable to update state');", true);
            }
            return;
        }

        // Add mode
        objState.CountryId = ddcountry.SelectedValue;
        objState.StateName = txtstatename.Text.Trim();
        objState.MentionBy = Session["useradmin"].ToString();
        string res = objState.Insert_State(objState);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.success('Success', 'State Added Successfully');", true);
            ClearForm();
            loadstate();
        }
        else if (res == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'State Already Exists');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'Unknown error occurred');", true);
        }
    }

    bool UpdateStateFull(string stateId, string countryId, string stateName)
    {
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["Connection String"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conn))
            using (SqlCommand cmd = new SqlCommand(
                "UPDATE StateMaster SET StateName=@StateName, CountryId=@CountryId WHERE StateID=@StateId", cn))
            {
                cmd.Parameters.AddWithValue("@StateName", stateName);
                cmd.Parameters.AddWithValue("@CountryId", countryId);
                cmd.Parameters.AddWithValue("@StateId", stateId);
                cn.Open();
                cmd.ExecuteNonQuery();
            }
            return true;
        }
        catch
        {
            // Fallback to existing business method (name only)
            try
            {
                objState.StateId = stateId;
                objState.StateName = stateName;
                return objState.Update_State(objState) == "t";
            }
            catch
            {
                return false;
            }
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "edt")
            return;

        int index = Convert.ToInt32(e.CommandArgument.ToString());
        Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
        Label lblstatename = (Label)GridView1.Rows[index].FindControl("lblstatename");
        Label lblcountryid = (Label)GridView1.Rows[index].FindControl("lblcountryid");
        if (lblid == null || lblstatename == null)
            return;

        lblstateid.Text = lblid.Text;
        txtstatename.Text = lblstatename.Text;
        if (lblcountryid != null && ddcountry.Items.FindByValue(lblcountryid.Text) != null)
            ddcountry.SelectedValue = lblcountryid.Text;

        rowid.Visible = false;
        btnSubmit.Text = "Update";
        ltFormTitle.Text = "Edit State";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
}
