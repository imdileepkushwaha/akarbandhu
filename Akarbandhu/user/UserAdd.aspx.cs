using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserAdd : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    clsEPin objepin = new clsEPin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                //loadplan();
                loadcountry();
                txtsponserid.Text = Session["userid"].ToString();
                loadsusername();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    //void loadplan()
    //{
    //    ddplan.Items.Clear();
    //    DataTable dt = new DataTable();
    //    dt = objepin.getPlan();
    //    ddplan.DataSource = dt;
    //    ddplan.DataTextField = "planname2";
    //    ddplan.DataValueField = "planid";
    //    ddplan.DataBind();
    //    ListItem li = new ListItem("Select Plan", "0");
    //    ddplan.Items.Insert(0, li);
    //}
    //void loadepin()
    //{
    //    objepin.GenerateUserId = txtsponserid.Text;
    //    objepin.PlanId = ddplan.SelectedValue.ToString();
    //    ddepin.Items.Clear();
    //    DataTable dt = new DataTable();
    //    dt = objepin.getEPinForReg(objepin);
    //    ddepin.DataSource = dt;
    //    ddepin.DataTextField = "epinno";
    //    ddepin.DataValueField = "amount";
    //    ddepin.DataBind();
    //    ListItem li = new ListItem("Select Epin", "0");
    //    ddepin.Items.Insert(0, li);
    //}
    void loadcountry()
    {
        ddcountry.Items.Clear();
        DataTable dt = new DataTable();
        dt = objState.getCountry();
        ddcountry.DataSource = dt;
        ddcountry.DataTextField = "CountryName";
        ddcountry.DataValueField = "CountryID";
        ddcountry.DataBind();
        ListItem li = new ListItem("Select Country", "0");
        ddcountry.Items.Insert(0, li);
    }
    void loadstate()
    {
        ddstate.Items.Clear();
        DataTable dt = new DataTable();
        objState.CountryId = ddcountry.SelectedValue.ToString();
        dt = objState.getState(objState);

        ddstate.DataSource = dt;
        ddstate.DataTextField = "StateName";
        ddstate.DataValueField = "StateID";
        ddstate.DataBind();
        ListItem li = new ListItem("Select State", "0");
        ddstate.Items.Insert(0, li);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        string str_image = "default.png";
        if (FileUpload1.HasFile)
        {
            str_image = Guid.NewGuid().ToString().Substring(0, 6) + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath("../admin/userimage/") + str_image);
        }
        objUser.UserName = txtname.Text;
        objUser.Mobile = txtmobile.Text;
        objUser.Email = txtemail.Text;
        objUser.Gender = ddgender.SelectedValue.ToString();
        objUser.Address = txtaddress.Text;
        objUser.CityName = txtcityname.Text;
        objUser.CountryId = ddcountry.SelectedValue.ToString();
        objUser.StateId = ddstate.SelectedValue.ToString();
        objUser.AreaName = txtareaname.Text;
        objUser.Pincode = txtpincode.Text;
        objUser.DateOfBirth = Message.GetIndianDate(txtdateofbirth.Text);
        objUser.Password = txtuserpassword.Text;
        objUser.MentionBy = Session["userid"].ToString();
        objUser.SponserId = txtsponserid.Text;
        objUser.Regtype = "Panel";
        objUser.ImageName = str_image;
        objUser.StateId = ddstate.SelectedValue.ToString();
        //objUser.EpinNo = "0";
        objUser.PanCardNo = txtpanno.Text;
        objUser.StandingPosition = rbstandingposition.SelectedValue.ToString();
        //objUser.PlanId ="0";
        objUser.LandMark = txtlandmark.Text;
        string res = objUser.Insert_User(objUser);
        if (res == "f")
        {
            string popupScript = "toastr.error('Error', 'Mobile No Already Exists');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
        else if (res == "e")
        {
            string popupScript = "toastr.error('Error', 'Email Already Exists');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
        else
            if (res == "0")
            {
                string popupScript = "toastr.error('Error', 'Unknow error occurred');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
            else
            {
                string popupScript = "toastr.success('Success', 'User Added Successfully, UserId is " + res + "');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
              txtlandmark.Text=  txtname.Text = txtmobile.Text = txtemail.Text = txtdateofbirth.Text = txtaddress.Text = txtcityname.Text = txtuserpassword.Text = txtconfirmpassword.Text = txtpincode.Text = txtareaname.Text = txtpanno.Text = "";
                ddcountry.SelectedValue = "0";
                ddgender.SelectedValue = "0";
                loadstate();
                //loadepin();

            }
    }

    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstate();
    }
    void loadsusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtsponserid.Text;
        dt = objUser.getUserNameDownline(objUser);
        if (dt.Rows.Count > 0)
        {
            txtsponsername.Text = dt.Rows[0]["username"].ToString();
        }
        else
        {
            txtsponsername.Text = "";
            txtsponserid.Text = "";
            string popupScript = "toastr.error('Error', 'Invalid User Id');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
        //loadepin();
    }
    protected void txtsponserid_TextChanged(object sender, EventArgs e)
    {
        loadsusername();
    }
    //protected void ddepin_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    txtamount.Text = ddepin.SelectedValue.ToString();
    //}

    //protected void ddplan_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    loadepin();
    //}
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
       
    }
    //protected void ddplan_SelectedIndexChanged1(object sender, EventArgs e)
    //{
    //    loadepin();
    //}
}