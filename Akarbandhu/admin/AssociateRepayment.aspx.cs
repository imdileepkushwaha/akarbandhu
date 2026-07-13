using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class admin_ProjectAdd : System.Web.UI.Page
{
    clsBooking objbooking = new clsBooking();
    clsUser objassociate = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
               
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }

    void loadassociatedetail()
    {
        DataTable dt = new DataTable();
        objassociate.UserId = txtassociateid.Text;
        dt = objassociate.getAssociateName(objassociate);
        if (dt.Rows.Count > 0)
        {
            txtassociatename.Text = dt.Rows[0]["Associatename"].ToString();
        }
        else
        {
            txtassociateid.Text = "";
            txtassociatename.Text = "";
            Message.Show("Invalid Associate Id");
        }
    }
  

    protected void txtassociateid_TextChanged(object sender, EventArgs e)
    {
        loadassociatedetail();
    }
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        objassociate.UserId = txtassociateid.Text;
        objassociate.Amount = Convert.ToDecimal(txtamount.Text);
        objassociate.PaymentDate = Message.GetIndianDate(txtpaymentdate.Text);
        objassociate.PaymentMode = ddpaymentmode.SelectedValue.ToString();
        objassociate.ChequeNo = txttransactionid.Text;
        objassociate.MentionBy = Session["useradmin"].ToString();

        string res = objassociate.Insert_AssociateAdvanceRepayment(objassociate);
        if (res == "t")
        {
            Message.Show("Record inserted successfully.");
            txtassociateid.Text = txtassociatename.Text = txtpaymentdate.Text = txtamount.Text = txttransactionid.Text = "";
            ddpaymentmode.SelectedValue = "0";
        }
        else
        {
            Message.Show("Unknown Error Occurred...");
        }
    }

    protected void ddpaymentmodedp_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}