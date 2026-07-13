using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Script.Serialization;

/// <summary>
/// Website homepage popup campaigns stored in App_Data/website-popups.json
/// </summary>
[Serializable]
public class WebsitePopupItem
{
    public string Id { get; set; }
    /// <summary>content | image</summary>
    public string PopupType { get; set; }
    public string Title { get; set; }
    public string Content { get; set; }
    public string ImagePath { get; set; }
    public string LinkUrl { get; set; }
    public bool IsActive { get; set; }
    public string CreatedOn { get; set; }
    public string UpdatedOn { get; set; }
    public string MentionBy { get; set; }

    public string ImageUrl
    {
        get
        {
            if (string.IsNullOrWhiteSpace(ImagePath)) return "";
            try { return VirtualPathUtility.ToAbsolute(ImagePath); }
            catch { return ImagePath; }
        }
    }

    public bool HasImage
    {
        get { return !string.IsNullOrWhiteSpace(ImagePath); }
    }

    public bool HasContent
    {
        get { return !string.IsNullOrWhiteSpace(Content); }
    }

    public bool IsImagePopup
    {
        get
        {
            if (string.Equals(PopupType, "image", StringComparison.OrdinalIgnoreCase))
                return true;
            if (string.Equals(PopupType, "content", StringComparison.OrdinalIgnoreCase))
                return false;
            // Legacy rows without PopupType
            return HasImage && !HasContent;
        }
    }

    public bool IsContentPopup
    {
        get { return !IsImagePopup; }
    }

    public string TypeText
    {
        get { return IsImagePopup ? "Image" : "Content"; }
    }

    public string StatusText
    {
        get { return IsActive ? "Active" : "Inactive"; }
    }

    public string NormalizedType
    {
        get { return IsImagePopup ? "image" : "content"; }
    }
}

[Serializable]
public class WebsitePopupFile
{
    public List<WebsitePopupItem> Items { get; set; }

    public WebsitePopupFile()
    {
        Items = new List<WebsitePopupItem>();
    }
}

public static class WebsitePopupStore
{
    const string CacheKey = "WebsitePopupStore.v1";
    const string FileName = "website-popups.json";

    public static List<WebsitePopupItem> GetAll()
    {
        return Load().Items
            .OrderByDescending(x => x.UpdatedOn ?? "")
            .ThenByDescending(x => x.CreatedOn ?? "")
            .ToList();
    }

    public static WebsitePopupItem GetById(string id)
    {
        if (string.IsNullOrWhiteSpace(id)) return null;
        return Load().Items.FirstOrDefault(x => string.Equals(x.Id, id, StringComparison.OrdinalIgnoreCase));
    }

    /// <summary>
    /// Latest active popup for public homepage display.
    /// </summary>
    public static WebsitePopupItem GetActiveForDisplay()
    {
        return Load().Items
            .Where(x => x.IsActive && (
                (x.IsImagePopup && x.HasImage) ||
                (x.IsContentPopup && (x.HasContent || !string.IsNullOrWhiteSpace(x.Title)))
            ))
            .OrderByDescending(x => x.UpdatedOn ?? "")
            .ThenByDescending(x => x.CreatedOn ?? "")
            .FirstOrDefault();
    }

