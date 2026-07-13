using System;
using System.Web.UI;

public partial class admin_ContactDetails : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
            BindForm();
    }

    void BindForm()
    {
        var cfg = WebsiteConfig.Load();
        txtEmail.Text = cfg.Email;
        txtMobile.Text = cfg.Mobile;
        txtWhatsApp.Text = cfg.WhatsApp;
        txtAddress.Text = cfg.Address;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtEmail.Text) ||
            string.IsNullOrWhiteSpace(txtMobile.Text) ||
            string.IsNullOrWhiteSpace(txtAddress.Text))
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "toastr.warning('Warning', 'Email, Mobile and Address are required.');", true);
            return;
        }

        var cfg = WebsiteConfig.Load();
        cfg.Email = txtEmail.Text.Trim();
        cfg.Mobile = txtMobile.Text.Trim();
        cfg.WhatsApp = txtWhatsApp.Text.Trim();
        cfg.Address = txtAddress.Text.Trim();
        cfg.Save();

        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
            "toastr.success('Success', 'Contact details saved. Public website updated.');", true);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
