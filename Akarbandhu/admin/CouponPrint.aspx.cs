using System;
using System.Data;
using BusinessLogicTier;

public partial class admin_CouponPrint : System.Web.UI.Page
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
        string couponNo = Request.QueryString["code"];
        DataTable dt = null;

        if (!string.IsNullOrEmpty(accountNo))
            dt = objJB.getCouponByAccount(accountNo);
        else if (!string.IsNullOrEmpty(couponNo))
            dt = objJB.getCouponByNo(couponNo);

        if (dt != null && dt.Rows.Count > 0)
        {
            DataRow r = dt.Rows[0];
            pnlCoupon.Visible = true;
            lblCouponNo.Text = Convert.ToString(r["CouponNo"]);
            lblAssociateId.Text = Convert.ToString(r["AssociateId"]);
            lblAssociateName.Text = Convert.ToString(r["AssociateName"]);
            lblMobile.Text = Convert.ToString(r["AssociateMobile"]);
            lblUser.Text = Convert.ToString(r["UserId"]) + " / " + Convert.ToString(r["UserName"]);
            lblPlotArea.Text = Convert.ToString(r["PlotArea"]);
            lblPlotAmount.Text = Convert.ToString(r["PlotAmount"]);
            lblCouponAmount.Text = Convert.ToString(r["CouponAmount"]);
            lblBookingDate.Text = Convert.ToDateTime(r["BookingDate"]).ToString("dd/MM/yyyy");
            imgQR.ImageUrl = QRHelper.GetQrImageUrl(Convert.ToString(r["QRText"]), 120);
        }
        else
        {
            lblError.Text = "Coupon not found.";
        }
    }
}
