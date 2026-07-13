using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;
using BusinessLogicTier;

public partial class admin_EPinAdd : System.Web.UI.Page
{
    clsPlan objplan = new clsPlan();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
                loadplan();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    void loadplan()
    {
        DataTable dt = new DataTable();
        dt = objplan.getPlan();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ddplantype.SelectedValue != "0")
        {
            if (txtplanname.Text != "")
            {
                //if (txtlandamount.Text != "")
                //{
                if (txtbookingamount.Text != "")
                {
                    if (txtdepositterm.Text != "")
                    {
                        objplan.PlanType = ddplantype.SelectedValue.ToString();
                        objplan.PlanName = txtplanname.Text;
                        objplan.LandAmount = Convert.ToDecimal("0");
                        objplan.BookingAmountPercent = Convert.ToDecimal(txtbookingamount.Text);
                        objplan.DepositTerm = Convert.ToInt32(txtdepositterm.Text);
                        objplan.MentionBy = Session["useradmin"].ToString();
                        string rs = objplan.Insert_Plan(objplan);
                        if (rs == "t")
                        {
                            Message.Show("Plan Added Successfully...!!!");
                            loadplan();
                            txtplanname.Text = "";
                            ddplantype.SelectedValue = "0";
                            // txtlandamount.Text="";
                            txtbookingamount.Text = "";
                            txtdepositterm.Text = "";
                        }
                        else
                            if (rs == "f")
                        {
                            Message.Show("Plan Name Already Exists...!!!");
                        }
                        else

                        {
                            Message.Show("Unknown Error Occurred...!!!");
                        }
                    }
                    else
                    {
                        Message.Show("Enter Deposit Term...!!!");
                    }
                }
                else
                {
                    Message.Show("Enter Booking Amount (%)...!!!");
                }
                //}
                //else
                //{
                //    Message.Show("Enter land Amount...!!!");
                //}
            }
            else
            {
                Message.Show("Enter Plan Name...!!!");
            }
        }
        else
        {
            Message.Show("Select Plan Type...!!!");
        }
    }
    protected void ddplantype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddplantype.SelectedValue == "FP")
        {
            txtdepositterm.Text = "1";
            txtbookingamount.Text = "100";
            txtdepositterm.Enabled = false;
            txtbookingamount.Enabled = false;
        }
        else
        {
            txtdepositterm.Text = "";
            txtbookingamount.Text = "";
            txtdepositterm.Enabled = true;
            txtbookingamount.Enabled = true;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}