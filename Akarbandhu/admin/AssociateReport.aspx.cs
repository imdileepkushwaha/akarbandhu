using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserReport : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadcountry();
                loadcountryedit();
                loadBankNameedit();
                loadleveledit();
                
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
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
    void loadBankNameedit()
    {
        DDBANK.Items.Clear();
        DataTable dt = new DataTable();
        dt = objState.getBank();
        DDBANK.DataSource = dt;
        DDBANK.DataTextField = "BankName";
        DDBANK.DataValueField = "BankID";
        DDBANK.DataBind();
        ListItem li = new ListItem("Select Bank Name", "0");
        DDBANK.Items.Insert(0, li);
    }


  
  
    void  loadcountryedit()
    {
        ddcountryedit.Items.Clear();
        DataTable dt = new DataTable();
        dt = objState.getCountry();
        ddcountryedit.DataSource = dt;
        ddcountryedit.DataTextField = "CountryName";
        ddcountryedit.DataValueField = "CountryID";
        ddcountryedit.DataBind();
        ListItem li = new ListItem("Select Country", "0");
        ddcountryedit.Items.Insert(0, li);
    }
    void loadstateedit()
    {
        ddstateedit.Items.Clear();
        DataTable dt = new DataTable();
        objState.CountryId = ddcountryedit.SelectedValue.ToString();
        dt = objState.getState(objState);

        ddstateedit.DataSource = dt;
        ddstateedit.DataTextField = "StateName";
        ddstateedit.DataValueField = "StateID";
        ddstateedit.DataBind();
        ListItem li = new ListItem("Select State", "0");
        ddstateedit.Items.Insert(0, li);
    }

    void loadleveledit()
    {


        ddleveledit.Items.Clear();
       // objUser.UserId = lbluseridedit.Text;
        DataTable dtlevel = new DataTable();
        dtlevel = objUser.getLevelByadmin(objUser);

        ddleveledit.Items.Clear();


        ddleveledit.DataSource = dtlevel;

        ddleveledit.DataTextField = "LevelNo";
        ddleveledit.DataValueField = "LevelNo";

        ddleveledit.DataBind();
        ListItem li = new ListItem("Select Level", "0");
        ddleveledit.Items.Insert(0, li);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lbluserid = (Label)GridView1.Rows[index].FindControl("lbluserid");
            lbluseridedit.Text = lbluserid.Text;
            objUser.UserId = lbluserid.Text;
            DataTable dt = new DataTable();
            dt = objUser.getAssociateDetail(objUser);
            if (dt.Rows.Count > 0)
            {
                txtnameedit.Text = dt.Rows[0]["associatename"].ToString();
                txtmobileedit.Text = dt.Rows[0]["mobile"].ToString();
                txtemailedit.Text = dt.Rows[0]["email"].ToString();
                ddgenderedit.SelectedValue = dt.Rows[0]["gender"].ToString();

                ddleveledit.SelectedValue = dt.Rows[0]["LevelNo"].ToString();
               // txtlevelnameedit.Text = dt.Rows[0]["address"].ToString();
                txtaddressedit.Text = dt.Rows[0]["address"].ToString();
                txtnomineenameedit.Text = dt.Rows[0]["nomineename"].ToString();
                txtagenomineedit.Text = dt.Rows[0]["nomineeage"].ToString();
                TxtNomineerelatioedit.Text = dt.Rows[0]["NomineeRelation"].ToString();
                txtsrpresident.Text = dt.Rows[0]["Srpresidentname"].ToString();
                txtadhar.Text = dt.Rows[0]["Adharnumber"].ToString();
                txtpancard.Text = dt.Rows[0]["PanNumber"].ToString();
                txtteamname.Text = dt.Rows[0]["teamname"].ToString();
                ddcountryedit.SelectedValue = dt.Rows[0]["countryid"].ToString();
                //DDBANK.SelectedValue = dt.Rows[0]["BankName"].ToString();
                txtaccountedit.Text = dt.Rows[0]["AccountNo"].ToString();
                txtIFSCEdit.Text = dt.Rows[0]["IFSCCode"].ToString();


                loadstateedit();
                ddstateedit.SelectedValue = dt.Rows[0]["stateid"].ToString();

                txtcitynamedit.Text = dt.Rows[0]["cityname"].ToString();

                txtareaname.Text = dt.Rows[0]["areaname"].ToString();
                txtpincodeedit.Text = dt.Rows[0]["pincode"].ToString();
                txtdateofbirthedit.Text = Convert.ToDateTime(dt.Rows[0]["dateofbirth"].ToString()).ToString("dd/MM/yyyy");
                lblimagename.Text = dt.Rows[0]["imagename2"].ToString();
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
    }
    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstate();
    }
  
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    void loaduser()
    {
        objUser.UserName = txtname.Text;
        objUser.Mobile = txtmobile.Text;
        objUser.Email = txtemail.Text;
        objUser.CityName = txtcityname.Text;
        objUser.AreaName = ddarea.SelectedValue.ToString();
        if (txtfromdate.Text != "")
        {
            objUser.FromDate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objUser.FromDate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objUser.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objUser.ToDate = DateTime.MinValue;
        }
        objUser.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = objUser.getAssociateReport(objUser);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void ddcountryedit_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstateedit();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string str_image = lblimagename.Text;
        if (FileUpload1.HasFiles)
        {
            str_image = Guid.NewGuid().ToString().Substring(0, 6) + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath("userimage/") + str_image);
        }
        objUser.UserName = txtnameedit.Text;
        objUser.Mobile = txtmobileedit.Text;
        objUser.Email = txtemailedit.Text;
        objUser.BankAccountId = DDBANK.SelectedValue.ToString();
        objUser.IFSCCode = txtIFSCEdit.Text;
        objUser.AccNo = txtaccountedit.Text;
        objUser.NomineeName = txtnomineenameedit.Text;
        objUser.PanCardNo = txtpancard.Text;
        objUser.AdharNo = txtadhar.Text;
        objUser.Teamname = txtteamname.Text;
        objUser.SrPresident = txtsrpresident.Text;
        objUser.NomineeRelation = TxtNomineerelatioedit.Text;
        objUser.NomineeAge = txtagenomineedit.Text;
        objUser.Gender = ddgenderedit.SelectedValue.ToString();
        objUser.Address = txtaddressedit.Text;
        objUser.LevelNo = ddleveledit.SelectedValue.ToString();
        objUser.CityName = txtcitynamedit.Text;
        objUser.CountryId = ddcountryedit.SelectedValue.ToString();
        objUser.StateId = ddstateedit.SelectedValue.ToString();
        objUser.AreaName = txtareaname.Text;
        objUser.Pincode = txtpincodeedit.Text;
        objUser.DateOfBirth = Message.GetIndianDate(txtdateofbirthedit.Text);
        objUser.ImageName = str_image;
        objUser.UserId = lbluseridedit.Text;
        objUser.StateId = ddstateedit.SelectedValue.ToString();
        string res = objUser.Update_AssociateProfile(objUser);
        if (res == "t")
        {
            loaduser();
            string popupScript = "toastr.success('Success', 'Associate Edited Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            string popupScript2 = "Closepopup();";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
        }
        else
        {
            string popupScript = "toastr.error('Success', 'unknown error occurred');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    Label lblactivestatus = (Label)e.Row.FindControl("lblactivestatus");
        //    if (lblactivestatus.Text == "Active")
        //    {
        //        lblactivestatus.CssClass = "label label-success";
        //    }
        //    else
        //        if (lblactivestatus.Text == "Deactive")
        //        {
        //            lblactivestatus.CssClass = "label label-danger";
        //        }
        //}
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        loaduser();
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=associategreport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (System.IO.StringWriter sw = new System.IO.StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            //To Export all pages
            GridView1.AllowPaging = false;
            loaduser();

            GridView1.HeaderRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = System.Drawing.Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }
            GridView1.RenderControl(hw);
            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }

   
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
}