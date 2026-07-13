using System;
using System.IO;
using System.Web;
using System.Web.UI;

public partial class admin_SiteDetails : Page
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
        txtBrandName.Text = cfg.BrandName;
        txtCompanyName.Text = cfg.CompanyName;
        txtTagline.Text = cfg.Tagline;
        txtSiteTitle.Text = cfg.SiteTitle;
        txtMetaDescription.Text = cfg.MetaDescription;
        txtFooterMission.Text = cfg.FooterMission;
        txtCin.Text = cfg.Cin;
        txtPan.Text = cfg.Pan;
        txtTan.Text = cfg.Tan;
        txtOfficeHours.Text = cfg.OfficeHours;
        txtFacebook.Text = cfg.FacebookUrl;
        txtInstagram.Text = cfg.InstagramUrl;
        txtTwitter.Text = cfg.TwitterUrl;
        txtYoutube.Text = cfg.YoutubeUrl;
        hfLogoPath.Value = cfg.LogoPath ?? "";

        if (cfg.HasLogo)
        {
            imgLogo.ImageUrl = cfg.LogoUrl;
            imgLogo.Visible = true;
            lblNoLogo.Visible = false;
        }
        else
        {
            imgLogo.Visible = false;
            lblNoLogo.Visible = true;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        var cfg = WebsiteConfig.Load();
        cfg.BrandName = txtBrandName.Text.Trim();
        cfg.CompanyName = txtCompanyName.Text.Trim();
        cfg.Tagline = txtTagline.Text.Trim();
        cfg.SiteTitle = txtSiteTitle.Text.Trim();
        cfg.MetaDescription = txtMetaDescription.Text.Trim();
        cfg.FooterMission = txtFooterMission.Text.Trim();
        cfg.Cin = txtCin.Text.Trim();
        cfg.Pan = txtPan.Text.Trim();
        cfg.Tan = txtTan.Text.Trim();
        cfg.OfficeHours = txtOfficeHours.Text.Trim();
        cfg.FacebookUrl = string.IsNullOrWhiteSpace(txtFacebook.Text) ? "#" : txtFacebook.Text.Trim();
        cfg.InstagramUrl = string.IsNullOrWhiteSpace(txtInstagram.Text) ? "#" : txtInstagram.Text.Trim();
        cfg.TwitterUrl = string.IsNullOrWhiteSpace(txtTwitter.Text) ? "#" : txtTwitter.Text.Trim();
        cfg.YoutubeUrl = string.IsNullOrWhiteSpace(txtYoutube.Text) ? "#" : txtYoutube.Text.Trim();
        cfg.LogoPath = hfLogoPath.Value;

        if (fuLogo.HasFile)
        {
            string ext = Path.GetExtension(fuLogo.FileName).ToLowerInvariant();
            if (ext != ".png" && ext != ".jpg" && ext != ".jpeg" && ext != ".webp" && ext != ".gif")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "toastr.error('Error', 'Please upload PNG, JPG, WEBP or GIF logo.');", true);
                return;
            }

            string folder = Server.MapPath("~/assets/uploads/site/");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string fileName = "logo-" + DateTime.Now.ToString("yyyyMMddHHmmss") + ext;
            fuLogo.SaveAs(Path.Combine(folder, fileName));
            cfg.LogoPath = "~/assets/uploads/site/" + fileName;
            hfLogoPath.Value = cfg.LogoPath;
        }

        cfg.Save();
        BindForm();
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
            "toastr.success('Success', 'Site details saved. Public website will reflect changes.');", true);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
