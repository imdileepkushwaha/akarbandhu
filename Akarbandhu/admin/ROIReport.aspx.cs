using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    clsClosing objclosing = new clsClosing();
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
        objaccount.UserId = txtuserid.Text;
        if (txtfromdate.Text != "")
        {
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objaccount.FromDate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objaccount.ToDate = DateTime.MinValue;
        }
        DataTable dt = new DataTable();
        dt = objaccount.getROIDetail(objaccount);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void ExportToExcel(object sender, EventArgs e)
    {
        GridView1.Columns[0].Visible = false;
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=ROIReport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            //To Export all pages
            GridView1.AllowPaging = false;
            loaduser();

            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblpaymentstatus = (Label)e.Row.FindControl("lblpaymentstatus");
            CheckBox ck1 = (CheckBox)e.Row.FindControl("ck1");
            if (lblpaymentstatus.Text == "Due")
            {
                lblpaymentstatus.CssClass = "label label-danger";
                ck1.Enabled = true;

            }
            else
                if (lblpaymentstatus.Text == "Paid")
                {
                    lblpaymentstatus.CssClass = "label label-success";
                    ck1.Enabled = false;

                }
        }
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        DataTable dtid = new DataTable();
        dtid.Columns.Add(new DataColumn("id", typeof(string)));
        dtid.Columns.Add(new DataColumn("mobile", typeof(string)));
        dtid.Columns.Add(new DataColumn("amount", typeof(string)));
        dtid.Columns.Add(new DataColumn("userid", typeof(string)));
        dtid.Columns.Add(new DataColumn("closingdate", typeof(string)));
        dtid.Columns.Add(new DataColumn("AccountNo", typeof(string)));
        dtid.Columns.Add(new DataColumn("ROIType", typeof(string)));

        foreach (GridViewRow r in GridView1.Rows)
        {
            CheckBox ck1 = (CheckBox)r.FindControl("ck1");
            if (ck1.Checked == true)
            {
                //Label lblid = (Label)r.FindControl("lblid");
                Label lblmobile = (Label)r.FindControl("lblmobile");
                Label lbluserid = (Label)r.FindControl("lbluserid");
                Label lblfinalamount = (Label)r.FindControl("lblfinalamount");
                Label lblclosingdate = (Label)r.FindControl("lblclosingdate");
                Label lblaccountno = (Label)r.FindControl("lblaccountno");
                Label lblroitype = (Label)r.FindControl("lbltype");
                dtid.Rows.Add("0", lblmobile.Text, lblfinalamount.Text, lbluserid.Text, lblclosingdate.Text, lblaccountno.Text, lblroitype.Text);
            }
        }
        if (dtid.Rows.Count > 0)
        {
            objaccount.dtData = dtid;
            objaccount.MentionBy = Session["useradmin"].ToString();
            string res = objaccount.ROIpayment(objaccount);
            if (res == "t")
            {
                string popupScript = "toastr.success('Success', 'ROI Paid Successfully');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                loaduser();
            }
            else
            {
                string popupScript = "toastr.error('Error', 'Unknown Error Occurred.');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
        }
        else
        {
            string popupScript = "toastr.error('Error', 'No Record Selected...');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
    }
}