using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class admin_DPReport : System.Web.UI.Page
{
    clsBooking objbooking = new clsBooking();
    clsProject objProject = new clsProject();
    clsPlan objplan = new clsPlan();
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

  
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaddata();
    }
    void loaddata()
    {
        objbooking.UserId = txtcustomerid.Text.Trim();
        objbooking.BookingId = txtbookingid.Text;
        if (txtfromdate.Text != "" && txttodate.Text != "")
        {
            objbooking.FromDate = Message.GetIndianDate(txtfromdate.Text);
            objbooking.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objbooking.FromDate = DateTime.MinValue;
            objbooking.ToDate = DateTime.MinValue;
        }
        objbooking.BusinessType = ddbusinesstype.SelectedValue.ToString();
        objbooking.SponserId = txtassociateid.Text.Trim();



        DataTable dt = new DataTable();
        dt = objbooking.getbusinessreport(objbooking);
        if (dt.Rows.Count > 0)
        {
            pnllist.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //GridView1.FooterRow.Cells[5].Text = "Cleared Bal";
            //GridView1.FooterRow.Cells[6].Text = dt.Compute("Sum(InstAmt)", "").ToString();
            //GridView1.FooterRow.Cells[7].Text = "Uncleared Bal";
            //GridView1.FooterRow.Cells[8].Text = dt.Rows[0]["unclearedbal"].ToString();
            GridView1.FooterRow.Cells[9].Text = "Total";
            GridView1.FooterRow.Cells[10].Text = dt.Compute("Sum(InstAmt)", "").ToString();

        }
        else
        {
            pnllist.Visible = false;
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=businessreport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (System.IO.StringWriter sw = new System.IO.StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            //To Export all pages
            GridView1.AllowPaging = false;
            loaddata();

            GridView1.HeaderRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = System.Drawing.Color.White;
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
}