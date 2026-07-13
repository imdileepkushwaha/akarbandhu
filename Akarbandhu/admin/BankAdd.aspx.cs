using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_BankAdd : System.Web.UI.Page
{
    clsBank objbank = new clsBank();

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
        DataTable dt = objbank.getBank();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    void ClearForm()
    {
        lblbankid.Text = "";
        txtbankname.Text = "";
        btnSubmit.Text = "Submit";
        ltFormTitle.Text = "Add Bank";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtbankname.Text))
            return;

        // Edit mode
        if (!string.IsNullOrWhiteSpace(lblbankid.Text))
        {
            objbank.BankName = txtbankname.Text.Trim();
            objbank.BankId = lblbankid.Text;
            string res = objbank.Update_Bank(objbank);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.success('Success', 'Bank updated successfully');", true);
                ClearForm();
                loaddata();
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.error('Error', 'Unable to update bank');", true);
            }
            return;
        }

        // Add mode
        objbank.BankName = txtbankname.Text.Trim();
        objbank.MentionBy = Session["useradmin"].ToString();
        string insertRes = objbank.Insert_Bank(objbank);
        if (insertRes == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.success('Success', 'Bank Added Successfully');", true);
            ClearForm();
            loaddata();
        }
        else if (insertRes == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.error('Error', 'Bank already exists.');", true);
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
        Label lblbankname = (Label)GridView1.Rows[index].FindControl("lblbankname");
        if (lblid == null || lblbankname == null)
            return;

        lblbankid.Text = lblid.Text;
        txtbankname.Text = lblbankname.Text;
        btnSubmit.Text = "Update";
        ltFormTitle.Text = "Edit Bank";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
}
