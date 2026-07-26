using System;
using System.Data;
using System.Web.UI;
using BusinessLogicTier;

public partial class admin_CouponVoucherReport : System.Web.UI.Page
{
    clsJeevanBhumi objJB = new clsJeevanBhumi();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("index.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadReport();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        LoadReport();
    }

    void LoadReport()
    {
        objJB.AssociateId = txtassociateid.Text.Trim();
        objJB.UserId = txtuserid.Text.Trim();
        objJB.AccountNo = txtaccountno.Text.Trim();

        if (txtfromdate.Text != "")
            objJB.FromDate = Message.GetIndianDate(txtfromdate.Text);
        else
            objJB.FromDate = DateTime.MinValue;

        if (txttodate.Text != "")
            objJB.ToDate = Message.GetIndianDate(txttodate.Text);
        else
            objJB.ToDate = DateTime.MinValue;

        DataTable dt = objJB.getGeneratedReport(objJB);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
