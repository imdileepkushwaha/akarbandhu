using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Caching;
using System.Web.Script.Serialization;

/// <summary>
/// Public website settings (site + contact) stored in App_Data/website-settings.json
/// </summary>
[Serializable]
public class WebsiteConfig
{
    public string BrandName { get; set; }
    public string CompanyName { get; set; }
    public string Tagline { get; set; }
    public string SiteTitle { get; set; }
    public string MetaDescription { get; set; }
    public string LogoPath { get; set; }
    public string FooterMission { get; set; }
    public string OfficeHours { get; set; }
    public string Cin { get; set; }
    public string Pan { get; set; }
    public string Tan { get; set; }
    public string FacebookUrl { get; set; }
    public string InstagramUrl { get; set; }
    public string TwitterUrl { get; set; }
    public string YoutubeUrl { get; set; }

    public string Email { get; set; }
    public string Mobile { get; set; }
    public string WhatsApp { get; set; }
    public string Address { get; set; }

    const string CacheKey = "WebsiteConfig.v1";
    const string FileName = "website-settings.json";

    public string MobileHref
    {
        get { return "tel:" + DigitsOnly(Mobile); }
    }

    public string EmailHref
    {
        get { return "mailto:" + (Email ?? "").Trim(); }
    }

    public string WhatsAppHref
    {
        get
        {
            string digits = DigitsOnly(WhatsApp);
            if (string.IsNullOrEmpty(digits)) return "#";
            if (!digits.StartsWith("91") && digits.Length == 10)
                digits = "91" + digits;
            return "https://wa.me/" + digits;
        }
    }

    public string LogoUrl
    {
        get
        {
            if (string.IsNullOrWhiteSpace(LogoPath)) return "";
            try
            {
                return VirtualPathUtility.ToAbsolute(LogoPath);
            }
            catch
            {
                return LogoPath;
            }
        }
    }

    public bool HasLogo
    {
        get { return !string.IsNullOrWhiteSpace(LogoPath); }
    }

    public static WebsiteConfig Defaults()
    {
        return new WebsiteConfig
        {
            BrandName = "Akar Bandhu",
            CompanyName = "AKAR BANDHU PVT. LTD.",
            Tagline = "Real Estate & Building Construction",
            SiteTitle = "AKAR BANDHU PVT. LTD. | Infrastructure & Construction",
            MetaDescription = "AKAR BANDHU PVT. LTD. — Govt. Construction, Infrastructure, Material Supply & Real Estate in Bihar",
            LogoPath = "",
            FooterMission = "At AKAR BANDHU PVT. LTD., we combine craftsmanship, innovation, and reliability to deliver government construction, infrastructure and development solutions across Bihar.",
            OfficeHours = "Mon – Sat: 9:00 AM – 6:00 PM",
            Cin = "U45202BR2022PTC059892",
            Pan = "AAYCA1383R",
            Tan = "PTNA09766B",
            FacebookUrl = "#",
            InstagramUrl = "#",
            TwitterUrl = "#",
            YoutubeUrl = "#",
            Email = "akarbandhuprivatelimited@gmail.com",
            Mobile = "+91-XXX-XXXXXX",
            WhatsApp = "",
            Address = "Alkapuri, Gardanibag, Patna, Bihar, India - 800001"
        };
    }

    public static WebsiteConfig Load()
    {
        var cache = HttpRuntime.Cache;
        var cached = cache[CacheKey] as WebsiteConfig;
        if (cached != null) return cached;

        WebsiteConfig cfg = Defaults();
        try
        {
            string path = GetFilePath();
            if (File.Exists(path))
            {
                string json = File.ReadAllText(path);
                var ser = new JavaScriptSerializer();
                var loaded = ser.Deserialize<WebsiteConfig>(json);
                if (loaded != null)
                    cfg = MergeWithDefaults(loaded);
            }
            else
            {
                cfg.Save();
            }
        }
        catch
        {
            // keep defaults
        }

        cache.Insert(CacheKey, cfg, null, DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration);
        return cfg;
    }

    public void Save()
    {
        string path = GetFilePath();
        string dir = Path.GetDirectoryName(path);
        if (!Directory.Exists(dir))
            Directory.CreateDirectory(dir);

        var ser = new JavaScriptSerializer();
        File.WriteAllText(path, ser.Serialize(this));
        HttpRuntime.Cache.Remove(CacheKey);
        HttpRuntime.Cache.Insert(CacheKey, this, null, DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration);
    }

    public static void ClearCache()
    {
        HttpRuntime.Cache.Remove(CacheKey);
    }

    static string GetFilePath()
    {
        return HttpContext.Current.Server.MapPath("~/App_Data/" + FileName);
    }

    static string DigitsOnly(string value)
    {
        if (string.IsNullOrWhiteSpace(value)) return "";
        return Regex.Replace(value, @"[^\d+]", "").Replace("+", "");
    }

    static WebsiteConfig MergeWithDefaults(WebsiteConfig loaded)
    {
        var d = Defaults();
        if (string.IsNullOrWhiteSpace(loaded.BrandName)) loaded.BrandName = d.BrandName;
        if (string.IsNullOrWhiteSpace(loaded.CompanyName)) loaded.CompanyName = d.CompanyName;
        if (string.IsNullOrWhiteSpace(loaded.Tagline)) loaded.Tagline = d.Tagline;
        if (string.IsNullOrWhiteSpace(loaded.SiteTitle)) loaded.SiteTitle = d.SiteTitle;
        if (string.IsNullOrWhiteSpace(loaded.MetaDescription)) loaded.MetaDescription = d.MetaDescription;
        if (loaded.LogoPath == null) loaded.LogoPath = "";
        if (string.IsNullOrWhiteSpace(loaded.FooterMission)) loaded.FooterMission = d.FooterMission;
        if (string.IsNullOrWhiteSpace(loaded.OfficeHours)) loaded.OfficeHours = d.OfficeHours;
        if (string.IsNullOrWhiteSpace(loaded.Cin)) loaded.Cin = d.Cin;
        if (string.IsNullOrWhiteSpace(loaded.Pan)) loaded.Pan = d.Pan;
        if (string.IsNullOrWhiteSpace(loaded.Tan)) loaded.Tan = d.Tan;
        if (string.IsNullOrWhiteSpace(loaded.FacebookUrl)) loaded.FacebookUrl = d.FacebookUrl;
        if (string.IsNullOrWhiteSpace(loaded.InstagramUrl)) loaded.InstagramUrl = d.InstagramUrl;
        if (string.IsNullOrWhiteSpace(loaded.TwitterUrl)) loaded.TwitterUrl = d.TwitterUrl;
        if (string.IsNullOrWhiteSpace(loaded.YoutubeUrl)) loaded.YoutubeUrl = d.YoutubeUrl;
        if (string.IsNullOrWhiteSpace(loaded.Email)) loaded.Email = d.Email;
        if (string.IsNullOrWhiteSpace(loaded.Mobile)) loaded.Mobile = d.Mobile;
        if (loaded.WhatsApp == null) loaded.WhatsApp = "";
        if (string.IsNullOrWhiteSpace(loaded.Address)) loaded.Address = d.Address;
        return loaded;
    }
}
