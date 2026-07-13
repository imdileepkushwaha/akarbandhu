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
    clsBooking objbooking = new clsBooking();
    clsProject objProject = new clsProject();
    clsPlan objplan = new clsPlan();
    int counter = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
                loadcategory();
                //       loadbankAccountNo();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    void loadcategory()
    {
        ddcategory.Items.Clear();
        DataTable dt = new DataTable();
        dt = objbooking.getCategory();
        if (dt.Rows.Count > 0)
        {
            ddcategory.DataSource = dt;
            ddcategory.DataTextField = dt.Columns["categoryname"].ToString();
            ddcategory.DataValueField = dt.Columns["id"].ToString();
            ddcategory.DataBind();
        }
        ListItem li = new ListItem("Select Category", "0");
        ddcategory.Items.Insert(0, li);
    }
    void loaddata()
    {
        objbooking.UserName = txtcustomername.Text.Trim();
        objbooking.UserId = txtcustomerid.Text.Trim();
        objbooking.BookingId = txtbookingid.Text;
        objbooking.SponserId = txtassociateid.Text;
        objbooking.CategoryId = ddcategory.SelectedValue.ToString();
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
        DataTable dt = new DataTable();
        dt = objbooking.getSaleReport(objbooking);
        if (dt.Rows.Count > 0)
        {
            //   pnllist.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.FooterRow.Cells[6].Text = "Total";
            GridView1.FooterRow.Cells[7].Text = dt.Compute("Sum(paidamount)", "").ToString();
          
        }
        else
        {
            // pnllist.Visible = false;
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaddata();
    }
 

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //if (e.CommandName == "Inst")
        //{
        //    int index = Convert.ToInt32(e.CommandArgument);

        //    Label lblregid = (Label)GridView1.Rows[index].FindControl("lblBookingid");
        //    objbooking.BookingId = lblregid.Text;
        //    DataTable dt = new DataTable();
        //    dt = objbooking.getInstallment(objbooking);

        //    grdInstallment.DataSource = dt;
        //    grdInstallment.DataBind();


        //    DataTable dt2 = new DataTable();
        //    objbooking.BookingId = lblregid.Text;
        //    dt2 = objbooking.getBookingDetailForInst(objbooking);

        //    if (dt2.Rows.Count > 0)
        //    {
        //        lblBookingid.Text = dt2.Rows[0]["accountno"].ToString();
        //        lblcustomerid.Text = dt2.Rows[0]["memberid"].ToString();
        //        lblcustomername.Text = dt2.Rows[0]["membername"].ToString();
        //        lblplanname.Text = dt2.Rows[0]["PlanName"].ToString();
        //        lblbookingdate.Text = Convert.ToDateTime(dt2.Rows[0]["bookingdate"].ToString()).ToString("dd/MM/yyyy");
        //        lblbookingamount.Text = dt2.Rows[0]["BookingAmount"].ToString();
        //        lblinstno.Text = dt2.Rows[0]["newinstno"].ToString();
        //        lblinstamount.Text = dt2.Rows[0]["instamt"].ToString();
        //        lblinstduedate.Text = dt2.Rows[0]["instdate"].ToString();
        //    }

        //    pnlInstallment.Visible = true;
        //    pnlDPPayment.Visible = false;
        //}
        //else
        //    if (e.CommandName == "mypay")
        //{
        //    DataTable dt2 = new DataTable();
        //    int index = Convert.ToInt32(e.CommandArgument);

        //    Label lblregid = (Label)GridView1.Rows[index].FindControl("lblBookingid");
        //    objbooking.BookingId = lblregid.Text;
        //    dt2 = objbooking.getBookingDetailForInst(objbooking);

        //    if (dt2.Rows.Count > 0)
        //    {
        //        lblbookingiddp.Text = dt2.Rows[0]["accountno"].ToString();
        //        lblcustomeriddp.Text = dt2.Rows[0]["memberid"].ToString();
        //        lblcustomernamedp.Text = dt2.Rows[0]["membername"].ToString();
        //        lblplannamedp.Text = dt2.Rows[0]["PlanName"].ToString();
        //        lblbookingdatedp.Text = Convert.ToDateTime(dt2.Rows[0]["bookingdate"].ToString()).ToString("dd/MM/yyyy");
        //        lblbookingamountdp.Text = dt2.Rows[0]["BookingAmount"].ToString();
        //        lblpaidamountdp.Text = dt2.Rows[0]["totalpaid"].ToString();
        //        txtbalanceamountdp.Text = dt2.Rows[0]["balancedp"].ToString();
        //        lblbalanceamountdp.Text = dt2.Rows[0]["balancedp"].ToString();

        //    }

        //    pnlDPPayment.Visible = true;
        //    pnlInstallment.Visible = false;
        //}
    }
    protected void grdInstallment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    Label lblinststatus = (Label)e.Row.FindControl("lblinststatus");
        //    Label lblBookingid = (Label)e.Row.FindControl("lblBookingid");
        //    Label lblinstno = (Label)e.Row.FindControl("lblinstno");
        //    Literal ltinstaction = (Literal)e.Row.FindControl("ltinstaction");
        //    if (lblinststatus.Text == "DUE")
        //    {
        //        if (counter == 0)
        //        {
        //            ltinstaction.Text = @"<a href='IPInstallment.aspx?BookingId=" + lblBookingid.Text + @"&InstNo=" + lblinstno.Text + "' >Pay</a>";
        //        }
        //        counter++;
        //    }
        //    else
        //        if (lblinststatus.Text == "PAID")
        //        {
        //            ltinstaction.Text = @"<a href='InstallmentReceipt.aspx?BookingId=" + lblBookingid.Text + @"&InstNo=" + lblinstno.Text + "' target='_blank' >Receipt</a>";
        //        }
        //}
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=salereport.xls");
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