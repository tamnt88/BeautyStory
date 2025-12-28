<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="AdminDefault" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Tổng quan
</asp:Content>
<asp:Content ID="HeadingContent" ContentPlaceHolderID="PageHeading" runat="server">
    Bảng điều khiển
</asp:Content>
<asp:Content ID="SubHeadingContent" ContentPlaceHolderID="PageSubHeading" runat="server">
    Chào mừng bạn đến hệ thống quản trị BeautyStory
</asp:Content>
<asp:Content ID="BreadcrumbContent" ContentPlaceHolderID="PageBreadcrumb" runat="server">
    <li class="breadcrumb-item"><a href="/admin/default.aspx">Trang chủ</a></li>
    <li class="breadcrumb-item active" aria-current="page">Tổng quan</li>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row g-3">
        <div class="col-md-4">
            <div class="card-kpi p-3 bg-white">
                <div class="text-muted small">Đơn hàng hôm nay</div>
                <div class="fs-4 fw-semibold">0</div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card-kpi p-3 bg-white">
                <div class="text-muted small">Sản phẩm</div>
                <div class="fs-4 fw-semibold">0</div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card-kpi p-3 bg-white">
                <div class="text-muted small">Khách hàng</div>
                <div class="fs-4 fw-semibold">0</div>
            </div>
        </div>
    </div>
</asp:Content>