    public static WebsitePopupItem Save(WebsitePopupItem item)
    {
        if (item == null) throw new ArgumentNullException("item");

        var file = Load();
        string now = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        string type = string.Equals(item.PopupType, "image", StringComparison.OrdinalIgnoreCase) ? "image" : "content";
        item.PopupType = type;

        if (type == "content")
        {
            item.ImagePath = "";
            item.LinkUrl = item.LinkUrl ?? "";
        }
        else
        {
            item.Content = "";
        }

        if (string.IsNullOrWhiteSpace(item.Id))
        {
            item.Id = Guid.NewGuid().ToString("N");
            item.CreatedOn = now;
            item.UpdatedOn = now;
            if (item.Title == null) item.Title = "";
            if (item.Content == null) item.Content = "";
            if (item.ImagePath == null) item.ImagePath = "";
            if (item.LinkUrl == null) item.LinkUrl = "";
            if (item.MentionBy == null) item.MentionBy = "";
            file.Items.Add(item);
        }
        else
        {
            var existing = file.Items.FirstOrDefault(x => string.Equals(x.Id, item.Id, StringComparison.OrdinalIgnoreCase));
            if (existing == null)
                throw new InvalidOperationException("Popup not found.");

            string oldImage = existing.ImagePath;
            existing.PopupType = type;
            existing.Title = item.Title ?? "";
            existing.Content = item.Content ?? "";
            existing.ImagePath = item.ImagePath ?? "";
            existing.LinkUrl = item.LinkUrl ?? "";
            existing.IsActive = item.IsActive;
            existing.MentionBy = item.MentionBy ?? existing.MentionBy ?? "";
            existing.UpdatedOn = now;

            if (type == "content" && !string.IsNullOrWhiteSpace(oldImage) &&
                !string.Equals(oldImage, existing.ImagePath, StringComparison.OrdinalIgnoreCase))
            {
                TryDeleteImageFile(oldImage);
            }

            item = existing;
        }

        Persist(file);
        return item;
    }

    public static bool Delete(string id)
    {
        var file = Load();
        var existing = file.Items.FirstOrDefault(x => string.Equals(x.Id, id, StringComparison.OrdinalIgnoreCase));
        if (existing == null) return false;

        file.Items.Remove(existing);
        Persist(file);

        TryDeleteImageFile(existing.ImagePath);
        return true;
    }

    public static bool SetActive(string id, bool isActive)
    {
        var file = Load();
        var existing = file.Items.FirstOrDefault(x => string.Equals(x.Id, id, StringComparison.OrdinalIgnoreCase));
        if (existing == null) return false;

        existing.IsActive = isActive;
        existing.UpdatedOn = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        Persist(file);
        return true;
    }

    public static void ClearCache()
    {
        HttpRuntime.Cache.Remove(CacheKey);
    }

    static WebsitePopupFile Load()
    {
        var cache = HttpRuntime.Cache;
        var cached = cache[CacheKey] as WebsitePopupFile;
        if (cached != null) return cached;

        var file = new WebsitePopupFile();
        try
        {
            string path = GetFilePath();
            if (File.Exists(path))
            {
                string json = File.ReadAllText(path);
                var ser = new JavaScriptSerializer();
                var loaded = ser.Deserialize<WebsitePopupFile>(json);
                if (loaded != null && loaded.Items != null)
                    file = loaded;
            }
            else
            {
                Persist(file);
            }
        }
        catch
        {
            file = new WebsitePopupFile();
        }

        if (file.Items == null)
            file.Items = new List<WebsitePopupItem>();

        cache.Insert(CacheKey, file, null, DateTime.Now.AddMinutes(5), Cache.NoSlidingExpiration);
        return file;
    }

    static void Persist(WebsitePopupFile file)
    {
        if (file.Items == null)
            file.Items = new List<WebsitePopupItem>();

        string path = GetFilePath();
        string dir = Path.GetDirectoryName(path);
        if (!Directory.Exists(dir))
            Directory.CreateDirectory(dir);

        var ser = new JavaScriptSerializer();
        File.WriteAllText(path, ser.Serialize(file));
        ClearCache();
        HttpRuntime.Cache.Insert(CacheKey, file, null, DateTime.Now.AddMinutes(5), Cache.NoSlidingExpiration);
    }

    static string GetFilePath()
    {
        return HttpContext.Current.Server.MapPath("~/App_Data/" + FileName);
    }

    static void TryDeleteImageFile(string virtualPath)
    {
        if (string.IsNullOrWhiteSpace(virtualPath)) return;
        try
        {
            string physical = HttpContext.Current.Server.MapPath(virtualPath);
            if (File.Exists(physical))
                File.Delete(physical);
        }
        catch
        {
            // ignore file cleanup errors
        }
    }
}
