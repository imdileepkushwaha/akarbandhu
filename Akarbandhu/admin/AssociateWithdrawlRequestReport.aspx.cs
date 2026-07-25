using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataTier;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;
using BusinessLogicTier;
public partial class admin_UserReport : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsAccount objaccount = new clsAccount();
    clsUser objUser = new clsUser();
    clsBank objbank = new clsBank();
    
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
            Response.Redirect("logout.aspx");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loadgethelp();
    }
    void loadgethelp()
    {
        if (txtfromdate.Text != "" && txttodate.Text != "")
        {
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objaccount.FromDate = DateTime.MinValue;
            objaccount.ToDate = DateTime.MinValue;
        }
        objaccount.WithdrawlRequestStatus = ddstatus.SelectedValue.ToString();
        DataTable dt = new DataTable();
        objaccount.UserId = txtuserid.Text;
        dt = getAssociateWithdrawlRequest(objaccount);
        GridView1.DataSource = dt;
        GridView1.DataBind();

    }

    public DataTable getAssociateWithdrawlRequest(clsAccount objaccount)
    {
        string str_query = "select wr.*,ud.associatename,ud.SponserId, bb.BankName, ud.AccountNo, ud.IFSCCode from Associatewithdrawlrequest wr LEFT JOIN associatedetail ud ON wr.AssociateId=ud.associateid LEFT JOIN BankMaster bb ON ud.BankName=bb.BankId  where 1=1  ";


        if (objaccount.FromDate != DateTime.MinValue && objaccount.ToDate != DateTime.MinValue)
        {
            str_query += "  and convert(date, wr.mentiondate ) >=  convert(date,'" + objaccount.FromDate + "')   and  convert(date,wr.mentiondate )  <=  convert(date,'" + objaccount.ToDate + "') ";
        }



        if (objaccount.WithdrawlRequestStatus != "0")
        {
            str_query += "  and wr.status = '" + objaccount.WithdrawlRequestStatus + "' ";
        }

        if (objaccount.UserId != "")
        {
            str_query += "  and wr.AssociateId = '" + objaccount.UserId + "' ";
        }


        str_query += " order by wr.mentiondate  desc";



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
    protected void grdGetHelp_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblstatus = (Label)e.Row.FindControl("lblstatus");
            Label lbltransactionid=(Label)e.Row.FindControl("lbltransactionid");
            TextBox txttransactionid = (TextBox)e.Row.FindControl("txttransactionid");
            DropDownList ddmode = (DropDownList)e.Row.FindControl("ddmode");
            LinkButton btnApprove = (LinkButton)e.Row.FindControl("btnApprove");
            LinkButton btnReject = (LinkButton)e.Row.FindControl("btnReject");
            if (lblstatus.Text == "Pending")
            {
                lblstatus.Text = "Pending";
                lblstatus.CssClass = "badge bg-warning text-white";
                btnApprove.Visible = true;
                btnReject.Visible = true;
                ddmode.Visible = true;
                txttransactionid.Visible = true;
                lbltransactionid.Visible = false;
            }
            else
                if (lblstatus.Text == "Approved")
                {
                    lblstatus.Text = "Approved";
                    lblstatus.CssClass = "badge bg-success text-white";
                    btnApprove.Visible = false;
                    btnReject.Visible = false;
                    ddmode.Visible = false;
                    txttransactionid.Visible = false;
                    lbltransactionid.Visible = true;
                }
                else

                    if (lblstatus.Text == "Rejected")
                    {
                        lblstatus.Text = "Rejected";
                        lblstatus.CssClass = "badge bg-danger text-white";
                        btnApprove.Visible = false;
                        btnReject.Visible = false;
                        ddmode.Visible = false;
                        txttransactionid.Visible = false;
                        lbltransactionid.Visible = false;
                    }

        }
    }
    protected void btnApprove_click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        Label lblgalleryid = (Label)gvRow.FindControl("lblId");
        Label lblamount = (Label)gvRow.FindControl("lblamount");
        Label lbluserid = (Label)gvRow.FindControl("lbluserid");
        TextBox txttransactionid = (TextBox)gvRow.FindControl("txttransactionid");
        DropDownList ddpaymentmode = (DropDownList)gvRow.FindControl("ddmode");
        objaccount.UserId = lbluserid.Text;
        objaccount.WithdrawlAmount = Convert.ToDecimal( lblamount.Text);
     
        objaccount.PaymentMode = ddpaymentmode.SelectedValue.ToString();
        objaccount.WithdrawlRequestId = lblgalleryid.Text;
        objaccount.MentionBy = Session["useradmin"].ToString();
        objaccount.OnlineTransactionId = txttransactionid.Text;
        objaccount.Approve_AssociateWithdrawlRequest(objaccount);
        loadgethelp();
    }
    protected void btnReject_click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        Label lblgalleryid = (Label)gvRow.FindControl("lblId");
        objaccount.WithdrawlRequestId = lblgalleryid.Text;
        objaccount.MentionBy = Session["useradmin"].ToString();
        objaccount.Reject_AssociateWithdrawlRequest(objaccount);
        loadgethelp();
       
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    void loadbank()
    {
        ddbank.Items.Clear();
        DataTable dt = new DataTable();
        dt = objbank.getBank();
        ddbank.DataSource = dt;
        ddbank.DataTextField = "BankName";
        ddbank.DataValueField = "BankID";
        ddbank.DataBind();
        ListItem li = new ListItem("Select Bank", "0");
        ddbank.Items.Insert(0, li);
    }
    void loaddata(string userid)
    {
        objUser.UserId = userid;
        DataTable dt = new DataTable();
        dt = objUser.getUserDetail(objUser);
        if (dt.Rows.Count > 0)
        {
            loadbank();
            txtuseridedit.Text = dt.Rows[0]["userid"].ToString(); 
            txtusernameedit.Text = dt.Rows[0]["username"].ToString(); 
            txtaccountholdername.Text = dt.Rows[0]["accountholdername"].ToString(); ;
            txtaccountno.Text = dt.Rows[0]["accountno"].ToString(); ;
            txtpan.Text = dt.Rows[0]["pannumber"].ToString(); ;
            txtifsccode.Text = dt.Rows[0]["ifsccode"].ToString(); ;
            txtbranchname.Text = dt.Rows[0]["branchname"].ToString(); ;
            ddbank.SelectedValue = dt.Rows[0]["bankname"].ToString(); ;
            txtpaytmmobileno.Text = dt.Rows[0]["PaytmMobileNo"].ToString();
        }
    }
    protected void lbView_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        Label lbluserid = (Label)gvRow.FindControl("associateid");
        loaddata(lbluserid.Text);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        
    }
}