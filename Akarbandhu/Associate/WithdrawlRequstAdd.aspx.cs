using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class user_WithdrawlRequstAdd : System.Web.UI.Page
{
    clsEPin objEPin = new clsEPin();
    clsUser objUser = new clsUser();
    clsAccount objaccount = new clsAccount();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["associateid"] != null)
        {
            if (!IsPostBack)
            {
                txtuserid.Text = Session["associateid"].ToString();
                txtuserid.Enabled = false;
                loadsusername();
                loadcurrentpool();
               
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    void loadcurrentpool()
    {

        //int currentpool = 0;
        //DataTable dt = new DataTable();
        //objUser.UserId = Session["userid"].ToString();
        //dt = objUser.getUserCurrentPool(objUser);
        //if (dt.Rows.Count > 0)
        //{
        //    currentpool = Convert.ToInt32( dt.Rows[0]["poolno"].ToString() );           
        //}
        //else
        //{
        //    currentpool = 0;
        //}
        //if (currentpool > 0)
        //{
        //    pnlwithdrawl.Visible = false;
        //    pnlnotelegible.Visible = false;
        //    pnlpool.Visible = true;
        //}
        //else
        //{
        //    pnlwithdrawl.Visible = true;
        //    pnlnotelegible.Visible = false;
        //    pnlpool.Visible = false;
        //}

    }
 
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        loadsusername();
    }
    void loadsusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getAssociateName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["associatename"].ToString();
            objaccount.UserId = txtuserid.Text;
            DataTable dtbalnce = new DataTable();
            dtbalnce = objaccount.getAccountBalanceForGetHelpAssociate(objaccount);
            if (dtbalnce.Rows.Count > 0)
            {
                txtbalance.Text = dtbalnce.Rows[0][0].ToString();
            }
            else {
                txtbalance.Text = "0";
            }
        }
        else
        {
            txtusername.Text = "";
            txtuserid.Text = "";
            Message.Show("Invalid User Id...!!!");
        }
    }
 
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text != "")
        {
            if (txtusername.Text != "")
            {
                if (txtamount.Text != "")
                {
                    if (Convert.ToDecimal(txtbalance.Text) >= Convert.ToDecimal(txtamount.Text))
                    {
                        if (Convert.ToDecimal(txtamount.Text) >= 100.00M)
                        {
                            //if (Convert.ToDecimal(txtamount.Text) <= 200000.00M)
                            //{
                                objaccount.WithdrawlAmount = Convert.ToDecimal(txtamount.Text);
                                objaccount.MentionBy = Session["associateid"].ToString();
                                objaccount.UserId = Session["associateid"].ToString();
                                string rs = objaccount.Insert_AssociateWithdrawlRequest(objaccount);
                                if (rs == "t")
                                {
                                    Message.Show("Request Submitted Successfully...!!!");
                                    txtamount.Text = "";
                                    loadsusername();
                                }
                                else if (rs == "f")
                                {
                                    Message.Show("Can not add withdrawl request. There is already a pending withdrwal request...!!!");
                                }
                                else
                                {
                                    Message.Show("Unknown Error Occurred...!!!");
                                }
                            //}
                            //else
                            //{
                            //    Message.Show("Withdrwal Amount Must Be Less Than 200000...!!!");
                            //}
                        }
                        else
                        {
                            Message.Show("Withdrwal Amount Must Be Greater Than 100...!!!");
                        }
                    }
                    else
                    {
                        Message.Show("Withdrawl Amount Must Be Lesss Than Or Equal Than Account Balance...!!!");
                    }
                }
                else
                {
                    Message.Show("Enter No of E-Pins...!!!");
                }
            }
            else
            {
                Message.Show("Enter User Name...!!!");
            }
        }
        else
        {
            Message.Show("Enter User Id...!!!");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}