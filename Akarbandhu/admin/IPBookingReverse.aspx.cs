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
        DataTable dt = new DataTable();
        objbooking.BookingId = txtbookingid.Text;
        dt = objbooking.getBookingDetail(objbooking);

        if (dt.Rows.Count > 0)
        {
            lblBookingid.Text = dt.Rows[0]["accountno"].ToString();
            lblcustomerid.Text = dt.Rows[0]["userid"].ToString();
            lblcustomername.Text = dt.Rows[0]["username"].ToString();
            lblplanname.Text = dt.Rows[0]["PlanName"].ToString();
            lblbookingamount.Text = dt.Rows[0]["bookingamount"].ToString();
            lblbookingdate.Text = Convert.ToDateTime(dt.Rows[0]["bookingdate"].ToString()).ToString("dd/MM/yyyy");
            pnldetail.Visible = true;
          
        }
        else
        {
            lblBookingid.Text = "";
            lblcustomerid.Text = "";
            lblcustomername.Text = "";
            lblplanname.Text = "";
            lblbookingdate.Text = "";
            pnldetail.Visible = false;
        }
    }

    protected void btnReverse_Click(object sender, EventArgs e)
    {
        objbooking.BookingId = lblBookingid.Text;
        objbooking.Remark = txtremark.Text;
        objbooking.MentionBy = Session["useradmin"].ToString();
        string res = objbooking.Reverse_IPBooking(objbooking);
        if (res == "t")
        {
            Message.Show("Booking Reversed Successfully.");
            pnldetail.Visible = false;
            lblBookingid.Text = "";
            lblcustomerid.Text = "";
            lblcustomername.Text = "";
            lblplanname.Text = "";
            lblbookingdate.Text = "";
            txtremark.Text = "";
        }
        else if (res == "f")
        {
            Message.Show("Please Reverse all paid installments...!!!");
        }
        else
        {
            Message.Show("Unknown Error Occurred...!!!");
        }
    }
}