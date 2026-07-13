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
using System.IO;

public partial class admin_EPinAdd : System.Web.UI.Page
{

    clsUser objUser = new clsUser();
    clsAccount objaccount = new clsAccount();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["associateid"] != null)
        {
            if (!IsPostBack)
            {
               
                loadkycdetail();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    //void loadbalance()
    //{
    //    objaccount.UserId = Session["userid"].ToString();
    //    DataTable dt = new DataTable();
    //    dt = objaccount.getUserWalletBalance(objaccount);
    //    if (dt.Rows.Count > 0)
    //    {
    //        lbluserbalance.Text = dt.Rows[0][0].ToString();
    //    }
    //    else
    //    {
    //        lbluserbalance.Text = "0.00";
    //    }
    //}

    void loadkycdetail()
    {
        DataTable dt = new DataTable();
        objUser.UserId = Session["associateid"].ToString();
        dt = objUser.getAssociateKYCDetails(objUser);
        if (dt.Rows.Count > 0)
        {
            txtpancardno.Text = dt.Rows[0]["pancardno"].ToString();
            txtaadharcardno.Text = dt.Rows[0]["aadharcardno"].ToString();
            txtaddressproof.Text = dt.Rows[0]["bankproofno"].ToString();

            lblpancardstatus.Text = dt.Rows[0]["pancardstatus"].ToString();
            lblaadharstatus.Text = dt.Rows[0]["aadharcardstatus"].ToString();
            lbladdressstatus.Text = dt.Rows[0]["bankproofstatus"].ToString();

            ltpancardimage.Text = @"<img src=""../admin/userimage/" + dt.Rows[0]["PanCardImageName"].ToString() + @"""  style='height:150px;' />";
            ltaadharimage.Text = @"<img src=""../admin/userimage/" + dt.Rows[0]["AadharCardImageName"].ToString() + @"""  style='height:150px;' />";
            ltaadharimageback.Text = @"<img src=""../admin/userimage/" + dt.Rows[0]["AadharCardImageNameBack"].ToString() + @"""  style='height:150px;' />";
            ltaddressimage.Text = @"<img src=""../admin/userimage/" + dt.Rows[0]["bankProofImageName"].ToString() + @"""  style='height:150px;' />";

            lblpancardimage.Text = dt.Rows[0]["PanCardImageName"].ToString();
            lblaadharimage.Text = dt.Rows[0]["AadharCardImageName"].ToString();
            lblaadharimageback.Text = dt.Rows[0]["AadharCardImageNameBack"].ToString();
            lbladdressimage.Text = dt.Rows[0]["bankProofImageName"].ToString();
            lblbankproofremark.Text = dt.Rows[0]["bankproofremark"].ToString();

            if (lblpancardstatus.Text == "Pending")
            {
                lblpancardstatus.CssClass = "label label-info";
            }
            else
                if (lblpancardstatus.Text == "Approved")
            {
                lblpancardstatus.CssClass = "label label-success";
                FileUploadPan.Enabled = false;
            }
            else
                    if (lblpancardstatus.Text == "Rejected")
            {
                lblpancardstatus.CssClass = "label label-danger";
            }

            if (lblaadharstatus.Text == "Pending")
            {
                lblaadharstatus.CssClass = "label label-info";
            }
            else
                if (lblaadharstatus.Text == "Approved")
            {
                lblaadharstatus.CssClass = "label label-success";
                FileUploadaadhar.Enabled = false;
            }
            else
                    if (lblaadharstatus.Text == "Rejected")
            {
                lblaadharstatus.CssClass = "label label-danger";
            }
            if (lbladdressstatus.Text == "Pending")
            {
                lbladdressstatus.CssClass = "label label-info";
            }
            else
                if (lbladdressstatus.Text == "Approved")
            {
                lbladdressstatus.CssClass = "label label-success";
                FileUploadaddress.Enabled = false;
            }
            else
                    if (lbladdressstatus.Text == "Rejected")
            {
                lbladdressstatus.CssClass = "label label-danger";
            }

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {



        string str_pancardstatus = lblpancardstatus.Text, str_aadharstatus = lblaadharstatus.Text, str_aadharstatusback = lblaadharstatusback.Text, str_addressproofstatus = lbladdressstatus.Text;
            if (str_pancardstatus == "")
            {
                str_pancardstatus = "Pending";
            }
            if (str_aadharstatus == "")
            {
                str_aadharstatus = "Pending";
            }
            if (str_addressproofstatus == "")
            {
                str_addressproofstatus = "Pending";
            }

            string str_imagepan = lblpancardimage.Text;
            if (FileUploadPan.HasFile)
            {
                Stream fs = FileUploadPan.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                byte[] bytes = br.ReadBytes((Int32)fs.Length);

                if ((MimeType.GetMimeType(bytes, FileUploadPan.FileName)) == "image/png" || (MimeType.GetMimeType(bytes, FileUploadPan.FileName)) == "image/jpeg")
                {

                    str_imagepan = Guid.NewGuid().ToString().Substring(0, 6) + FileUploadPan.FileName;
                    FileUploadPan.SaveAs(Server.MapPath("../admin/userimage/") + str_imagepan);
                    str_pancardstatus = "Pending";
                }
                else
                {
                    Message.Show("Invalid Pan Image");
                }
            }
            if (str_imagepan == "")
            {
                str_imagepan = "default.png";
            }
            string str_imageaadhar = lblaadharimage.Text;
            if (FileUploadaadhar.HasFile)
            {
                Stream fs2 = FileUploadaadhar.PostedFile.InputStream;
                BinaryReader br2 = new BinaryReader(fs2);
                byte[] bytes2 = br2.ReadBytes((Int32)fs2.Length);

                if ((MimeType.GetMimeType(bytes2, FileUploadaadhar.FileName)) == "image/png" || (MimeType.GetMimeType(bytes2, FileUploadaadhar.FileName)) == "image/jpeg")
                {

                    str_imageaadhar = Guid.NewGuid().ToString().Substring(0, 6) + FileUploadaadhar.FileName;
                    FileUploadaadhar.SaveAs(Server.MapPath("../admin/userimage/") + str_imageaadhar);
                    str_aadharstatus = "Pending";
                }
                else
                {
                    Message.Show("Invalid Aadhar Image");
                }
            }
            if (str_imageaadhar == "")
            {
                str_imageaadhar = "default.png";
            }
            string str_imageaadharback = lblaadharimageback.Text;
            if (FileUploadaadharback.HasFile)
            {
                Stream fs2 = FileUploadaadharback.PostedFile.InputStream;
                BinaryReader br2 = new BinaryReader(fs2);
                byte[] bytes2 = br2.ReadBytes((Int32)fs2.Length);

                if ((MimeType.GetMimeType(bytes2, FileUploadaadharback.FileName)) == "image/png" || (MimeType.GetMimeType(bytes2, FileUploadaadharback.FileName)) == "image/jpeg")
                {

                    str_imageaadharback = Guid.NewGuid().ToString().Substring(0, 6) + FileUploadaadharback.FileName;
                    FileUploadaadharback.SaveAs(Server.MapPath("../admin/userimage/") + str_imageaadharback);
                    str_aadharstatus = "Pending";
                }
                else
                {
                    Message.Show("Invalid Aadhar Back Image");
                }
            }

            if (str_imageaadharback == "")
            {
                str_imageaadharback = "default.png";
            }
            string str_imageaddress = lbladdressimage.Text;
            if (FileUploadaddress.HasFile)
            {

            Stream fs3 = FileUploadaddress.PostedFile.InputStream;
            BinaryReader br3 = new BinaryReader(fs3);
            byte[] bytes3 = br3.ReadBytes((Int32)fs3.Length);

            if ((MimeType.GetMimeType(bytes3, FileUploadaddress.FileName)) == "image/png" || (MimeType.GetMimeType(bytes3, FileUploadaddress.FileName)) == "image/jpeg")
            {

                str_imageaddress = Guid.NewGuid().ToString().Substring(0, 6) + FileUploadaddress.FileName;
                FileUploadaddress.SaveAs(Server.MapPath("../admin/userimage/") + str_imageaddress);
                str_addressproofstatus = "Pending";
            }
            else
            {
                Message.Show("Invalid Bank Proof Image");
            }
            }
            if (str_imageaddress == "")
            {
                str_imageaddress = "default.png";
            }

            objUser.PanCardNo = txtpancardno.Text;
            objUser.PanCardImage = str_imagepan;
            objUser.PanCardStatus = str_pancardstatus;
            objUser.AadharCardImage2 = str_imageaadharback;
            objUser.AadharCardNo = txtaadharcardno.Text;
            objUser.AadharCardImage = str_imageaadhar;
            objUser.AadharCardStatus = str_aadharstatus;

            objUser.BankProofName = txtaddressproof.Text;
            objUser.BankProofImage = str_imageaddress;
            objUser.BankProofStatus = str_addressproofstatus;
            objUser.UserId = Session["associateid"].ToString();
            objUser.MentionBy = Session["associateid"].ToString();
            string res = objUser.InsertAssociateKYCDetail(objUser);
            if (res == "t")
            {
                string popupScript = "toastr.success('Success', 'KYC Details Updated Successfully');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                loadkycdetail();

            }
            else if (res == "f")
            {
                string popupScript = "toastr.error('Error', 'Pancard no already exists');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
            else
            {
                string popupScript = "toastr.error('Error', 'Unknown error occurred');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }
        protected void btnCancel_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }