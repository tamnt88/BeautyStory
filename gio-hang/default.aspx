<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="CartDefault" MasterPageFile="~/public/Public.master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Gio hang | Beauty Story
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-4 cart-page">
        <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
            <ol class="breadcrumb mb-2">
                <li class="breadcrumb-item"><a href="/">Trang chá»§</a></li>
                <li class="breadcrumb-item active" aria-current="page">Giá» hÃ ng</li>
            </ol>
        </nav>
        <div class="section-heading">
            <div>
                <h4>Giá» hÃ ng</h4>
                <p>Kiá»ƒm tra sáº£n pháº©m trÆ°á»›c khi Ä‘áº·t hÃ ng</p>
            </div>
        </div>

        <asp:Panel ID="EmptyCartPanel" runat="server" CssClass="cart-empty" Visible="false">
            <p>Giá» hÃ ng Ä‘ang trá»‘ng.</p>
            <a class="btn btn-outline-dark" href="/">Tiáº¿p tá»¥c mua sáº¯m</a>
        </asp:Panel>

        <asp:Panel ID="CartPanel" runat="server">
            <div class="cart-table">
                <div class="cart-header">
                    <div>Sáº£n pháº©m</div>
                    <div>GiÃ¡</div>
                    <div>Sá»‘ lÆ°á»£ng</div>
                    <div>ThÃ nh tiá»n</div>
                    <div></div>
                </div>
                <asp:Repeater ID="CartRepeater" runat="server" OnItemCommand="CartRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="cart-row">
                            <div class="cart-product">
                                <img src="<%# Eval("ImageUrl") %>" alt="<%# Eval("ProductName") %>" />
                                <div>
                                    <div class="cart-title"><%# Eval("ProductName") %></div>
                                    <div class="cart-variant"><%# Eval("VariantText") %></div>
                                </div>
                            </div>
                            <div class="cart-price"><%# Eval("Price") %></div>
                            <div class="cart-qty">
                                <asp:HiddenField ID="VariantIdField" runat="server" Value='<%# Eval("VariantId") %>' />
                                <asp:TextBox ID="QtyTextBox" runat="server" CssClass="form-control form-control-sm" Text='<%# Eval("Quantity") %>' />
                            </div>
                            <div class="cart-total"><%# Eval("LineTotal") %></div>
                            <div>
                                <asp:LinkButton ID="RemoveButton" runat="server" CommandName="remove" CommandArgument='<%# Eval("VariantId") %>' CssClass="btn btn-link text-danger p-0">XÃ³a</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="cart-actions">
                <asp:Button ID="UpdateCartButton" runat="server" CssClass="btn btn-outline-dark" Text="Cáº­p nháº­t giá» hÃ ng" OnClick="UpdateCartButton_Click" />
                <div class="cart-summary">
                    <div>Táº¡m tÃ­nh</div>
                    <div class="cart-summary-total"><asp:Literal ID="CartTotalLiteral" runat="server" /></div>
                </div>
            </div>
        </asp:Panel>
    </main>
</asp:Content>

<asp:Content ID="PageScripts" ContentPlaceHolderID="PageScripts" runat="server">
    <script src="<%= ResolveUrl("~/public/assets/js/public-search.js") %>"></script>
</asp:Content>
