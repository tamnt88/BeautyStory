<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="ProductDefault" MasterPageFile="~/public/Public.master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Chi tiết sản phẩm | Beauty Story
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveUrl("~/public/assets/vendor/swiper/swiper-bundle.min.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/public/assets/vendor/malihu/jquery.mCustomScrollbar.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-4 product-detail">
        <div class="product-breadcrumb">
            <asp:Literal ID="CategoryPath" runat="server" />
        </div>
        <div class="row g-4">
            <div class="col-lg-9">
                <div class="product-main-card">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="product-gallery">
                                <div class="swiper product-gallery-main">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <img src="<%= MainImageUrl %>" alt="<%= ProductName %>" />
                                        </div>
                                        <asp:Repeater ID="ImageRepeater" runat="server">
                                            <ItemTemplate>
                                                <div class="swiper-slide">
                                                    <img src="<%# Eval("ImageUrl") %>" alt="<%# Eval("AltText") %>" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-button-next"></div>
                                </div>
                                <div class="swiper product-gallery-thumbs">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <img src="<%= MainImageUrl %>" alt="<%= ProductName %>" />
                                        </div>
                                        <asp:Repeater ID="ThumbRepeater" runat="server">
                                            <ItemTemplate>
                                                <div class="swiper-slide">
                                                    <img src="<%# Eval("ImageUrl") %>" alt="<%# Eval("AltText") %>" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-info">
                                <h1 class="product-name"><asp:Literal ID="ProductNameLiteral" runat="server" /></h1>
                                <div class="product-meta">
                                    <span class="rating-badge">4.9★</span>
                                    <span>28 đánh giá</span>
                                    <span class="meta-sep">|</span>
                                    <span>112 Hỏi đáp</span>
                                    <span class="meta-sep">|</span>
                                    <span>SKU: 422230865</span>
                                </div>
                                <div class="product-price-detail">
                                    <asp:Literal ID="PriceLiteral" runat="server" />
                                </div>
                                <div class="product-variants">
                                    <h6>Biến thể</h6>
                                    <asp:Repeater ID="VariantAttributeRepeater" runat="server">
                                        <ItemTemplate>
                                            <div class="variant-group">
                                                <div class="variant-label"><%# Eval("AttributeName") %></div>
                                                <div class="variant-list">
                                                    <asp:Repeater ID="VariantValueRepeater" runat="server" DataSource='<%# Eval("Values") %>'>
                                                        <ItemTemplate>
                                                            <button type="button" class="variant-pill js-variant-value <%# Eval("ActiveClass") %>" data-attrid="<%# Eval("AttributeId") %>" data-valid="<%# Eval("ValueId") %>">
                                                                <%# Eval("ValueName") %>
                                                            </button>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="product-actions">
                                    <asp:HiddenField ID="SelectedVariantId" runat="server" />
                                    <asp:Button ID="AddToCartButton" runat="server" CssClass="btn btn-dark" Text="Thêm vào giỏ" OnClick="AddToCartButton_Click" />
                                    <button type="button" class="btn btn-outline-dark">Yêu thích</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="product-tabs mt-4">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tab-desc" type="button" role="tab">Mô tả</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-spec" type="button" role="tab">Thông số</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-ing" type="button" role="tab">Thành phần</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-use" type="button" role="tab">HDSD</button>
                        </li>
                    </ul>
                    <div class="tab-content p-3 bg-white border border-top-0">
                        <div class="tab-pane fade show active" id="tab-desc" role="tabpanel">
                            <asp:Literal ID="Description" runat="server" />
                        </div>
                        <div class="tab-pane fade" id="tab-spec" role="tabpanel">
                            <asp:Literal ID="Specification" runat="server" />
                        </div>
                        <div class="tab-pane fade" id="tab-ing" role="tabpanel">
                            <asp:Literal ID="Ingredients" runat="server" />
                        </div>
                        <div class="tab-pane fade" id="tab-use" role="tabpanel">
                            <asp:Literal ID="Usage" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
            <aside class="col-lg-3">
                <div class="product-sidecard">
                    <div class="shipping-card">
                        <div class="shipping-title">Miễn phí vận chuyển</div>
                        <div class="shipping-list">
                            <div class="shipping-item">
                                <img src="/public/assets/icon/1.png" alt="Giao nhanh 2H" />
                                <div>
                                    <div class="shipping-main">Giao nhanh miễn phí 2H.</div>
                                    <div class="shipping-sub">Trễ tặng 100K</div>
                                </div>
                            </div>
                            <div class="shipping-item">
                                <img src="/public/assets/icon/2.png" alt="Hàng chính hãng" />
                                <div>
                                    <div class="shipping-main">Cam kết 100% hàng chính hãng</div>
                                    <div class="shipping-sub">Đền bù 100% nếu phát hiện hàng giả</div>
                                </div>
                            </div>
                            <div class="shipping-item">
                                <img src="/public/assets/icon/3.png" alt="Giao hàng miễn phí" />
                                <div>
                                    <div class="shipping-main">Giao hàng miễn phí</div>
                                    <div class="shipping-sub">Từ 90K tại 60 tỉnh thành</div>
                                </div>
                            </div>
                            <div class="shipping-item">
                                <img src="/public/assets/icon/4.png" alt="Đổi trả 30 ngày" />
                                <div>
                                    <div class="shipping-main">Đổi trả trong 30 ngày</div>
                                    <div class="shipping-sub">Dễ dàng, nhanh chóng</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-sidecard">
                    <div class="sidecard-brand">
                        <img src="/images/logo_doc.png" alt="Brand Logo" />
                        <div class="sidecard-brand-actions">
                            <button type="button" class="btn btn-outline-dark btn-sm">Theo dõi</button>
                            <span class="brand-badge">25K</span>
                        </div>
                    </div>
                </div>
                <div class="product-sidecard">
                    <div class="sidecard-title">Sản phẩm xem cùng</div>
                    <div class="sidecard-related">
                        <div class="related-item">
                            <img src="<%= MainImageUrl %>" alt="<%= ProductName %>" />
                            <div>
                                <div class="related-name"><asp:Literal ID="ProductNameLiteralAside" runat="server" /></div>
                                <div class="related-price"><asp:Literal ID="PriceLiteralAside" runat="server" /></div>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
        </div>
    </main>
</asp:Content>
<asp:Content ID="PageScripts" ContentPlaceHolderID="PageScripts" runat="server">
    <script src="<%= ResolveUrl("~/public/assets/js/public-search.js") %>"></script>
    <script src="<%= ResolveUrl("~/public/assets/vendor/swiper/swiper-bundle.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/public/assets/vendor/malihu/jquery.mCustomScrollbar.concat.min.js") %>"></script>
    <script>
        (function () {
            var mainSwiper = new Swiper(".product-gallery-main", {
                slidesPerView: 1,
                spaceBetween: 10,
                navigation: {
                    nextEl: ".product-gallery-main .swiper-button-next",
                    prevEl: ".product-gallery-main .swiper-button-prev"
                }
            });
            var thumbSwiper = new Swiper(".product-gallery-thumbs", {
                slidesPerView: 4,
                spaceBetween: 10,
                watchSlidesProgress: true
            });
            mainSwiper.controller.control = thumbSwiper;
            thumbSwiper.controller.control = mainSwiper;
        })();
    </script>
</asp:Content>
