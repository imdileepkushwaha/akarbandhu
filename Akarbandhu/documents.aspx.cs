using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class documents : Page
{
    private class DocItem
    {
        public string Title { get; set; }
        public string Ext { get; set; }
        public string Type { get; set; }
        public string SizeLabel { get; set; }
        public string Url { get; set; }
        public string Delay { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        var master = Master as SiteMaster;
        if (master != null)
            master.SetBodyClass("page-documents");

        if (!IsPostBack)
            BindDocuments();
    }

    private void BindDocuments()
    {
        var docs = GetDocuments();
        ltDocCount.Text = docs.Count.ToString();

        if (docs.Count == 0)
        {
            phEmpty.Visible = true;
            rptDocuments.Visible = false;
            return;
        }

        phEmpty.Visible = false;
        rptDocuments.Visible = true;
        rptDocuments.DataSource = docs;
        rptDocuments.DataBind();
    }

    private List<DocItem> GetDocuments()
    {
        var allowed = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
        {
            ".pdf", ".png", ".jpg", ".jpeg", ".webp", ".gif"
        };

        string folder = Server.MapPath("~/assets/documents");
        var list = new List<DocItem>();

        if (!Directory.Exists(folder))
            return list;

        var files = Directory.GetFiles(folder)
            .Select(f => new FileInfo(f))
            .Where(f => allowed.Contains(f.Extension))
            .OrderBy(f => f.Name, StringComparer.OrdinalIgnoreCase)
            .ToList();

        for (int i = 0; i < files.Count; i++)
        {
            var file = files[i];
            string ext = file.Extension.TrimStart('.').ToLowerInvariant();
            string type = ext == "pdf" ? "pdf" : "image";
            string title = Path.GetFileNameWithoutExtension(file.Name);
            title = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(
                title.Replace('_', ' ').Replace('-', ' ').ToLowerInvariant());

            list.Add(new DocItem
            {
                Title = title,
                Ext = ext.ToUpperInvariant(),
                Type = type,
                SizeLabel = FormatFileSize(file.Length),
                Url = ResolveUrl("~/assets/documents/" + Uri.EscapeDataString(file.Name)),
                Delay = Math.Min(i * 0.06, 0.4).ToString("0.##", System.Globalization.CultureInfo.InvariantCulture)
            });
        }

        return list;
    }

    private static string FormatFileSize(long bytes)
    {
        if (bytes >= 1048576)
            return Math.Round(bytes / 1048576.0, 1) + " MB";
        if (bytes >= 1024)
            return Math.Round(bytes / 1024.0, 1) + " KB";
        return bytes + " B";
    }
}
