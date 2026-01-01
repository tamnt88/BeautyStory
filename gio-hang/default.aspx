<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="CartDefault" MasterPageFile="~/public/Public.master" ContentType="text/html; charset=utf-8" ResponseEncoding="utf-8" EnableEventValidation="false" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Gi&#7887; h&#224;ng | Beauty Story
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-4 cart-page">
        <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
            <ol class="breadcrumb mb-2">
                <li class="breadcrumb-item"><a href="/">Trang ch&#7911;</a></li>
                <li class="breadcrumb-item active" aria-current="page">Gi&#7887; h&#224;ng</li>
            </ol>
        </nav>
        <div class="section-heading">
            <div>
                <h4>Gi&#7887; h&#224;ng</h4>
                <p id="CartSubtitle" runat="server">Ki&#7875;m tra s&#7843;n ph&#7849;m tr&#432;&#7899;c khi &#273;&#7863;t h&#224;ng</p>
            </div>
        </div>

        <asp:Panel ID="EmptyCartPanel" runat="server" CssClass="cart-empty" Visible="false">
            <div class="cart-empty-card">
                <div class="cart-empty-icon">
                    <i class="fa-solid fa-basket-shopping"></i>
                </div>
                <h5>Gi&#7887; h&#224;ng &#273;ang tr&#7889;ng</h5>
                <p class="cart-empty-note">H&#227;y kh&#225;m ph&#225; c&#225;c s&#7843;n ph&#7849;m m&#7899;i v&#224; th&#234;m v&#224;o gi&#7887; h&#224;ng c&#7911;a b&#7841;n.</p>
                <a class="btn btn-dark btn-with-icon" href="/">
                    <i class="fa-solid fa-arrow-left-long"></i>
                    Ti&#7871;p t&#7909;c mua s&#7855;m
                </a>
            </div>
        </asp:Panel>

        <asp:Panel ID="CartPanel" runat="server">
            <div class="cart-table">
                <div class="cart-header">
                    <div>S&#7843;n ph&#7849;m</div>
                    <div>Gi&#225;</div>
                    <div>S&#7889; l&#432;&#7907;ng</div>
                    <div>Th&#224;nh ti&#7873;n</div>
                    <div></div>
                </div>
                <asp:Repeater ID="CartRepeater" runat="server" OnItemCommand="CartRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="cart-row">
                            <div class="cart-product">
                                <a class="cart-thumb" href="/san-pham/<%# Eval("SeoSlug") %>">
                                    <img src="<%# Eval("ImageUrl") %>" alt="<%# Eval("ProductName") %>" />
                                </a>
                                <div>
                                    <a class="cart-title" href="/san-pham/<%# Eval("SeoSlug") %>"><%# Eval("ProductName") %></a>
                                    <div class="cart-variant"><%# Eval("VariantText") %></div>
                                </div>
                            </div>
                            <div class="cart-price"><%# Eval("PriceHtml") %></div>
                            <div class="cart-qty">
                                <button type="button" class="qty-btn" data-action="minus" aria-label="Gi&#7843;m s&#7889; l&#432;&#7907;ng">-</button>
                                <asp:HiddenField ID="VariantIdField" runat="server" Value='<%# Eval("VariantId") %>' />
                                <asp:TextBox ID="QtyTextBox" runat="server" CssClass="form-control form-control-sm qty-input" Text='<%# Eval("Quantity") %>' />
                                <button type="button" class="qty-btn" data-action="plus" aria-label="T&#259;ng s&#7889; l&#432;&#7907;ng">+</button>
                            </div>
                            <div class="cart-total"><%# Eval("LineTotal") %></div>
                            <div>
                                <asp:LinkButton ID="RemoveButton" runat="server" CommandName="remove" CommandArgument='<%# Eval("VariantId") %>' CssClass="btn btn-link text-danger p-0">
                                    <i class="fa-solid fa-trash"></i>
                                    <span>&nbsp;X&#243;a</span>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="cart-actions">
                <div class="cart-actions-left">
                    <asp:LinkButton ID="UpdateCartButton" runat="server" CssClass="btn btn-outline-dark btn-with-icon" OnClick="UpdateCartButton_Click">
                        <i class="fa-solid fa-rotate-right"></i>
                        C&#7853;p nh&#7853;t l&#7841;i
                    </asp:LinkButton>
                    <span id="CartUpdateTarget" data-cart-postback="<%= UpdateCartButton.UniqueID %>"></span>
                    <a class="btn btn-outline-dark btn-with-icon" href="/">
                        <i class="fa-solid fa-arrow-left"></i>
                        Ti&#7871;p t&#7909;c mua s&#7855;m
                    </a>
                    <a class="btn btn-dark btn-with-icon" href="/thanh-toan">
                        <i class="fa-solid fa-credit-card"></i>
                        Thanh to&#225;n
                    </a>
                </div>
                <div class="cart-summary">
                    <div>T&#7841;m t&#237;nh</div>
                    <div class="cart-summary-total"><asp:Literal ID="CartTotalLiteral" runat="server" /></div>
                </div>
            </div>
        </asp:Panel>
    </main>
</asp:Content>

<asp:Content ID="PageScripts" ContentPlaceHolderID="PageScripts" runat="server">
    <script src="<%= ResolveUrl("~/public/assets/js/public-search.js") %>"></script>
    <script src="<%= ResolveUrl("~/public/assets/js/cart.js") %>"></script>
</asp:Content>
