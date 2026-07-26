using System;
using System.Web;

/// <summary>
/// Builds QR image URLs for coupon / voucher genuineness.
/// </summary>
public static class QRHelper
{
    public static string GetQrImageUrl(string data, int size = 160)
    {
        if (string.IsNullOrEmpty(data))
            data = "AKAR BANDHU PVT LTD";
        string encoded = HttpUtility.UrlEncode(data);
        return "https://api.qrserver.com/v1/create-qr-code/?size=" + size + "x" + size + "&data=" + encoded;
    }

    public static string GetSiteRootUrl()
    {
        HttpRequest req = HttpContext.Current.Request;
        string app = req.ApplicationPath;
        if (app == "/")
            app = "";
        return req.Url.Scheme + "://" + req.Url.Authority + app;
    }
}
