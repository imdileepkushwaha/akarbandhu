using System;
using System.Web.UI;

public partial class plans : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var master = Master as SiteMaster;
        if (master != null)
            master.SetBodyClass("page-plans");
    }
}