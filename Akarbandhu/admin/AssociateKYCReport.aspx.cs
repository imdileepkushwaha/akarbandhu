using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserReport : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
               
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
   
 
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       
    }
  
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    void loaduser()
    {
        objUser.UserName = txtname.Text;
        objUser.Mobile = txtmobile.Text;
        objUser.Email = txtemail.Text;
       
        if (txtfromdate.Text != "")
        {
            objUser.FromDate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objUser.FromDate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objUser.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objUser.ToDate = DateTime.MinValue;
        }
        objUser.UserId = txtuserid.Text;
        objUser.PanCardStatus = ddpancardstatus.SelectedValue.ToString();
        DataTable dt = new DataTable();
        dt = objUser.getAssociateKYCReport(objUser);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
  
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    
  
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblpancardstatus = (Label)e.Row.FindControl("lblpancardstatus");
            LinkButton btnApprovePan = (LinkButton)e.Row.FindControl("btnApprovePan");
            LinkButton btnRejectPan = (LinkButton)e.Row.FindControl("btnRejectPan");
            if (lblpancardstatus.Text == "Pending")
            {
                lblpancardstatus.CssClass = "label label-info";
                btnApprovePan.Visible = true;
                btnRejectPan.Visible = true;
            }
            else
                if (lblpancardstatus.Text == "Approved")
                {
                    lblpancardstatus.CssClass = "label label-success";
                    btnApprovePan.Visible = false;
                    btnRejectPan.Visible = false;
                }
                else
                    if (lblpancardstatus.Text == "Rejected")
                    {
                        lblpancardstatus.CssClass = "label label-danger";
                        btnApprovePan.Visible = false;
                        btnRejectPan.Visible = false;
                    }

            Label lbladharcardstatus = (Label)e.Row.FindControl("lbladharcardstatus");
            LinkButton btnApproveAadhar = (LinkButton)e.Row.FindControl("btnApproveAadhar");
            LinkButton btnRejectAadhar = (LinkButton)e.Row.FindControl("btnRejectAadhar");
            if (lbladharcardstatus.Text == "Pending")
            {
                lbladharcardstatus.CssClass = "label label-info";
                btnApproveAadhar.Visible = true;
                btnRejectAadhar.Visible = true;
            }
            else
                if (lbladharcardstatus.Text == "Approved")
                {
                    lblpancardstatus.CssClass = "label label-success";
                    btnApproveAadhar.Visible = false;
                    btnRejectAadhar.Visible = false;
                }
                else
                    if (lbladharcardstatus.Text == "Rejected")
                    {
                        lbladharcardstatus.CssClass = "label label-danger";
                        btnApproveAadhar.Visible = false;
                        btnRejectAadhar.Visible = false;
                    }


            Label lbladdressproofstatus = (Label)e.Row.FindControl("lbladdressproofstatus");
            LinkButton btnApproveAddress = (LinkButton)e.Row.FindControl("btnApproveAddress");
            LinkButton btnRejectAddress = (LinkButton)e.Row.FindControl("btnRejectAddress");
            if (lbladdressproofstatus.Text == "Pending")
            {
                lbladdressproofstatus.CssClass = "label label-info";
                btnApproveAddress.Visible = true;
                btnRejectAddress.Visible = true;
            }
            else
                if (lbladdressproofstatus.Text == "Approved")
                {
                    lbladdressproofstatus.CssClass = "label label-success";
                    btnApproveAddress.Visible = false;
                    btnRejectAddress.Visible = false;
                }
                else
                    if (lbladdressproofstatus.Text == "Rejected")
                    {
                        lbladdressproofstatus.CssClass = "label label-danger";
                        btnApproveAddress.Visible = false;
                        btnRejectAddress.Visible = false;
                    }
        }
    }
    protected void btnRejectPan_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        Label lbluserid = (Label)gvRow.FindControl("lbluserid");
        objUser.UserId = lbluserid.Text;
        objUser.PanCardStatus = "Rejected";
        objUser.Update_PanCardStatus(objUser);
        loaduser();
    }
    protected void btnApprovePan_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        Label lbluserid = (Label)gvRow.FindControl("lbluserid");
        objUser.UserId = lbluserid.Text;
        objUser.PanCardStatus = "Approved";
        objUser.Update_PanCardStatus(objUser);
        loaduser();
    }
    protected void btnApproveAadhar_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        Label lbluserid = (Label)gvRow.FindControl("lbluserid");
        objUser.UserId = lbluserid.Text;
        objUser.AadharCardStatus = "Approved";
        objUser.Update_AadharCardStatus(objUser);
        loaduser();
    }
    protected void btnRejectAadhar_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        Label lbluserid = (Label)gvRow.FindControl("lbluserid");
        objUser.UserId = lbluserid.Text;
        objUser.AadharCardStatus = "Rejected";
        objUser.Update_AadharCardStatus(objUser);
        loaduser();
    }
    protected void btnApproveAddress_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        Label lbluserid = (Label)gvRow.FindControl("lbluserid");
        objUser.UserId = lbluserid.Text;
        objUser.BankProofStatus = "Approved";
        objUser.Update_BankProofStatus(objUser);
        loaduser();
    }
    protected void btnRejectAddress_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        Label lbluserid = (Label)gvRow.FindControl("lbluserid");
        objUser.UserId = lbluserid.Text;
        objUser.BankProofStatus = "Rejected";
        objUser.Update_BankProofStatus(objUser);
        loaduser();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        loaduser();
    }
}