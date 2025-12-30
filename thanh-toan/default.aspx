<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="CheckoutDefault" MasterPageFile="~/public/Public.master" ContentType="text/html; charset=utf-8" ResponseEncoding="utf-8" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Thanh toán | Beauty Story
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-4 checkout-page">
        <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
            <ol class="breadcrumb mb-2">
                <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="/gio-hang/default.aspx">Giỏ hàng</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
            </ol>
        </nav>
        <div class="section-heading">
            <div>
                <h4>Thanh toán</h4>
                <p>Hoàn tất thông tin để đặt hàng</p>
            </div>
        </div>

        <asp:Panel ID="CheckoutEmptyPanel" runat="server" CssClass="cart-empty" Visible="false">
            <p>Giỏ hàng đang trống.</p>
            <a class="btn btn-outline-dark" href="/">Tiếp tục mua sắm</a>
        </asp:Panel>

        <asp:UpdatePanel ID="CheckoutUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
        <asp:Panel ID="CheckoutPanel" runat="server">
            <div class="row g-4">
                <div class="col-lg-8">
                    <div class="card checkout-card">
                        <div class="card-body">
                            <h5 class="card-title">Thông tin giao hàng</h5>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Họ tên</label>
                                    <asp:TextBox ID="CustomerNameInput" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số điện thoại</label>
                                    <asp:TextBox ID="PhoneInput" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Địa chỉ (Số nhà + Tên đường)</label>
                                    <asp:TextBox ID="AddressInput" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Tỉnh</label>
                                    <asp:DropDownList ID="ProvinceDropDown" runat="server" CssClass="form-select" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Phường</label>
                                    <asp:DropDownList ID="WardDropDown" runat="server" CssClass="form-select" />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Ghi chú</label>
                                    <asp:TextBox ID="NoteInput" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card checkout-card mt-4">
                        <div class="card-body">
                            <h5 class="card-title">Hóa đơn (tùy chọn)</h5>
                            <div class="form-check mb-3">
                                <asp:CheckBox ID="InvoiceCheckBox" runat="server" CssClass="form-check-input" />
                                <label class="form-check-label" for="MainContent_InvoiceCheckBox">Xuất hóa đơn công ty</label>
                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Tên công ty</label>
                                    <asp:TextBox ID="InvoiceCompanyInput" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Mã số thuế</label>
                                    <asp:TextBox ID="InvoiceTaxInput" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Email nhận hóa đơn</label>
                                    <asp:TextBox ID="InvoiceEmailInput" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Địa chỉ xuất hóa đơn</label>
                                    <asp:TextBox ID="InvoiceAddressInput" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card checkout-card mt-4">
                        <div class="card-body">
                            <h5 class="card-title">Vận chuyển</h5>
                            <asp:RadioButtonList ID="ShippingMethodList" runat="server" CssClass="checkout-radio" RepeatLayout="Flow" />
                            <div class="checkout-hint">Phí ship sẽ được tính theo tỉnh/phường.</div>
                        </div>
                    </div>

                    <div class="card checkout-card mt-4">
                        <div class="card-body">
                            <h5 class="card-title">Thanh toán</h5>
                            <asp:RadioButtonList ID="PaymentMethodList" runat="server" CssClass="checkout-radio" RepeatLayout="Flow" />
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card checkout-card">
                        <div class="card-body">
                            <h5 class="card-title">Đơn hàng</h5>
                            <asp:Repeater ID="SummaryRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="checkout-item">
                                        <div>
                                            <div class="checkout-item-name"><%# Eval("ProductName") %></div>
                                            <div class="checkout-item-variant"><%# Eval("VariantText") %></div>
                                        </div>
                                        <div class="checkout-item-price"><%# Eval("LineTotal") %></div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <div class="checkout-total">
                                <div class="checkout-total-row">
                                    <span>Tạm tính</span>
                                    <strong><asp:Literal ID="SubtotalLiteral" runat="server" /></strong>
                                </div>
                                <div class="checkout-total-row">
                                    <span>Phí vận chuyển (tạm tính)</span>
                                    <strong><asp:Literal ID="ShippingFeeLiteral" runat="server" /></strong>
                                </div>
                                <div class="checkout-total-row total">
                                    <span>Tổng cộng</span>
                                    <strong><asp:Literal ID="TotalLiteral" runat="server" /></strong>
                                </div>
                            </div>

                            <asp:Label ID="CheckoutMessage" runat="server" CssClass="text-danger" />
                            <asp:Button ID="PlaceOrderButton" runat="server" Text="Xác nhận đặt hàng" CssClass="btn btn-dark w-100 mt-3" OnClick="PlaceOrderButton_Click" />
                            <a class="btn btn-outline-dark w-100 mt-2" href="/gio-hang/default.aspx">Quay lại giỏ hàng</a>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="PlaceOrderButton" />
            </Triggers>
        </asp:UpdatePanel>
    </main>
</asp:Content>

<asp:Content ID="PageScripts" ContentPlaceHolderID="PageScripts" runat="server">
    <script>
        (function () {
            function updateSummary() {
                var provinceId = parseInt($("#<%= ProvinceDropDown.ClientID %>").val(), 10) || 0;
                var shippingMethodId = parseInt($("input[name='<%= ShippingMethodList.UniqueID %>']:checked").val(), 10) || 0;

                if (typeof PageMethods === "undefined" || !shippingMethodId) {
                    return;
                }

                PageMethods.GetShippingSummary(provinceId, shippingMethodId, function (result) {
                    if (!result) {
                        return;
                    }
                    $("#<%= ShippingFeeLiteral.ClientID %>").text(result.ShippingFeeText || "");
                    $("#<%= TotalLiteral.ClientID %>").text(result.TotalText || "");
                });
            }

            function loadWards() {
                var provinceId = parseInt($("#<%= ProvinceDropDown.ClientID %>").val(), 10) || 0;
                var $ward = $("#<%= WardDropDown.ClientID %>");
                $ward.empty();
                $ward.append($("<option></option>").val("").text("-- Chọn phường --"));

                if (typeof PageMethods === "undefined" || !provinceId) {
                    updateSummary();
                    return;
                }

                PageMethods.GetWards(provinceId, function (items) {
                    if (Array.isArray(items)) {
                        items.forEach(function (item) {
                            $ward.append($("<option></option>").val(item.Id).text(item.Name));
                        });
                    }
                    updateSummary();
                });
            }

            $(document).on("change", "#<%= ProvinceDropDown.ClientID %>", loadWards);
            $(document).on("change", "input[name='<%= ShippingMethodList.UniqueID %>']", updateSummary);
        })();
    </script>
</asp:Content>
