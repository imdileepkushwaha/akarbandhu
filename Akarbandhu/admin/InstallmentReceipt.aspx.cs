using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;
using System.Data;
using System.IO;

public partial class admin_BookingReceipt : System.Web.UI.Page
{
    clsBooking objbooking = new clsBooking();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["BookingId"] != null)
            {
                DataTable dt = new DataTable();
                objbooking.BookingId = Request.QueryString["BookingId"].ToString();
                objbooking.InstNo = Convert.ToInt32(Request.QueryString["InstNo"].ToString());
                dt = objbooking.getInstallmentReceipt(objbooking);

                if (dt.Rows.Count > 0)
                {

                    rptfdreciept.Visible = true;
                    rptfdreciept.LocalReport.ReportPath = "Reports/InstallmentReceipt.rdlc";
                    rptfdreciept.LocalReport.DataSources.Clear();
                    rptfdreciept.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    // Variables
                    Warning[] warnings;
                    string[] streamIds;
                    string mimeType = string.Empty;
                    string encoding = string.Empty;
                    string extension = string.Empty;


                    // Setup the report viewer object and get the array of bytes
                    ReportViewer viewer = new ReportViewer();
                    viewer.ProcessingMode = ProcessingMode.Local;
                    viewer.LocalReport.ReportPath = "Reports/InstallmentReceipt.rdlc";
                    viewer.LocalReport.DataSources.Add(rds); // Add datasource here


                    byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

                    // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
                    //Response.Buffer = true;
                    //Response.Clear();
                    //Response.ContentType = mimeType;
                    //Response.AddHeader("content-disposition", "attachment; filename=" + "Passbookfirstpage" + "." + extension);
                    //Response.BinaryWrite(bytes); // create the file
                    //Response.Flush(); // send it to the client to download


                    if (bytes != null)
                    {
                        Response.ContentType = "application/pdf";
                        Response.AddHeader("content-length", bytes.Length.ToString());
                        Response.BinaryWrite(bytes);
                    }

                }
                else
                {
                    Message.Show("Booking Id Not Found...!!!");
                }
            }
            else
            {
                Message.Show("Booking Id Not Found...!!!");
            }
        }
    }
}