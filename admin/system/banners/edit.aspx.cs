using System;
using System.IO;
using System.Linq;

public partial class AdminSystemBannersEdit : AdminBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBanner();
        }
    }

    private void LoadBanner()
    {
        int id;
        if (!int.TryParse(Request.QueryString["id"], out id) || id <= 0)
        {
            return;
        }

        using (var db = new BeautyStoryContext())
        {
            var banner = db.CfBanners.FirstOrDefault(b => b.Id == id);
            if (banner == null)
            {
                return;
            }

            BannerId.Value = banner.Id.ToString();
            TitleLine1Input.Text = banner.TitleLine1;
            TitleLine2Input.Text = banner.TitleLine2;
            TitleLine3Input.Text = banner.TitleLine3;
            ImageUrlInput.Text = banner.ImageUrl;
            LinkUrlInput.Text = banner.LinkUrl;
            LinkTextInput.Text = banner.LinkText;
            ShowLinkInput.Checked = banner.ShowLink;
            PositionInput.SelectedValue = string.IsNullOrWhiteSpace(banner.Position) ? "HomeMain" : banner.Position;
            SortOrderInput.Text = banner.SortOrder.ToString();
            StatusInput.Checked = banner.Status;

            BindPreview(ImagePreview, banner.ImageUrl);
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        int id;
        int sortOrder;
        int.TryParse(BannerId.Value, out id);
        int.TryParse(SortOrderInput.Text, out sortOrder);

        var updatedBy = Session["AdminUsername"] != null ? Session["AdminUsername"].ToString() : "admin";
        using (var db = new BeautyStoryContext())
        {
            CfBanner banner;
            if (id > 0)
            {
                banner = db.CfBanners.FirstOrDefault(b => b.Id == id);
                if (banner == null)
                {
                    return;
                }
            }
            else
            {
                banner = new CfBanner
                {
                    Status = true,
                    CreatedAt = DateTime.Now,
                    CreatedBy = updatedBy,
                    SortOrder = 0
                };
                db.CfBanners.Add(banner);
            }

            banner.TitleLine1 = TitleLine1Input.Text.Trim();
            banner.TitleLine2 = TitleLine2Input.Text.Trim();
            banner.TitleLine3 = TitleLine3Input.Text.Trim();
            banner.ImageUrl = ResolveImageValue(ImageRemove.Checked, ImageUpload, "banners", ImageUrlInput.Text.Trim());
            banner.LinkUrl = LinkUrlInput.Text.Trim();
            banner.LinkText = LinkTextInput.Text.Trim();
            banner.ShowLink = ShowLinkInput.Checked;
            banner.Position = PositionInput.SelectedValue;
            banner.SortOrder = sortOrder;
            banner.Status = StatusInput.Checked;
            banner.UpdatedAt = DateTime.Now;
            banner.UpdatedBy = updatedBy;

            db.SaveChanges();
        }

        Response.Redirect("/admin/system/banners/default.aspx");
    }

    private void BindPreview(System.Web.UI.WebControls.Image image, string url)
    {
        if (image == null)
        {
            return;
        }

        if (string.IsNullOrWhiteSpace(url))
        {
            image.Visible = false;
            image.ImageUrl = string.Empty;
            return;
        }

        image.Visible = true;
        image.ImageUrl = url;
    }

    private string ResolveImageValue(bool remove, System.Web.UI.WebControls.FileUpload upload, string folder, string existingPath)
    {
        if (remove)
        {
            return string.Empty;
        }

        return SaveUploadedFile(upload, folder, existingPath);
    }

    private string SaveUploadedFile(System.Web.UI.WebControls.FileUpload upload, string folder, string existingPath)
    {
        if (upload == null || !upload.HasFile)
        {
            return existingPath;
        }

        string fileName = Path.GetFileName(upload.FileName);
        string extension = Path.GetExtension(fileName);
        if (string.IsNullOrWhiteSpace(extension))
        {
            return existingPath;
        }

        string uniqueName = string.Format("{0}_{1}{2}", Path.GetFileNameWithoutExtension(fileName), DateTime.Now.ToString("yyyyMMddHHmmssfff"), extension);
        string virtualFolder = string.Format("~/upload/{0}", folder.Trim('/'));
        string physicalFolder = Server.MapPath(virtualFolder);
        if (!Directory.Exists(physicalFolder))
        {
            Directory.CreateDirectory(physicalFolder);
        }

        string physicalPath = Path.Combine(physicalFolder, uniqueName);
        upload.SaveAs(physicalPath);
        return string.Format("/upload/{0}/{1}", folder.Trim('/'), uniqueName);
    }
}
