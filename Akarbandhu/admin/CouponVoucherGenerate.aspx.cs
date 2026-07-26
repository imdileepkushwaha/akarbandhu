using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;

public partial class admin_CouponVoucherGenerate : System.Web.UI.Page
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
            LoadAssociates();
        }
    }

    void LoadAssociates()
    {
        ddassociate.Items.Clear();
        DataTable dt = objJB.getAssociateListForBonus();
        ddassociate.DataSource = dt;
        ddassociate.DataTextField = "DisplayName";
        ddassociate.DataValueField = "AssociateId";
        ddassociate.DataBind();
        ddassociate.Items.Insert(0, new ListItem("Select Associate", "0"));
        ddassociate.Items.Insert(1, new ListItem("All Associates", "ALL"));
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ddassociate.SelectedValue == "0")
        {
            Toast("toastr.warning('Warning', 'Select Associate');");
            return;
        }
        LoadGrid();
    }

    void LoadGrid()
    {
        if (ddassociate.SelectedValue == "ALL")
            objJB.AssociateId = "0";
        else
            objJB.AssociateId = ddassociate.SelectedValue;

        objJB.PlotAreaFilter = Convert.ToDecimal(ddplotarea.SelectedValue);
        DataTable dt = objJB.getPendingBonusBookings(objJB);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        divList.Visible = true;
        LoadAssociates();
        if (objJB.AssociateId == "0")
            ddassociate.SelectedValue = "ALL";
        else if (ddassociate.Items.FindByValue(objJB.AssociateId) != null)
            ddassociate.SelectedValue = objJB.AssociateId;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;

        DataRowView drv = (DataRowView)e.Row.DataItem;
        LinkButton btnCoupon = (LinkButton)e.Row.FindControl("btnCoupon");
        LinkButton btnVoucher = (LinkButton)e.Row.FindControl("btnVoucher");
        HyperLink lnkPrintCoupon = (HyperLink)e.Row.FindControl("lnkPrintCoupon");
        HyperLink lnkPrintVoucher = (HyperLink)e.Row.FindControl("lnkPrintVoucher");

        bool couponDone = Convert.ToInt32(drv["IsCouponGenerated"]) == 1;
        bool voucherDone = Convert.ToInt32(drv["IsVoucherGenerated"]) == 1;

        if (btnCoupon != null)
        {
            btnCoupon.Visible = !couponDone;
            if (couponDone && lnkPrintCoupon != null) lnkPrintCoupon.Visible = true;
        }
        if (btnVoucher != null)
        {
            btnVoucher.Visible = !voucherDone;
            if (voucherDone && lnkPrintVoucher != null) lnkPrintVoucher.Visible = true;
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string accountNo = Convert.ToString(e.CommandArgument);
        objJB.AccountNo = accountNo;
        objJB.MentionBy = Session["useradmin"].ToString();
        objJB.VerifyBaseUrl = QRHelper.GetSiteRootUrl();

        if (e.CommandName == "createcoupon")
        {
            string res = objJB.CreateCoupon(objJB);
            if (res == "f")
                Toast("toastr.warning('Warning', 'Coupon already generated for this booking');");
            else if (res == "n" || res == "0")
                Toast("toastr.error('Error', 'Unable to generate coupon');");
            else
            {
                Toast("toastr.success('Success', 'Coupon generated successfully');");
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "window.open('CouponPrint.aspx?AccountNo=" + accountNo + "','_blank');", true);
            }
            LoadGrid();
        }
        else if (e.CommandName == "createvoucher")
        {
            string res = objJB.CreateCashbackVouchers(objJB);
            if (res == "f")
                Toast("toastr.warning('Warning', 'Cashback vouchers already generated for this booking');");
            else if (res == "n" || res == "0")
                Toast("toastr.error('Error', 'Unable to generate cashback vouchers');");
            else
            {
                Toast("toastr.success('Success', '8 Cashback vouchers generated successfully');");
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "window.open('CashbackVoucherPrint.aspx?AccountNo=" + accountNo + "','_blank');", true);
            }
            LoadGrid();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    void Toast(string script)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), script, true);
    }
}
