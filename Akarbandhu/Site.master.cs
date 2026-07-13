using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class SiteMaster : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void SetBodyClass(string cssClass)
    {
        var body = FindControl("MasterBody") as HtmlGenericControl;
        if (body != null)
            body.Attributes["class"] = cssClass;
    }
}