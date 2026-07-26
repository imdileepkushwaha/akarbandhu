using System;
using System.Data;
using BusinessLogicTier;

public partial class VerifyBonus : System.Web.UI.Page
{
    clsJeevanBhumi objJB = new clsJeevanBhumi();

    protected void Page_Load(object sender, EventArgs e)
    {
        string type = (Request.QueryString["type"] ?? "").ToUpperInvariant();
        string code = Request.QueryString["code"] ?? "";

        if (string.IsNullOrEmpty(code))
        {
            pnlBad.Visible = true;
            return;
        }

        if (type == "C")
        {
            DataTable dt = objJB.getCouponByNo(code);
            if (dt != null && dt.Rows.Count > 0)
            {
                BindCommon(dt.Rows[0], "Immediate Coupon", code);
                return;
            }
        }
        else if (type == "V")
        {
            DataTable dt = objJB.getVoucherByNo(code);
            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow r = dt.Rows[0];
                BindCommon(r, "Cashback Voucher", code);
                pnlVoucherExtra.Visible = true;
                lblCommission.Text = Convert.ToString(r["CommissionPercent"]);
                lblCashback.Text = Convert.ToString(r["CashbackAmount"]);
                lblVoucherDate.Text = Convert.ToDateTime(r["VoucherDate"]).ToString("dd/MM/yyyy");
                return;
            }
        }
        else
        {
            DataTable dtC = objJB.getCouponByNo(code);
            if (dtC != null && dtC.Rows.Count > 0)
            {
                BindCommon(dtC.Rows[0], "Immediate Coupon", code);
                return;
            }
            DataTable dtV = objJB.getVoucherByNo(code);
            if (dtV != null && dtV.Rows.Count > 0)
            {
                DataRow r = dtV.Rows[0];
                BindCommon(r, "Cashback Voucher", code);
                pnlVoucherExtra.Visible = true;
                lblCommission.Text = Convert.ToString(r["CommissionPercent"]);
                lblCashback.Text = Convert.ToString(r["CashbackAmount"]);
                lblVoucherDate.Text = Convert.ToDateTime(r["VoucherDate"]).ToString("dd/MM/yyyy");
                return;
            }
        }

        pnlBad.Visible = true;
    }

    void BindCommon(DataRow r, string typeName, string code)
    {
        pnlOk.Visible = true;
        lblType.Text = typeName;
        lblDocNo.Text = code;
        lblAssociateId.Text = Convert.ToString(r["AssociateId"]);
        lblAssociateName.Text = Convert.ToString(r["AssociateName"]);
        lblMobile.Text = Convert.ToString(r["AssociateMobile"]);
        lblPlotArea.Text = Convert.ToString(r["PlotArea"]);
        lblPlotAmount.Text = Convert.ToString(r["PlotAmount"]);
    }
}
