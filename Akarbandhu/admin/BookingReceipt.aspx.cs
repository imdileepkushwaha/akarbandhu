using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using DataTier;
using BusinessLogicTier;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class Branch_BookingReceipt : System.Web.UI.Page
{
    clsBooking objbooking = new clsBooking();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
            loadReciept();
        }

    }

    public void loadReciept()
    {
        try
        {
            string accountno = Request.QueryString["BookingId"].ToString();
            objbooking.BookingId = accountno;
            DataTable dt = new DataTable();
            dt = objbooking.getBookingReceipt(objbooking);
            if (dt != null && dt.Rows.Count > 0)
            {
                rptfdreciept.Visible = true;
                rptfdreciept.LocalReport.ReportPath = "Reports/rptBookingReceipt.rdlc";
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
                viewer.LocalReport.ReportPath = "Reports/rptBookingReceipt.rdlc";
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

            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }
}