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
    const string ResetRole = "Associate";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ClearForgotSession();
            ShowForgotStep(1);
        }
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

    protected void btnSendOtp_Click(object sender, EventArgs e)
    {
        string userId = (txtuserid.Text ?? "").Trim();
        if (string.IsNullOrEmpty(userId))
        {
            Message.Show("Enter Associate Id");
            KeepForgotModalOpen();
            return;
        }

        objuser.UserId = userId;
        DataTable dt = objuser.GetForgotPasswordContact(objuser, ResetRole);
        if (dt == null || dt.Rows.Count == 0)
        {
            Message.Show("Invalid Associate Id");
            KeepForgotModalOpen();
            return;
        }

        string mobile = Convert.ToString(dt.Rows[0]["Mobile"]);
        if (string.IsNullOrWhiteSpace(mobile) || mobile.Length < 10)
        {
            Message.Show("Registered mobile not found. Contact support.");
            KeepForgotModalOpen();
            return;
        }

        objuser.Mobile = mobile;
        string otp = objuser.SendOTP(objuser);
        if (otp == "0" || string.IsNullOrEmpty(otp))
        {
            Message.Show("Unable to send OTP. Please try again.");
            KeepForgotModalOpen();
            return;
        }

        Session["fp_userid"] = userId;
        Session["fp_otp"] = otp;
        Session["fp_role"] = ResetRole;
        Session["fp_mobile"] = mobile;

        lblMaskedMobile.Text = MaskMobile(mobile);
        ShowForgotStep(2);
        KeepForgotModalOpen();
        Message.Show("OTP sent to your registered mobile.");
    }

    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        if (Session["fp_userid"] == null || Session["fp_otp"] == null)
        {
            Message.Show("Session expired. Please request OTP again.");
            ShowForgotStep(1);
            KeepForgotModalOpen();
            return;
        }

        string enteredOtp = (txtotp.Text ?? "").Trim();
        if (enteredOtp != Convert.ToString(Session["fp_otp"]))
        {
            Message.Show("Invalid OTP");
            KeepForgotModalOpen();
            return;
        }

        string newPass = txtnewpassword.Text ?? "";
        string confirmPass = txtconfirmpassword.Text ?? "";
        if (string.IsNullOrEmpty(newPass))
        {
            Message.Show("Enter New Password");
            KeepForgotModalOpen();
            return;
        }
        if (newPass != confirmPass)
        {
            Message.Show("Passwords do not match");
            KeepForgotModalOpen();
            return;
        }
        if (newPass.Length < 4)
        {
            Message.Show("Password must be at least 4 characters");
            KeepForgotModalOpen();
            return;
        }

        objlogin.username = Convert.ToString(Session["fp_userid"]);
        objlogin.newpassword = newPass;
        int result = objlogin.ResetPasswordByUserId(objlogin, ResetRole);
        if (result == 1)
        {
            ClearForgotSession();
            ShowForgotStep(1);
            txtuserid.Text = "";
            txtotp.Text = "";
            txtnewpassword.Text = "";
            txtconfirmpassword.Text = "";
            ScriptManager.RegisterStartupScript(uplMaster, uplMaster.GetType(), Guid.NewGuid().ToString(), "Closepopup();", true);
            Message.Show("Password reset successful. Please login with your new password.");
        }
        else if (result == 2)
        {
            Message.Show("Associate account not found.");
            KeepForgotModalOpen();
        }
        else
        {
            Message.Show("Error occurred while resetting password.");
            KeepForgotModalOpen();
        }
    }

    protected void btnForgotBack_Click(object sender, EventArgs e)
    {
        ClearForgotSession();
        ShowForgotStep(1);
        KeepForgotModalOpen();
    }

    void ShowForgotStep(int step)
    {
        bool step2 = step == 2;
        pnlForgotStep1.Visible = !step2;
        pnlForgotStep2.Visible = step2;
        btnSendOtp.Visible = !step2;
        btnResetPassword.Visible = step2;
        btnForgotBack.Visible = step2;
        lblStep1.CssClass = step2 ? "" : "is-active";
        lblStep2.CssClass = step2 ? "is-active" : "";
    }

    void KeepForgotModalOpen()
    {
        ScriptManager.RegisterStartupScript(uplMaster, uplMaster.GetType(), Guid.NewGuid().ToString(), "showForgotModal();", true);
    }

    void ClearForgotSession()
    {
        Session.Remove("fp_userid");
        Session.Remove("fp_otp");
        Session.Remove("fp_role");
        Session.Remove("fp_mobile");
    }

    static string MaskMobile(string mobile)
    {
        if (string.IsNullOrEmpty(mobile))
            return "****";
        if (mobile.Length <= 4)
            return new string('*', mobile.Length);
        return new string('*', mobile.Length - 4) + mobile.Substring(mobile.Length - 4);
    }
}
