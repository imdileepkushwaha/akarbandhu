using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
            if (Session["useradmin"] != null)
            {
                loadcountry();
                //loadplan();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    //protected void ddplan_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    loadepin();
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

        //if (ddepin.SelectedValue != "0")
        //{
            string str_image = "default.png";
            if (FileUpload1.HasFile)
            {
                str_image = Guid.NewGuid().ToString().Substring(0, 6) + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("userimage/") + str_image);
            }
            objUser.UserName = txtname.Text;
            objUser.Mobile = txtmobile.Text;
            objUser.Email = txtemail.Text;
            objUser.Gender = ddgender.SelectedValue.ToString();
            objUser.Address = txtaddress.Text;
            objUser.CityName = txtcityname.Text;
            objUser.CountryId = ddcountry.SelectedValue.ToString();
            objUser.StateId = ddstate.SelectedValue.ToString();
            objUser.AreaName = "";
            objUser.PanCardNo = txtpanno.Text;
            objUser.AdharNo = txtadhar.Text;
            objUser.Pincode = txtpincode.Text;
            objUser.DateOfBirth = Message.GetIndianDate(txtdateofbirth.Text);
            objUser.Password = txtuserpassword.Text;
            objUser.MentionBy = Session["useradmin"].ToString();
            objUser.SponserId = txtsponserid.Text;
            objUser.Regtype = "Panel";
            objUser.ImageName = str_image;
        objUser.FatherName = txtfathername.Text;
        objUser.NomineeName = txtnomineename.Text;
        objUser.NomineeRelation = txtnomineerelation.Text;
        objUser.StateId = ddstate.SelectedValue.ToString();
          
            //objUser.StandingPosition = rbstandingposition.SelectedValue.ToString();
            objUser.LandMark = txtlandmark.Text;
            string res = objUser.Insert_User(objUser);
            if (res == "f")
            {
                string popupScript = "toastr.error('Error', 'Mobile No Already Exists');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
            else if (res == "e")
            {
                string popupScript = "toastr.error('Error', 'Invalid E-Pin');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
            else if (res == "ax")
            {
                string popupScript = "toastr.error('Error', 'Adhar Number Already Exists');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
            else if (res == "e")
            {
                string popupScript = "toastr.error('Error', 'Customer id already exists');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
            else if (res == "s")
            {
                string popupScript = "toastr.error('Error', 'Select Standing Position');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
            else
                if (res == "0")
                {
                    string popupScript = "toastr.error('Error', 'Unknown error occurred');";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                }
                else
                {
                    string popupScript = "toastr.success('Success', 'Customer Added Successfully, Customer is " + res + "');";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                txtlandmark.Text=    txtname.Text = txtmobile.Text = txtemail.Text = txtdateofbirth.Text = txtcityname.Text = txtaddress.Text = txtuserpassword.Text = txtconfirmpassword.Text = txtpincode.Text = txtpanno.Text = "";
                    ddcountry.SelectedValue = "0";
                    ddgender.SelectedValue = "0";
                    loadstate();
                    //loadepin();
                }
        //}
        //else
        //{
        //    string popupScript = "toastr.error('Error', 'Select E-Pin');";
        //    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        //}
    }

    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstate();
    }
  

    void loadsusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtsponserid.Text;
        dt = objUser.getAssociateName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtsponsername.Text = dt.Rows[0]["associatename"].ToString();

        }
        else
        {
            txtsponsername.Text = "";
            txtsponserid.Text = "";
            string popupScript = "toastr.error('Error', 'Invalid Associate Id');";
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
}