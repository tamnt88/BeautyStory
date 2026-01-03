using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

public partial class CartDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ApplySeo();
            BindCart();
        }
    }

    private void ApplySeo()
    {
        string canonical = Request.Url != null ? Request.Url.GetLeftPart(UriPartial.Path) : string.Empty;
        SystemPageSeoApplier.Apply("cart", SeoTitleLiteral, SeoMetaLiteral, "Giỏ hàng | Beauty Story", canonical);
    }

    private void BindCart()
    {
        var cart = CartService.GetCart();
        var hasItems = cart.Count > 0;

        EmptyCartPanel.Visible = !hasItems;
        CartPanel.Visible = hasItems;
        if (CartSubtitle != null)
        {
            CartSubtitle.Visible = hasItems;
        }

        if (!hasItems)
        {
            return;
        }

        using (var db = new BeautyStoryContext())
        {
            var variantIds = cart.Select(c => c.VariantId).ToList();
            var variants = db.CfProductVariants
                .Where(v => variantIds.Contains(v.Id))
                .ToList();
            var productIds = variants.Select(v => v.ProductId).Distinct().ToList();
            var products = db.CfProducts
                .Where(p => productIds.Contains(p.Id))
                .ToList();
            var images = db.CfProductImages
                .Where(i => productIds.Contains(i.ProductId) && i.Status)
                .ToList();
            var slugs = db.CfSeoSlugs
               .Where(s => s.EntityType == "Product" && productIds.Contains(s.EntityId))
               .ToList();
            var attributes = db.CfProductVariantAttributes
                .Where(pva => variantIds.Contains(pva.VariantId))
                .ToList();
            var attributeLookup = db.CfVariantAttributes.ToDictionary(a => a.Id, a => a.AttributeName);
            var valueLookup = db.CfVariantAttributeValues.ToDictionary(v => v.Id, v => v.ValueName);
            var productSlugLookup = slugs.ToDictionary(s => s.EntityId, s => s.SeoSlug);
            var productLookup = products.ToDictionary(p => p.Id, p => p);
            var variantLookup = variants.ToDictionary(v => v.Id, v => v);

            var imageLookup = images
                .GroupBy(i => i.ProductId)
                .ToDictionary(
                    g => g.Key,
                    g =>
                    {
                        var primary = g.FirstOrDefault(i => i.IsPrimary);
                        if (primary != null)
                        {
                            return primary.ImageUrl;
                        }
                        var fallback = g.FirstOrDefault();
                        return fallback != null ? fallback.ImageUrl : "/images/fav.png";
                    });

            var lines = cart.Select(item =>
            {
                var variant = variantLookup.ContainsKey(item.VariantId) ? variantLookup[item.VariantId] : null;
                var product = variant != null && productLookup.ContainsKey(variant.ProductId) ? productLookup[variant.ProductId] : null;
                var price = GetEffectivePrice(variant);
                var lineTotal = price * item.Quantity;

                var attrs = attributes
                    .Where(a => a.VariantId == item.VariantId)
                    .Select(a =>
                    {
                        var attrName = attributeLookup.ContainsKey(a.AttributeId) ? attributeLookup[a.AttributeId] : string.Empty;
                        var valueName = valueLookup.ContainsKey(a.AttributeValueId) ? valueLookup[a.AttributeValueId] : string.Empty;
                        return string.Format("{0}: {1}", attrName, valueName);
                    })
                    .ToList();

                return new
                {
                    VariantId = item.VariantId,
                    ProductName = product != null ? product.ProductName : "-",
                    SeoSlug = product != null && productSlugLookup.ContainsKey(product.Id) ? productSlugLookup[product.Id] : "",
                    ImageUrl = product != null && imageLookup.ContainsKey(product.Id) ? imageLookup[product.Id] : "/images/fav.png",
                    VariantText = attrs.Count > 0 ? string.Join(", ", attrs) : "Mặc định",
                    PriceHtml = BuildPriceHtml(variant),
                    Quantity = item.Quantity,
                    LineTotal = price > 0 ? FormatMoney(lineTotal) : "Liên hệ",
                    LineTotalValue = lineTotal
                };
            }).ToList();

            CartRepeater.DataSource = lines;
            CartRepeater.DataBind();

            var total = lines.Sum(x => x.LineTotalValue);
            CartTotalLiteral.Text = total > 0 ? FormatMoney(total) : "Liên hệ";
        }
    }
    
    protected void UpdateCartButton_Click(object sender, EventArgs e)
    {
        var quantities = new Dictionary<int, int>();
        foreach (RepeaterItem item in CartRepeater.Items)
        {
            var variantField = item.FindControl("VariantIdField") as HiddenField;
            var qtyBox = item.FindControl("QtyTextBox") as TextBox;
            if (variantField == null || qtyBox == null)
            {
                continue;
            }

            int variantId;
            int qty;
            if (int.TryParse(variantField.Value, out variantId) && int.TryParse(qtyBox.Text, out qty))
            {
                quantities[variantId] = qty;
            }
        }

        CartService.UpdateQuantities(quantities);
        BindCart();
    }

    protected void CartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "remove")
        {
            int variantId;
            if (int.TryParse(Convert.ToString(e.CommandArgument), out variantId))
            {
                CartService.RemoveVariant(variantId);
                BindCart();
            }
        }
    }

    private static string FormatMoney(decimal value)
    {
        return string.Format("{0:N0} đ", value);
    }

    private static string BuildPriceHtml(CfProductVariant variant)
    {
        if (variant == null)
        {
            return "Liên hệ";
        }

        var price = variant.Price;
        var sale = variant.SalePrice.HasValue ? variant.SalePrice.Value : 0;
        if (sale > 0 && sale < price)
        {
            return string.Format("<span class=\"price-original\">{0}</span><span class=\"price-sale\">{1}</span>", FormatMoney(price), FormatMoney(sale));
        }

        if (price > 0)
        {
            return FormatMoney(price);
        }

        return "Liên hệ";
    }

    private static decimal GetEffectivePrice(CfProductVariant variant)
    {
        if (variant == null)
        {
            return 0;
        }

        var price = variant.Price;
        var sale = variant.SalePrice.HasValue ? variant.SalePrice.Value : 0;
        if (sale > 0 && sale < price)
        {
            return sale;
        }

        return price > 0 ? price : 0;
    }
}
