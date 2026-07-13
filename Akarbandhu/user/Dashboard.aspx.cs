using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class admin_Dashboard : System.Web.UI.Page
{
    clsUser objuser = new clsUser();
    clsAccount objaccount = new clsAccount();
    clsNews objnews = new clsNews();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            laoddata();
            loadnews();
            loaddashboard();
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
    }
    void loadnews()
    {
        DataTable dt = new DataTable();
        dt = objnews.getRecentNews();
        foreach (DataRow r in dt.Rows)
        {
            ltnews.Text += r["newsdetail"].ToString() + "<br/><hr/>";
        }
    }
  
   void laoddata()
    {
        objuser.UserId = Session["userid"].ToString();
        DataTable dt = new DataTable();
        dt = objuser.getUserDetail(objuser);
        if (dt.Rows.Count > 0)
        {
            lbluserid.Text = dt.Rows[0]["userid"].ToString();
            lblusername.Text = dt.Rows[0]["username"].ToString();
            lbladdress.Text = dt.Rows[0]["address"].ToString();
            lblmobile.Text = dt.Rows[0]["mobile"].ToString();
            lblemail.Text = dt.Rows[0]["email"].ToString();
            lblaccountholdername.Text = dt.Rows[0]["accountholdername"].ToString();
            lblaccountno.Text = dt.Rows[0]["accountno"].ToString();
            lblbank.Text = dt.Rows[0]["branchname"].ToString();
            lblifsc.Text = dt.Rows[0]["ifsccode"].ToString();
            lblpan.Text = dt.Rows[0]["pannumber"].ToString();
           
        }

    }
   void loaddashboard()
   {
       //DataSet ds = new DataSet();
       //objuser.UserId = Session["userid"].ToString();
       //ds = objuser.get_DashboardUser(objuser);
       //if (ds.Tables.Count > 0)
       //{
       //    if (ds.Tables[0].Rows.Count > 0)
       //    {
       //        if (ds.Tables[0].Rows[0]["package"].ToString() != "")
       //        {
       //            lblmypackage.Text = ds.Tables[0].Rows[0]["package"].ToString();
       //        }
       //        else
       //        {
       //            lblmypackage.Text = "Not Upgraded";
       //        }
       //        lbltotalteam.Text = ds.Tables[0].Rows[0]["totalteam"].ToString();
       //        lbldirectreferral.Text = ds.Tables[0].Rows[0]["directteam"].ToString();
       //        lblmyearning.Text = ds.Tables[0].Rows[0]["balanceamount"].ToString();
       //    }
       //}
   }
   
}