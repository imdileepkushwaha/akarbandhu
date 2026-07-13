using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class SiteMaster : MasterPage
{
    public WebsiteConfig Settings { get; private set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        Settings = WebsiteConfig.Load();

        if (!string.IsNullOrWhiteSpace(Settings.SiteTitle))
            Page.Title = Settings.SiteTitle;

        var meta = FindControl("metaDescription") as HtmlMeta;
        if (meta != null && !string.IsNullOrWhiteSpace(Settings.MetaDescription))
            meta.Content = Settings.MetaDescription;
    }

    public void SetBodyClass(string cssClass)
    {
        var body = FindControl("MasterBody") as HtmlGenericControl;
        if (body != null)
            body.Attributes["class"] = cssClass;
    }
}
