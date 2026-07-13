using BusinessLogicTier;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_EPinAdd : System.Web.UI.Page
{
    clsBank objbank = new clsBank();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
            loaddata();
    }

    void loaddata()
    {
        DataTable dt = objbank.getBankAccountList();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    void ClearForm()
    {
        lblbankaccountid.Text = "";
        txtdepositbank.Text = "";
        txtaccountholdername.Text = "";
        txtdepositaccountno.Text = "";
        txtifsccode.Text = "";
        txtbranchname.Text = "";
        btnSubmit.Text = "Submit";
        ltFormTitle.Text = "Add Bank Account";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Edit mode
        if (!string.IsNullOrWhiteSpace(lblbankaccountid.Text))
        {
            objbank.BankAccountId = lblbankaccountid.Text;
            objbank.BankName = txtdepositbank.Text.Trim();
            objbank.AccHolderName = txtaccountholdername.Text.Trim();
            objbank.AccNo = txtdepositaccountno.Text.Trim();
            objbank.IFSCCode = txtifsccode.Text.Trim();
            objbank.BranchName = txtbranchname.Text.Trim();
            string res = objbank.Update_BankAccount(objbank);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.success('Success', 'Bank account updated successfully');", true);
                ClearForm();
                loaddata();
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.error('Error', 'Unable to update bank account');", true);
            }
            return;
        }

        // Add mode
        objbank.BankName = txtdepositbank.Text.Trim();
        objbank.AccHolderName = txtaccountholdername.Text.Trim();
        objbank.AccNo = txtdepositaccountno.Text.Trim();
        objbank.IFSCCode = txtifsccode.Text.Trim();
        objbank.BranchName = txtbranchname.Text.Trim();
        objbank.MentionBy = Session["useradmin"].ToString();
        string insertRes = objbank.Insert_BankAccount(objbank);
        if (insertRes == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.success('Success', 'Account Added Successfully');", true);
            ClearForm();
            loaddata();
        }
        else if (insertRes == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'Account Already Exists');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'Unknown error occurred');", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblaccountholdername = (Label)GridView1.Rows[index].FindControl("lblaccountholdername");
            Label lblaccountno = (Label)GridView1.Rows[index].FindControl("lblaccountno");
            Label lblbankname = (Label)GridView1.Rows[index].FindControl("lblbankname");
            Label lblifsccode = (Label)GridView1.Rows[index].FindControl("lblifsccode");
            Label lblbranchname = (Label)GridView1.Rows[index].FindControl("lblbranchname");
            if (lblid == null)
                return;

            lblbankaccountid.Text = lblid.Text;
            txtaccountholdername.Text = lblaccountholdername != null ? lblaccountholdername.Text : "";
            txtdepositaccountno.Text = lblaccountno != null ? lblaccountno.Text : "";
            txtdepositbank.Text = lblbankname != null ? lblbankname.Text : "";
            txtifsccode.Text = lblifsccode != null ? lblifsccode.Text : "";
            txtbranchname.Text = lblbranchname != null ? lblbranchname.Text : "";
            btnSubmit.Text = "Update";
            ltFormTitle.Text = "Edit Bank Account";
        }
        else if (e.CommandName == "mydel")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            if (lblid == null || string.IsNullOrWhiteSpace(lblid.Text))
                return;

            if (DeleteBankAccount(lblid.Text.Trim()))
            {
                if (lblbankaccountid.Text == lblid.Text)
                    ClearForm();
                loaddata();
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.success('Success', 'Bank account deleted successfully');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.error('Error', 'Unable to delete bank account');", true);
            }
        }
    }

    bool DeleteBankAccount(string id)
    {
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["Connection String"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conn))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM CompanyAccountDetail WHERE id=@id", cn))
            {
                cmd.Parameters.AddWithValue("@id", id);
                cn.Open();
                cmd.ExecuteNonQuery();
            }
            return true;
        }
        catch
        {
            return false;
        }
    }
}
