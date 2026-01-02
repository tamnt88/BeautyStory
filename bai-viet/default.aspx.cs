using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public partial class PostDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPost();
        }
    }

    private void BindPost()
    {
        string slug = RouteData.Values["slug"] as string;
        if (string.IsNullOrWhiteSpace(slug))
        {
            Response.Redirect("/tin-tuc");
            return;
        }

        using (var db = new BeautyStoryContext())
        {
            var categories = db.CfPostCategories.Where(c => c.Status).ToList();
            var categorySlugs = db.CfSeoSlugs
                .Where(s => s.EntityType == "PostCategory")
                .ToList();

            var slugEntry = db.CfSeoSlugs.FirstOrDefault(s => s.EntityType == "Post" && s.SeoSlug == slug);
            if (slugEntry == null)
            {
                Response.Redirect("/tin-tuc");
                return;
            }

            var post = db.CfPosts.FirstOrDefault(p => p.Id == slugEntry.EntityId && p.Status);
            if (post == null)
            {
                Response.Redirect("/tin-tuc");
                return;
            }

            BindCategoryMenu(categories, categorySlugs, post.CategoryId);

            TitleLiteral.Text = HttpUtility.HtmlEncode(post.Title);
            DateLiteral.Text = post.CreatedAt.ToString("dd/MM/yyyy");
            ContentLiteral.Text = post.Content ?? string.Empty;

            if (!string.IsNullOrWhiteSpace(post.FeaturedImage))
            {
                FeaturedImage.ImageUrl = ResolveUrl(post.FeaturedImage);
                FeaturedImage.Visible = true;
            }

            var pageTitle = !string.IsNullOrWhiteSpace(post.SeoTitle) ? post.SeoTitle : post.Title;
            SeoTitleLiteral.Text = HttpUtility.HtmlEncode(pageTitle + " | Beauty Story");

            SeoMetaLiteral.Text = string.Format(
                "<meta name=\"description\" content=\"{0}\" />",
                HttpUtility.HtmlEncode(string.IsNullOrWhiteSpace(post.SeoDescription) ? post.Summary : post.SeoDescription));

            BindTags(db, post.Id);
            BindRelatedPosts(db, post.Id, post.CategoryId);
        }
    }

    private void BindCategoryMenu(List<CfPostCategory> categories, List<CfSeoSlug> slugs, int activeCategoryId)
    {
        var slugLookup = slugs.ToDictionary(s => s.EntityId, s => s.SeoSlug);
        var roots = categories
            .Where(c => !c.ParentId.HasValue)
            .OrderBy(c => c.SortOrder)
            .ThenBy(c => c.CategoryName)
            .ToList();

        var items = new List<CategoryItem>();
        foreach (var root in roots)
        {
            items.Add(BuildCategoryItem(root, categories, slugLookup, activeCategoryId));
        }

        PostCategoryRepeater.DataSource = items;
        PostCategoryRepeater.DataBind();
    }

    private CategoryItem BuildCategoryItem(
        CfPostCategory category,
        List<CfPostCategory> categories,
        Dictionary<int, string> slugLookup,
        int activeCategoryId)
    {
        var children = categories
            .Where(c => c.ParentId == category.Id)
            .OrderBy(c => c.SortOrder)
            .ThenBy(c => c.CategoryName)
            .ToList();

        var item = new CategoryItem
        {
            Id = category.Id,
            CategoryName = category.CategoryName,
            SeoSlug = slugLookup.ContainsKey(category.Id) ? slugLookup[category.Id] : string.Empty,
            Children = children.Select(child => BuildCategoryItem(child, categories, slugLookup, activeCategoryId)).ToList()
        };

        item.IsActive = category.Id == activeCategoryId ? "active" : string.Empty;
        item.IsOpen = IsTreeActive(item, activeCategoryId) ? "open" : string.Empty;
        return item;
    }

    private bool IsTreeActive(CategoryItem item, int activeCategoryId)
    {
        if (item.Id == activeCategoryId)
        {
            return true;
        }

        return item.Children.Any(child => IsTreeActive(child, activeCategoryId));
    }

    private void BindTags(BeautyStoryContext db, int postId)
    {
        var tagMaps = db.CfPostTagMaps
            .Where(m => m.PostId == postId && m.Status)
            .Select(m => m.TagId)
            .ToList();

        if (!tagMaps.Any())
        {
            TagPanel.Visible = false;
            return;
        }

        var tags = db.CfPostTags
            .Where(t => tagMaps.Contains(t.Id) && t.Status)
            .ToList();
        var slugLookup = db.CfSeoSlugs
            .Where(s => s.EntityType == "PostTag" && tagMaps.Contains(s.EntityId))
            .ToDictionary(s => s.EntityId, s => s.SeoSlug);

        var items = tags
            .OrderBy(t => t.SortOrder)
            .ThenBy(t => t.TagName)
            .Select(t => new TagItem
            {
                TagName = t.TagName,
                Url = BuildTagUrl(slugLookup.ContainsKey(t.Id) ? slugLookup[t.Id] : string.Empty)
            })
            .ToList();

        TagRepeater.DataSource = items;
        TagRepeater.DataBind();
        TagPanel.Visible = items.Any();
    }

    private string BuildTagUrl(string slug)
    {
        if (string.IsNullOrWhiteSpace(slug))
        {
            return "/tin-tuc";
        }

        return "/tin-tuc?tag=" + slug;
    }

    private void BindRelatedPosts(BeautyStoryContext db, int postId, int categoryId)
    {
        var related = db.CfPosts
            .Where(p => p.Status && p.Id != postId && p.CategoryId == categoryId)
            .OrderByDescending(p => p.CreatedAt)
            .Take(12)
            .ToList();

        if (!related.Any())
        {
            RelatedPanel.Visible = false;
            return;
        }

        var slugLookup = db.CfSeoSlugs
            .Where(s => s.EntityType == "Post" && related.Select(p => p.Id).Contains(s.EntityId))
            .ToDictionary(s => s.EntityId, s => s.SeoSlug);

        var items = related.Select(p => new RelatedPostItem
        {
            PostTitle = p.Title,
            CreatedAt = p.CreatedAt.ToString("dd/MM/yyyy"),
            ImageUrl = string.IsNullOrWhiteSpace(p.FeaturedImage) ? "/images/logo_doc.png" : p.FeaturedImage,
            SeoSlug = slugLookup.ContainsKey(p.Id) ? slugLookup[p.Id] : string.Empty
        }).ToList();

        RelatedRepeater.DataSource = items;
        RelatedRepeater.DataBind();
        RelatedPanel.Visible = items.Any();
    }

    public class CategoryItem
    {
        public CategoryItem()
        {
            Children = new List<CategoryItem>();
        }

        public int Id { get; set; }
        public string CategoryName { get; set; }
        public string SeoSlug { get; set; }
        public string IsActive { get; set; }
        public string IsOpen { get; set; }
        public List<CategoryItem> Children { get; set; }
    }

    public class TagItem
    {
        public string TagName { get; set; }
        public string Url { get; set; }
    }

    public class RelatedPostItem
    {
        public string PostTitle { get; set; }
        public string CreatedAt { get; set; }
        public string ImageUrl { get; set; }
        public string SeoSlug { get; set; }
    }
}
