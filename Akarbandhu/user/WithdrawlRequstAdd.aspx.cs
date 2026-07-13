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
        if (Session["userid"] != null)
        {
            if (!IsPostBack)
            {
                txtuserid.Text = Session["userid"].ToString();
                txtuserid.Enabled = false;
                loadsusername();

                loadcurrentpool();
                loadnotification();
                loadtematopupcount();
                loadcurrentpool2();
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
    void loadtematopupcount()
    {
        int currentpool = 0;
        DataTable dt = new DataTable();
        objUser.UserId = Session["userid"].ToString();
        dt = objUser.getUserCurrentPool(objUser);
        if (dt.Rows.Count > 0)
        {
            currentpool = Convert.ToInt32(dt.Rows[0]["poolno"].ToString());
        }
        else
        {
            currentpool = 0;
        }


       
        int count = 0;
        objUser.UserId = Session["userid"].ToString();
        dt = objUser.getTeamTopupCount(objUser);
        if (dt.Rows.Count > 0)
        {
            count = Convert.ToInt32(dt.Rows[0]["total"].ToString());

            if (count >= currentpool)
            {
                pnlwithdrawl.Visible = true;
                pnlnotelegible.Visible = false;
            }
            else
            {
                pnlwithdrawl.Visible = false;
                pnlnotelegible.Visible = true;
            }
        }
        else
        {
            count = 0;
        }

      
    }
    void loadnotification()
    {
        objUser.UserId = Session["userid"].ToString();
        DataTable dt = new DataTable();
        dt = objUser.getUserDetail(objUser);
        if (dt.Rows[0]["activestatus"].ToString() == "0")
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        loadsusername();
    }
    void loadsusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();
            objaccount.UserId = txtuserid.Text;
            DataTable dtbalnce = new DataTable();
            dtbalnce = objaccount.getAccountBalanceForGetHelp(objaccount);
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
    void loadcurrentpool2()
    {
        int currentpool = 0;
        DataTable dt = new DataTable();
        objUser.UserId = Session["userid"].ToString();
        dt = objUser.getUserCurrentPool(objUser);
        if (dt.Rows.Count > 0)
        {
            currentpool = Convert.ToInt32(dt.Rows[0]["poolno"].ToString());
            if (dt.Rows[0]["downlinecount"].ToString() == "21")
            {
                lblerrormsg.Text = "Please upgrade your id for withdrawl";
                pnlnotelegible.Visible = true;
                pnlwithdrawl.Visible = false;
            }
            else
            {
                lblerrormsg.Text = "You are not elegible. Please sponser new id or topup any old id";
                pnlwithdrawl.Visible = true;
                pnlnotelegible.Visible = false;
            }
        }
        else
        {

        }

        if (currentpool == 1)
        {
          
            pnlwithdrawl.Visible = false;
            pnlnotelegible.Visible = true;
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
                        if (Convert.ToDecimal(txtamount.Text) >= 1000.00M)
                        {
                            if (Convert.ToDecimal(txtamount.Text) <= 2000.00M)
                            {
                                objaccount.WithdrawlAmount = Convert.ToDecimal(txtamount.Text);
                                objaccount.MentionBy = Session["userid"].ToString();
                                objaccount.UserId = Session["userid"].ToString();
                                string rs = objaccount.Insert_WithdrawlRequest(objaccount);
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
                            }
                            else
                            {
                                Message.Show("Withdrwal Amount Must Be Less Than 2000...!!!");
                            }
                        }
                        else
                        {
                            Message.Show("Withdrwal Amount Must Be Greater Than 1000...!!!");
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