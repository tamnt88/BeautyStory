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
            BindCart();
        }
    }

    private void BindCart()
    {
        var cart = CartService.GetCart();
        if (cart.Count == 0)
        {
            EmptyCartPanel.Visible = true;
            CartPanel.Visible = false;
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
                var price = variant != null && (variant.SalePrice.HasValue || variant.Price > 0)
                    ? (variant.SalePrice.HasValue ? variant.SalePrice.Value : variant.Price)
                    : 0;
                var lineTotal = price * item.Quantity;

                var attrs = attributes
                    .Where(a => a.VariantId == item.VariantId)
                    .Select(a =>
                    {
                        var attrName = attributeLookup.ContainsKey(a.AttributeId) ? attributeLookup[a.AttributeId] : "";
                        var valueName = valueLookup.ContainsKey(a.AttributeValueId) ? valueLookup[a.AttributeValueId] : "";
                        return string.Format("{0}: {1}", attrName, valueName);
                    })
                    .ToList();

                return new
                {
                    VariantId = item.VariantId,
                    ProductName = product != null ? product.ProductName : "-",
                    SeoSlug = product != null && productSlugLookup.ContainsKey(product.Id) ? productSlugLookup[product.Id] : "",
                    ImageUrl = product != null && imageLookup.ContainsKey(product.Id) ? imageLookup[product.Id] : "/images/fav.png",
                    VariantText = attrs.Count > 0 ? string.Join(", ", attrs) : "M\u1eb7c \u0111\u1ecbnh",
                    PriceHtml = BuildPriceHtml(variant),
                    Quantity = item.Quantity,
                    LineTotal = price > 0 ? string.Format("{0:N0} \u0111", lineTotal) : "Li\u00ean h\u1ec7",
                    LineTotalValue = lineTotal
                };
            }).ToList();

            CartRepeater.DataSource = lines;
            CartRepeater.DataBind();

            var total = lines.Sum(x => x.LineTotalValue);
            CartTotalLiteral.Text = total > 0 ? string.Format("{0:N0} \u0111", total) : "Li\u00ean h\u1ec7";
        }
    }

    private static string BuildPriceHtml(CfProductVariant variant)
    {
        if (variant == null)
        {
            return "Li\u00ean h\u1ec7";
        }

        var price = variant.Price;
        var sale = variant.SalePrice.HasValue ? variant.SalePrice.Value : 0m;
        if (sale > 0 && sale < price)
        {
            return string.Format("<span class=\"cart-price-old\">{0:N0} \u0111</span><span class=\"cart-price-sale\">{1:N0} \u0111</span>", price, sale);
        }

        if (price > 0)
        {
            return string.Format("<span class=\"cart-price-sale\">{0:N0} \u0111</span>", price);
        }

        return "Li\u00ean h\u1ec7";
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
            if (int.TryParse(e.CommandArgument.ToString(), out variantId))
            {
                CartService.RemoveVariant(variantId);
                BindCart();
            }
        }
    }
}
