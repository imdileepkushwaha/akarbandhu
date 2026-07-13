using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;
using ARA_StringHunt;
using System.Net;


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
    void loadpercent()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtsponserid.Text;
        objUser.CountryId = ddlevel.SelectedValue.ToString();
        dt = objUser.getIncome(objUser);
        if (dt.Rows.Count > 0)
        {
            txtIncome.Text = dt.Rows[0]["Levelname"].ToString();
        }
    }

    public string smssending(string number, string username, string userid, string password)
    {
        string txtnumber = "91"+number;
        string txtmessage = "Dear " + username + ",Thank you for choosing  Real Vision Properties . Please use the following data to login. Your User id :- " + userid + " and Your password :- " + password + ". For login please visit 'https://ALKIZEN ENGICON PVT. LTD.co.in/user/index.aspx'";
        //txtmessage = txtmessage.Replace("#", "%23").Replace(":", "%3A").Replace(",", "%2C").Replace(" ", "%20");

        string strurl = "https://chatway.in/api/send-msg?username=contact@ALKIZEN ENGICON PVT. LTD.co.in&number=" + txtnumber + "&message=" + txtmessage + "&token=MXVsSnNpYmVDWXJ5WmVaMjEzOGZqUT09";
        //string strurl = "http://chatway.in/api/send-file?username=SG686869&number=" + txtnumber + "&message=" + txtmessage + "&token=TDlua0RhVlZQOFhMTGlOSFU3bG5GQT09&file_url=&file_name=";

        string result = apicall(strurl);

        return result;
    }


    public string apicall(string url)
    {
        HttpWebRequest httpreq = (HttpWebRequest)WebRequest.Create(url);
        try
        {
            HttpWebResponse httpres = (HttpWebResponse)httpreq.GetResponse();
            StreamReader sr = new StreamReader(httpres.GetResponseStream());
            string results = sr.ReadToEnd();
            sr.Close();
            return results;
        }
        catch
        {
            return "0";
        }
    }



    private static int CalculateAge(DateTime dateOfBirth)
    {
        int age = 0;
        age = DateTime.Now.Year - dateOfBirth.Year;
        if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
            age = age - 1;

        return age;
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
        objUser.NomineeAge= txtnomineenameAge.Text;
        objUser.Gender = ddgender.SelectedValue.ToString();
        objUser.Address = txtaddress.Text;
        //  objUser.CityName = txtcityname.Text;
        objUser.CountryId = ddcountry.SelectedValue.ToString();
        objUser.StateId = ddstate.SelectedValue.ToString();
        objUser.AreaName = txtareaname.Text;
        objUser.Teamname = txtteamname.Text;
        objUser.SrPresident = txtsrpresident.Text;
        // objUser.Pincode = txtpincode.Text;
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
        //objUser.EpinNo = "0";
        objUser.PanCardNo = txtpanno.Text;
        objUser.AdharNo = txtadhar.Text;
        //objUser.StandingPosition = rbstandingposition.SelectedValue.ToString();
        //objUser.PlanId ="0";
        objUser.LandMark = txtlandmark.Text;
        objUser.LevelNo = ddlevel.SelectedValue.ToString();
        string res = objUser.Insert_Associate(objUser);
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
        else if (res == "e")
        {
            string popupScript = "toastr.error('Error', 'Associate id already exists');";
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
            string popupScript = "toastr.success('Success', 'Associate Added Successfully, Associate is " + res + "');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);

            string username = txtname.Text;
            string userid = res;
            string password = txtuserpassword.Text;
            string useremail = txtemail.Text;
            string number = txtmobile.Text;


            smssending(number, username, userid, password);
            txtlandmark.Text = txtname.Text = txtmobile.Text = txtemail.Text = txtdateofbirth.Text =  txtaddress.Text = txtuserpassword.Text = txtconfirmpassword.Text = txtpanno.Text = "";
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

            DataTable dtlevel = new DataTable();
            dtlevel = objUser.getLevelBySponser(objUser);
            ddlevel.Items.Clear();


            ddlevel.DataSource = dtlevel;
            ddlevel.DataTextField = "levelno";
            ddlevel.DataValueField = "levelno";
            ddlevel.DataBind();
            ListItem li = new ListItem("Select Level", "0");
            ddlevel.Items.Insert(0, li);

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
    protected void ddlevel_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadpercent();
      
    }

    
   
}