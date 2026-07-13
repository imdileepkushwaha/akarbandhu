using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;
using System.Data.SqlClient;
using System.Data;

public partial class admin_index : System.Web.UI.Page
{
    clsLogin objlogin = new clsLogin();
    clsUser objuser = new clsUser();
  
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        objlogin.username = txtusername.Text;
        objlogin.password = txtpassword.Text;
        DataTable dt = new DataTable();
        dt = objlogin.Chk_AssociateLoginDetails(objlogin);
        if (dt.Rows.Count > 0)
        {
            Session["associateid"] = dt.Rows[0]["associateid"].ToString();
            Session["associatename"] = dt.Rows[0]["username2"].ToString();
            Session["associatemobile"] = dt.Rows[0]["mobile"].ToString();
            Session["associateimage"] = dt.Rows[0]["imagename"].ToString();
            if (Request.QueryString["href"] != null)
            {
                Response.Redirect("../" + Request.QueryString["href"].ToString());
            }
            else
            {
                Response.Redirect("Dashboard.aspx");
            }
        }
        else
        {
            Message.Show("Invalid Login Details...!!!");
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        objuser.UserId = txtuserid.Text;
        string res = objuser.SendPassword(objuser);
        if (res == "0")
        {
            Message.Show("Error Occurred");
        }
        else
            if (res == "f")
            {
                Message.Show("Invalid User Id");
            }
            else
            {
                Message.Show("Password sent to your registered email.");
            }
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        //lblmessage.Text = "sgdsgsd";

        string popupScript2 = "Closepopup();";
        ScriptManager.RegisterStartupScript(uplMaster, uplMaster.GetType(), Guid.NewGuid().ToString(), popupScript2, true);

    }
}