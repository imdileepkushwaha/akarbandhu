using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_PopupManagement : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
        {
            SetPopupType("content");
            BindGrid();
        }
    }

    protected string Truncate(object value)
    {
        string text = value == null ? "" : value.ToString();
        if (text.Length <= 80) return text;
        return text.Substring(0, 77) + "...";
    }

    protected string DetailPreview(object dataItem)
    {
        var item = dataItem as WebsitePopupItem;
        if (item == null) return "";
        if (item.IsImagePopup)
            return string.IsNullOrWhiteSpace(item.LinkUrl) ? "Image popup" : ("Link: " + Truncate(item.LinkUrl));
        return Truncate(item.Content);
    }

    void BindGrid()
    {
        GridView1.DataSource = WebsitePopupStore.GetAll();
        GridView1.DataBind();
    }

    void SetPopupType(string type)
    {
        bool isImage = string.Equals(type, "image", StringComparison.OrdinalIgnoreCase);
        hfPopupType.Value = isImage ? "image" : "content";
        pnlContentFields.Visible = !isImage;
        pnlImageFields.Visible = isImage;

        btnTypeContent.CssClass = isImage ? "ab-popup-type-card" : "ab-popup-type-card is-active";
        btnTypeImage.CssClass = isImage ? "ab-popup-type-card is-active" : "ab-popup-type-card";

        ltTitleLabel.Text = isImage ? "Title (optional)" : "Title";
        txtTitle.Attributes["placeholder"] = isImage ? "Optional title / alt text" : "Popup title";

        if (string.IsNullOrWhiteSpace(hfPopupId.Value))
            ltFormTitle.Text = isImage ? "Add Image Popup" : "Add Content Popup";
        else
            ltFormTitle.Text = isImage ? "Edit Image Popup" : "Edit Content Popup";
    }

    void ClearForm()
    {
        hfPopupId.Value = "";
        hfImagePath.Value = "";
        txtTitle.Text = "";
        txtContent.Text = "";
        txtLinkUrl.Text = "";
        ddlStatus.SelectedValue = "1";
        imgPreview.Visible = false;
        imgPreview.ImageUrl = "";
        lblNoImage.Visible = true;
        btnClearImage.Visible = false;
        btnSubmit.Text = "Save Popup";
        SetPopupType("content");
    }

    void ShowImagePreview(string virtualPath)
    {
        if (!string.IsNullOrWhiteSpace(virtualPath))
        {
            try
            {
                imgPreview.ImageUrl = ResolveUrl(virtualPath);
            }
            catch
            {
                imgPreview.ImageUrl = virtualPath;
            }
            imgPreview.Visible = true;
            lblNoImage.Visible = false;
            btnClearImage.Visible = true;
        }
        else
        {
            imgPreview.Visible = false;
            imgPreview.ImageUrl = "";
            lblNoImage.Visible = true;
            btnClearImage.Visible = false;
        }
    }

    protected void btnTypeContent_Click(object sender, EventArgs e)
    {
        SetPopupType("content");
    }

    protected void btnTypeImage_Click(object sender, EventArgs e)
    {
        SetPopupType("image");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string type = string.Equals(hfPopupType.Value, "image", StringComparison.OrdinalIgnoreCase) ? "image" : "content";
        string title = (txtTitle.Text ?? "").Trim();
        string content = (txtContent.Text ?? "").Trim();
        string link = (txtLinkUrl.Text ?? "").Trim();
        string imagePath = hfImagePath.Value ?? "";
        bool isActive = ddlStatus.SelectedValue == "1";

        if (type == "content")
        {
            if (string.IsNullOrWhiteSpace(title))
            {
                Toast("toastr.warning('Warning', 'Enter popup title');");
                return;
            }
            if (string.IsNullOrWhiteSpace(content))
            {
                Toast("toastr.warning('Warning', 'Enter popup content');");
                return;
            }
            imagePath = "";
            link = "";
        }
        else
        {
            // Image popup — title optional
            content = "";
            if (fuImage.HasFile)
            {
                if (fuImage.PostedFile.ContentLength > 5 * 1024 * 1024)
                {
                    Toast("toastr.error('Error', 'Image must be 5 MB or less.');");
                    return;
                }

                string ext = Path.GetExtension(fuImage.FileName).ToLowerInvariant();
                if (ext != ".png" && ext != ".jpg" && ext != ".jpeg" && ext != ".webp" && ext != ".gif")
                {
                    Toast("toastr.error('Error', 'Please upload PNG, JPG, WEBP or GIF.');");
                    return;
                }

                string folder = Server.MapPath("~/assets/uploads/popups/");
                if (!Directory.Exists(folder))
                    Directory.CreateDirectory(folder);

                string fileName = "popup-" + DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + Guid.NewGuid().ToString("N").Substring(0, 6) + ext;
                fuImage.SaveAs(Path.Combine(folder, fileName));
                imagePath = "~/assets/uploads/popups/" + fileName;
                hfImagePath.Value = imagePath;
            }

            if (string.IsNullOrWhiteSpace(imagePath))
            {
                Toast("toastr.warning('Warning', 'Upload a popup image');");
                return;
            }
        }

        try
        {
            var item = new WebsitePopupItem
            {
                Id = hfPopupId.Value,
                PopupType = type,
                Title = title,
                Content = content,
                ImagePath = imagePath,
                LinkUrl = link,
                IsActive = isActive,
                MentionBy = Session["useradmin"].ToString()
            };

            WebsitePopupStore.Save(item);
            ClearForm();
            BindGrid();
            Toast("toastr.success('Success', 'Popup saved successfully');");
        }
        catch (Exception)
        {
            Toast("toastr.error('Error', 'Unable to save popup');");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void btnClearImage_Click(object sender, EventArgs e)
    {
        hfImagePath.Value = "";
        ShowImagePreview(null);
        SetPopupType("image");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        if (!int.TryParse(Convert.ToString(e.CommandArgument), out index))
            return;
        if (index < 0 || index >= GridView1.Rows.Count)
            return;

        Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
        if (lblid == null || string.IsNullOrWhiteSpace(lblid.Text))
            return;

        if (e.CommandName == "edt")
        {
            var item = WebsitePopupStore.GetById(lblid.Text);
            if (item == null) return;

            hfPopupId.Value = item.Id;
            hfImagePath.Value = item.ImagePath ?? "";
            txtTitle.Text = item.Title;
            txtContent.Text = item.Content;
            txtLinkUrl.Text = item.LinkUrl;
            ddlStatus.SelectedValue = item.IsActive ? "1" : "0";
            SetPopupType(item.NormalizedType);
            ShowImagePreview(item.IsImagePopup ? item.ImagePath : null);
            btnSubmit.Text = "Update Popup";
        }
        else if (e.CommandName == "mydel")
        {
            WebsitePopupStore.Delete(lblid.Text);
            ClearForm();
            BindGrid();
            Toast("toastr.success('Success', 'Popup deleted');");
        }
        else if (e.CommandName == "togglestatus")
        {
            Label lblactive = (Label)GridView1.Rows[index].FindControl("lblactive");
            bool currentlyActive = lblactive != null && string.Equals(lblactive.Text, "True", StringComparison.OrdinalIgnoreCase);
            WebsitePopupStore.SetActive(lblid.Text, !currentlyActive);
            BindGrid();
            Toast(currentlyActive
                ? "toastr.success('Success', 'Popup deactivated');"
                : "toastr.success('Success', 'Popup activated');");
        }
    }

    void Toast(string script)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), script, true);
    }
}
