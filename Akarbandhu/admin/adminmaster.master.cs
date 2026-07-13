using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["useradmin"] == null)
        //    Response.Redirect("logout.aspx");
        //else
        //{
        //    Response.ClearHeaders();
        //    Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
        //    Response.AddHeader("Pragma", "no-cache");
        //}
    }
}
