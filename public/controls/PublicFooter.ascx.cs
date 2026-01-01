using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

public partial class PublicFooter : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindFooterMenus();
        }
    }

    protected void FooterGroupRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
        {
            return;
        }

        var group = e.Item.DataItem as FooterMenuGroup;
        if (group == null)
        {
            return;
        }

        var repeater = e.Item.FindControl("FooterItemRepeater") as Repeater;
        if (repeater == null)
        {
            return;
        }

        repeater.DataSource = group.Items;
        repeater.DataBind();
    }

    protected string GetFooterUrl(object urlObj)
    {
        var url = urlObj as string;
        return string.IsNullOrWhiteSpace(url) ? "#" : url.Trim();
    }

    private void BindFooterMenus()
    {
        using (var db = new BeautyStoryContext())
        {
            var items = db.CfFooterMenus
                .Where(m => m.Status)
                .OrderBy(m => m.GroupSortOrder)
                .ThenBy(m => m.SortOrder)
                .ToList();

            var groups = items
                .GroupBy(m => m.GroupName)
                .Select(g => new FooterMenuGroup
                {
                    GroupName = g.Key,
                    Items = g.ToList()
                })
                .ToList();

            FooterGroupRepeater.DataSource = groups;
            FooterGroupRepeater.DataBind();
        }
    }

    private sealed class FooterMenuGroup
    {
        public string GroupName { get; set; }
        public List<CfFooterMenu> Items { get; set; }
    }
}
