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
    clsUser objuser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                //txtuserid.Text = Session["userid"].ToString();
                //txtuserid.Enabled = false;
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "myEdit")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblamount = (Label)GridView1.Rows[index].FindControl("lblamount");
            Label lbluserid = (Label)GridView1.Rows[index].FindControl("lbluserid");
            Label lbltranis = (Label)GridView1.Rows[index].FindControl("lbltranis");
            lblrequestid.Text = lblid.Text;
            txtuseridedit.Text = lbluserid.Text;
            txtamount.Text = lblamount.Text;
            txttransactionid.Text = lbltranis.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    void loaduser()
    {

        if (txtfromdate.Text != "")
        {
            objuser.FromDate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objuser.FromDate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objuser.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objuser.ToDate = DateTime.MinValue;
        }
        objuser.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = objuser.getFundRequestReport(objuser);
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
            LinkButton lbReverse = (LinkButton)e.Row.FindControl("lbReverse");
            Label lblstatus = (Label)e.Row.FindControl("lblstatus");
            if (lblstatus.Text == "Pending")
            {
                lbReverse.Visible = true;
                lblstatus.CssClass = "label label-info";
            }
            else
                if (lblstatus.Text == "Approved")
            {
                lbReverse.Visible = false;
                lblstatus.CssClass = "label label-success";
            }
            else
            if (lblstatus.Text == "Rejected")
            {
                lbReverse.Visible = false;
                lblstatus.CssClass = "label label-danger";
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objuser.Status = ddstatus.SelectedValue.ToString();
        objuser.Id = lblrequestid.Text;
        objuser.MentionBy = Session["useradmin"].ToString();
        string res = objuser.UpdateFundRequest(objuser);
        if (res == "t")
        {
            string popupScript = "toastr.success('Success', 'Bank Account Details Edited Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            string popupScript2 = "Closepopup();";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
            loaduser();
        }
        else
        {
            string popupScript = "toastr.error('Error', 'Unknow error occurred');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
    }
}