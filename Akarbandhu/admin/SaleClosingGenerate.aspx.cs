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
    clsClosing objclosing = new clsClosing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
                LoadStartDate();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }

    public void LoadStartDate()
    {
        DataSet ds = new DataSet();
        ds = objclosing.getStartDateSale();
        if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0][0].ToString() != "")
        {
            DateTime Start_Date = Convert.ToDateTime(ds.Tables[0].Rows[0]["End_Date"].ToString());
            //Start_Date = Start_Date.AddDays(1);
            txtfromdate.Text = Start_Date.ToString("dd/MM/yyyy");
        }
        else
        {
            if (ds.Tables[1].Rows.Count > 0)
            {
                txtfromdate.Text = ds.Tables[1].Rows[0]["Start_Date"].ToString();
            }
            else
            {
                Message.Show("No Data Available For Closing...");
                txtfromdate.Text = "";
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txttodate.Text != "")
        {
            if (Message.GetIndianDate(txttodate.Text) >= Message.GetIndianDate(txtfromdate.Text))
            {


                objclosing.FromDate = Message.GetIndianDate(txtfromdate.Text);
                objclosing.ToDate = Message.GetIndianDate(txttodate.Text);
                objclosing.MentionBy = Session["useradmin"].ToString();
                string res = objclosing.GenerateClosingSale(objclosing);
                if (res == "t")
                {
                    string popupScript = "toastr.success('Success', 'Closing Generated Successfully');";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                    txttodate.Text = "";
                    LoadStartDate();
                }
                else
                    if (res == "f")
                {
                    string popupScript = "toastr.success('Success', 'Closing Already Generated');";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);

                }
                else
                {
                    string popupScript = "toastr.error('Error', 'Unknow error occurred');";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                }
            }
            else
            {
                string popupScript = "toastr.error('Error', 'To Date Must Be greater than or equa to from date');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);

            }
        }
        else
        {
            string popupScript = "toastr.error('Error', 'Enter To Date');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);

        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
}