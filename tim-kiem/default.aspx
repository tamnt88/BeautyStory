<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="SearchDefault" MasterPageFile="~/public/Public.master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Tim kiem | Beauty Story
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-4 category-page">
        <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
            <ol class="breadcrumb mb-2">
                <li class="breadcrumb-item"><a href="/">Trang chá»§</a></li>
                <li class="breadcrumb-item active" aria-current="page">TÃ¬m kiáº¿m</li>
            </ol>
        </nav>
        <div class="section-heading">
            <div>
                <h4>Káº¿t quáº£ tÃ¬m kiáº¿m</h4>
                <p><asp:Literal ID="SearchSummary" runat="server" /></p>
            </div>
        </div>

        <asp:Panel ID="EmptyResultPanel" runat="server" Visible="false" CssClass="cart-empty">
            <p>KhÃ´ng tÃ¬m tháº¥y sáº£n pháº©m phÃ¹ há»£p.</p>
            <a class="btn btn-outline-dark" href="/">Quay vá» trang chá»§</a>
        </asp:Panel>

        <div class="row g-3">
            <asp:Repeater ID="SearchRepeater" runat="server">
                <ItemTemplate>
                    <div class="col-6 col-md-4 col-lg-3">
                        <div class="product-card">
                            <div class="product-thumb">
                                <img src="<%# Eval("ImageUrl") %>" alt="<%# Eval("ProductName") %>" />
                            </div>
                            <div class="product-body">
                                <div class="product-category"><%# Eval("CategoryName") %></div>
                                <h6 class="product-title"><%# Eval("ProductName") %></h6>
                                <div class="product-price"><%# Eval("PriceLabel") %></div>
                            </div>
                            <div class="product-footer">
                                <a class="btn btn-sm btn-dark w-100" href="/san-pham/default.aspx?slug=<%# Eval("SeoSlug") %>">Xem chi tiáº¿t</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="mt-4">
            <asp:Literal ID="PaginationLiteral" runat="server" />
        </div>
    </main>
</asp:Content>

<asp:Content ID="PageScripts" ContentPlaceHolderID="PageScripts" runat="server">
    <script src="<%= ResolveUrl("~/public/assets/js/public-search.js") %>"></script>
</asp:Content>
