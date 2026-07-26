using System;
using System.Data;
using BusinessLogicTier;

public partial class admin_CashbackVoucherPrint : System.Web.UI.Page
{
    clsJeevanBhumi objJB = new clsJeevanBhumi();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("index.aspx");
            return;
        }

        string accountNo = Request.QueryString["AccountNo"];
        if (string.IsNullOrEmpty(accountNo))
        {
            lblError.Text = "Account No missing.";
            return;
        }

        DataTable dt = objJB.getVouchersByAccount(accountNo);
        if (dt != null && dt.Rows.Count > 0)
        {
            rptVouchers.DataSource = dt;
            rptVouchers.DataBind();
        }
        else
        {
            lblError.Text = "Cashback vouchers not found for this booking.";
        }
    }
}
