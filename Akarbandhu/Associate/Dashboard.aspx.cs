using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataTier;
using BusinessLogicTier;
using System.Data.SqlClient;

public partial class admin_Dashboard : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsUser objuser = new clsUser();
    clsAccount objaccount = new clsAccount();
    clsNews objnews = new clsNews();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["associateid"] != null)
        {
            TxtLeftLinkLink.Attributes.Add("readonly", "readonly");
            TxtRightLink.Attributes.Add("readonly", "readonly");
            laoddata();
            loadnews();
            loaddashboard();
            TxtLeftLinkLink.Text = "https://maniraya.com/" + "/Register.aspx?UserId=" + Session["associateid"].ToString() + "&standingposition=1";
           // TxtRightLink.Text = "https://maniraya.com/" + "/Register.aspx?UserId=" + Session["userid"].ToString() + "&standingposition=2";
            
            GetAllIncome();
            ltimage.Text = @" <img class=""img-circle circle-border m-b-md"" src=""../admin/userimage/" + Session["associateimage"].ToString() + @"""  alt=""profile-img-circle box-center "  + @"""  Style=""height:100px"" ""  >";

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




    private void GetAllIncome()
    {
        DataSet ds = new DataSet();
        objuser.UserId = Session["associateid"].ToString();
        ds = get_DashboardUser(objuser);
        if (ds.Tables.Count > 0)
        {

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];
                LblconveynceIncome.Text = Convert.ToString(row["bonusincome"]);
                LblLevelIncome.Text = Convert.ToString(row["levelincome"]);
                LblSelfIncome.Text = Convert.ToString(row["selfincome"]);
                LblTotalTeam.Text = Convert.ToString(row["TotalTeam"]);
                LblDIrect.Text = Convert.ToString(row["DirectTeam"]);
                LblStatus.Text = Convert.ToString(row["status"]);
                LblActivationdate.Text = Convert.ToString(row["DateOfActivation"]);
                LblTeamBusiness.Text = Convert.ToString(row["teambusiness"]);
                LblSelfBusiness.Text = Convert.ToString(row["business"]);
                LblReward.Text = string.IsNullOrWhiteSpace(Convert.ToString(row["reward"])) ? "-" : Convert.ToString(row["reward"]);
                lbllevel.Text = Convert.ToString(row["Levelno"]);
                LblSlefLevel.Text = Convert.ToString(row["totlselflevel"]);
            }
        }

        // Recalculate team counts so Dashboard matches Downline / Direct reports
        BindTeamCounts(Session["associateid"].ToString());
    }

    private void BindTeamCounts(string associateId)
    {
        try
        {
            objuser.UserId = associateId;

            // Total team = full downline via ParentAssociateId (same as Downline Report)
            int totalByParent = 0;
            DataTable dtDownline = objuser.getAssociateDownline(objuser);
            if (dtDownline != null)
                totalByParent = dtDownline.Rows.Count;

            // Also count full referral tree via SponserId (in case ParentAssociateId is missing)
            int totalBySponser = GetTeamCountBySponser(associateId);
            int totalTeam = Math.Max(totalByParent, totalBySponser);
            LblTotalTeam.Text = totalTeam.ToString();

            // Direct = associates where SponserId = current user
            int directCount = GetDirectCount(associateId);
            LblDIrect.Text = directCount.ToString();
        }
        catch
        {
            // keep values already set from stored procedure
        }
    }

    private int GetDirectCount(string associateId)
    {
        int count = 0;
        ObjData.StartConnection();
        try
        {
            string sql = "SELECT COUNT(*) FROM AssociateDetail WITH (nolock) WHERE SponserId='" + associateId.Replace("'", "''") + "'";
            DataTable dt = ObjData.RunDataTable(sql);
            if (dt != null && dt.Rows.Count > 0)
                count = Convert.ToInt32(dt.Rows[0][0]);
        }
        catch
        {
            count = 0;
        }
        finally
        {
            ObjData.EndConnection();
        }
        return count;
    }

    private int GetTeamCountBySponser(string associateId)
    {
        int count = 0;
        ObjData.StartConnection();
        try
        {
            string id = associateId.Replace("'", "''");
            string sql = @"; WITH MyCTE AS (
                SELECT AssociateId FROM AssociateDetail WITH (nolock) WHERE AssociateId = '" + id + @"'
                UNION ALL
                SELECT a.AssociateId FROM AssociateDetail a WITH (nolock)
                INNER JOIN MyCTE c ON a.SponserId = c.AssociateId
                WHERE a.AssociateId <> '" + id + @"'
            )
            SELECT COUNT(*) FROM MyCTE WHERE AssociateId <> '" + id + @"'
            OPTION (MAXRECURSION 0)";
            DataTable dt = ObjData.RunDataTable(sql);
            if (dt != null && dt.Rows.Count > 0)
                count = Convert.ToInt32(dt.Rows[0][0]);
        }
        catch
        {
            count = 0;
        }
        finally
        {
            ObjData.EndConnection();
        }
        return count;
    }


    public DataSet get_DashboardUser(clsUser objuser)
    {
        string s2 = "";
        DataSet ds = new DataSet();
        ObjData.StartConnection();
        try
        {
            s2 = "sp_getAssociateDashboard";
            SqlParameter[] parameter = { 
                                               new SqlParameter("@userid",objuser.UserId), 
                };
            ds = ObjData.RunDataSetProcedure(s2, parameter);
        }
        catch (Exception ex)
        {

        }
        finally
        {
            ObjData.EndConnection();

        }
        return ds;
    }
   void laoddata()
    {
        objuser.UserId = Session["associateid"].ToString();
        DataTable dt = new DataTable();
        dt = objuser.getAssociateDetail(objuser);
        if (dt.Rows.Count > 0)
        {
            lbluserid.Text = dt.Rows[0]["associateid"].ToString();
            lblusername.Text = dt.Rows[0]["associatename"].ToString();
            lbladdress.Text = dt.Rows[0]["address"].ToString();
            lblmobile.Text = dt.Rows[0]["mobile"].ToString();
            lblemail.Text = dt.Rows[0]["email"].ToString();
            lblaccountholdername.Text = dt.Rows[0]["accountholdername"].ToString();
            lblaccountno.Text = dt.Rows[0]["accountno"].ToString();
            lblbank.Text = dt.Rows[0]["branchname"].ToString();
            lblifsc.Text = dt.Rows[0]["ifsccode"].ToString();
            lblpan.Text = dt.Rows[0]["pannumber"].ToString();
            lbladhaar.Text = dt.Rows[0]["adharnumber"].ToString();
           
           
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