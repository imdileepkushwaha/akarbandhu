using System;
using System.Web.UI;

public partial class index : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindHomepagePopup();
    }

    void BindHomepagePopup()
    {
        var popup = WebsitePopupStore.GetActiveForDisplay();
        if (popup == null)
        {
            pnlSitePopup.Visible = false;
            return;
        }

        pnlSitePopup.Visible = true;
        pnlSitePopup.CssClass = "ab-site-popup";
        abSitePopupBody.Attributes["class"] = "ab-site-popup-body";

        litPopupTitle.Text = Server.HtmlEncode(popup.Title ?? "");
        litPopupContent.Text = Server.HtmlEncode(popup.Content ?? "")
            .Replace("\r\n", "<br />")
            .Replace("\n", "<br />");

        pnlPopupMedia.Visible = false;
        lnkPopupImage.Visible = false;
        imgPopupPlain.Visible = false;
        imgPopup.Visible = false;

        if (popup.IsImagePopup && popup.HasImage)
        {
            pnlPopupMedia.Visible = true;
            abSitePopupBody.Attributes["class"] = "ab-site-popup-body ab-site-popup-body--image-only";

            string url = popup.ImageUrl;
            if (!string.IsNullOrWhiteSpace(popup.LinkUrl) && popup.LinkUrl != "#")
            {
                lnkPopupImage.Visible = true;
                lnkPopupImage.NavigateUrl = popup.LinkUrl;
                imgPopup.Visible = true;
                imgPopup.ImageUrl = url;
                imgPopup.AlternateText = popup.Title ?? "Announcement";
            }
            else
            {
                imgPopupPlain.Visible = true;
                imgPopupPlain.ImageUrl = url;
                imgPopupPlain.AlternateText = popup.Title ?? "Announcement";
            }
        }
        else
        {
            pnlSitePopup.CssClass = "ab-site-popup ab-site-popup--no-image";
        }
    }

    protected void btnContact_Click(object sender, EventArgs e)
    {
        // Contact form placeholder — wire to email/DB later
    }
}
