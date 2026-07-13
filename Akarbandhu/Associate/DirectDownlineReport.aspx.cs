using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using DataTier;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_DownlineReport : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["associateid"] != null)
            {
                txtuserid.Text = Session["associateid"].ToString();
                txtuserid.Enabled = false;
                FillAssociatesDetails();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loaduser()
    {
        objUser.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = getAssociatesDetailNewlatest(objUser);
        grdBank.DataSource = dt;
        grdBank.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    public void FillAssociatesDetails()
    {
        DataTable dt = new DataTable();
        objUser.UserId = Session["associateid"].ToString();
        string Rowno = "";
        if (ddlRecordFilter.SelectedValue == "10")
        {
            Rowno = " top 10 ";
        }
        if (ddlRecordFilter.SelectedValue == "25")
        {
            Rowno = " top 25 ";
        }
        if (ddlRecordFilter.SelectedValue == "50")
        {
            Rowno = " top 50 ";
        }
        if (ddlRecordFilter.SelectedValue == "100")
        {
            Rowno = " top 100 ";
        }
        if (ddlRecordFilter.SelectedValue == "500")
        {
            Rowno = " top 500 ";
        }
        objUser.Pincode = Rowno;
        dt = getAssociatesDetailNewlatest(objUser);
        grdBank.DataSource = dt;
        grdBank.DataBind();
    }
    public DataTable getAssociatesDetailNewlatest(clsUser objUser)
    {
        string str_query = @"select " + objUser.Pincode + @" ud.sponserId,ud.AssociateId,ud.AssociateName,convert(nvarchar(50),ud.DateofBirth,106) as DateofBirth,ud.Gender,ud.Email,ud.Mobile,ud.Address, 
                                ud.RegDate as RegDate,case when ud.StandingPosition='1' then 'Left' else 'Right' end as StandingPosition, 
                               ud.ParentAssociateId,Ud.AssociateName as parentname from AssociateDetail ud 
                                 where  ud.sponserId='" + objUser.UserId + "'  order by ud.regdate desc";
        DataTable dt = null;
        ObjData.StartConnection();
        try
        {
            dt = ObjData.RunDataTable(str_query);
        }
        catch (Exception ex)
        {
            dt = null;
        }
        ObjData.EndConnection();
        return dt;
    }

    protected void ddlRecordFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillAssociatesDetails();
    }
}