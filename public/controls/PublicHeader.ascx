<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PublicHeader.ascx.cs" Inherits="PublicHeader" %>

<header class="ecommerce-header">
            <div class="top-header d-none d-lg-block py-2 bg-light border-0 font-normal">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-4 sm-mx-none">
                            <div class="d-flex align-items-center">
                                <a href="#" class="text-general"><span><i class="fa-solid fa-address"></i>&nbsp;143 đường số 32-CL, Phường Cát Lái, TP Hồ Chí Minh, Việt Nam</span></a>
                            </div>
                        </div>
                        <div class="col-lg-8 d-flex">
                            <ul class="top-links d-flex ms-auto align-items-center">
                                <li><a href="tel:0909 221 558"><i class="fa-solid fa-phone"></i>&nbsp;Hotline: 0828 409 096</a></li>
                                
                                <li><a href="#"><i class="fa-solid fa-envelope"></i>&nbsp;beautystory0909@gmail.com</a></li>
                                <li><a href="<%= ResolveUrl("~/tra-cuu-don-hang/default.aspx") %>" title="Tra cứu đơn hàng"><i class="fa-solid fa-receipt"></i>&nbsp;Tra cứu đơn hàng</a></li>
                                <%--<li><a href="#">Vietnamese</a></li>--%>
                                <%--<li><a href="#"><i class="flaticon-like flat-mini me-1 text-primary"></i> Yêu thích</a></li>--%>
                               <%-- <li class="my-account-dropdown">
                                    <a href="my-account.html" class="has-dropdown"><i class="flaticon-user-3 flat-mini text-primary me-1"></i>Tài khoản</a>
                                    <ul class="my-account-popup">
                                        <li><a href="my-account.html"><span class="menu-item-text">Thông tin tài khoản</span></a></li>
                                        <li><a href="checkout.html"><span class="menu-item-text">Thanh toán</span></a></li>
                                        <li><a href="wishlist.html"><span class="menu-item-text">Yêu thích</span></a></li>
                                    </ul>
                                </li>--%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-nav  bg-white d-none d-lg-block">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-8 col-md-9">
                            <nav class="navbar navbar-expand-lg nav-general nav-primary-hover">
                                <a class="navbar-brand" href="/"><img class="nav-logo" src="/images/logo_ngang.png" alt="Beauty Story"></a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <i class="flaticon-menu-2 flat-small text-primary"></i>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <div class="category-bar header-category-bar">
                                        <div class="category-toggle">
                                            <i class="fas fa-bars"></i>
                                            <span>Danh mục</span>
                                        </div>
                                        <div class="category-dropdown">
                                            <div class="category-left">
                                                <asp:Repeater ID="CategoryMenuRepeater" runat="server">
                                                    <ItemTemplate>
                                                        <a class="category-parent <%# GetMenuItemActiveClass(Container.ItemIndex) %>" data-target="cat-panel-<%# Container.ItemIndex %>" href="/danh-muc/<%# Eval("SeoSlug") %>">
                                                            <%# Eval("CategoryName") %>
                                                            <span class="chevron"><i class="fas fa-angle-right"></i></span>
                                                        </a>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="category-right">
                                                <div class="category-scroll">
                                                    <asp:Repeater ID="CategoryPanelRepeater" runat="server">
                                                        <ItemTemplate>
                                                            <div class="category-panel <%# GetPanelActiveClass(Container.ItemIndex) %>" id="cat-panel-<%# Container.ItemIndex %>">
                                                                <h6><%# Eval("CategoryName") %></h6>
                                                                <ul class="panel-links">
                                                                    <asp:Repeater ID="ChildPanelRepeater" runat="server" DataSource='<%# Eval("Children") %>'>
                                                                        <ItemTemplate>
                                                                            <li class="panel-group">
                                                                                <a class="panel-title" href="/danh-muc/<%# Eval("SeoSlug") %>"><%# Eval("CategoryName") %></a>
                                                                                <ul class="panel-sub">
                                                                                    <asp:Repeater ID="GrandChildPanelRepeater" runat="server" DataSource='<%# Eval("Children") %>'>
                                                                                        <ItemTemplate>
                                                                                            <li>
                                                                                                <a href="/danh-muc/<%# Eval("SeoSlug") %>"><%# Eval("CategoryName") %></a>
                                                                                            </li>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                </ul>
                                                                            </li>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </ul>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="navbar-nav mx-auto">
                                        <%--<li class="nav-item"><a class="nav-link" href="/">Hot deals</a></li>--%>
                                        <li class="nav-item"><a class="nav-link" href="/">Thương hiệu</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/">Hàng mới về</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/">Bán chạy</a></li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="blog-grid-left-sidebar.html">Tin tức</a>
                                            <ul class="dropdown-menu">
                                                <li class="dropdown"> <a class="dropdown-toggle dropdown-item" href="blog-grid-modern.html">Blog Grid</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="blog-grid-modern.html">Grid Modern</a></li>
                                                        <li><a class="dropdown-item" href="blog-grid-left-sidebar.html">Left Sidebar Grid</a></li>
                                                        <li><a class="dropdown-item" href="blog-grid-right-sidebar.html">Right Sidebar Grid</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown"> <a class="dropdown-toggle dropdown-item" href="blog-list-modern.html">Blog List</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="blog-list-modern.html">List Modern</a></li>
                                                        <li><a class="dropdown-item" href="blog-list-left-sidebar.html">Left Sidebar List</a></li>
                                                        <li><a class="dropdown-item" href="blog-list-right-sidebar.html">Right Sidebar List</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown"> <a class="dropdown-toggle dropdown-item" href="blog-single-modern.html">Blog Single</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="blog-single-modern.html">Blog Single Modern</a></li>
                                                        <li><a class="dropdown-item" href="blog-single-left-sidebar.html">Blog Single Left Sidebar</a></li>
                                                        <li><a class="dropdown-item" href="blog-single-right-sidebar.html">Blog Single Right Sidebar</a></li>
                                                    </ul>
                                                </li>
                                                <li><a class="dropdown-item" href="blog-missionary-grid.html">Missionary Grid</a></li>
                                                <li><a class="dropdown-item" href="blog-video-grid.html">Video Grid</a></li>
                                            </ul>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" href="contact.html">Liên hệ</a></li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <div class="col-xl-4 col-md-3">
                            <div class="margin-right-1 d-flex align-items-center justify-content-end h-100">
                                <div class="product-search-one flex-grow-1 global-search touch-screen-view">
                                    <div class="form-inline search-pill-shape search-box">
                                        <input type="text" class="form-control search-field js-search-input" name="q" placeholder="T&#236;m s&#7843;n ph&#7849;m, th&#432;&#417;ng hi&#7879;u b&#7841;n mong mu&#7889;n...">
                                        <button type="button" class="search-submit"><i class="flaticon-search flat-mini text-white"></i></button>
                                        <div class="search-suggest"></div>
                                    </div>
                                </div>
                                <div class="search-view d-xl-none">
                                    <a href="#" class="search-pop top-quantity d-flex align-items-center text-decoration-none">
                                        <i class="flaticon-search flat-small text-dark"></i>
                                    </a>
                                </div>
                                <%--<div class="refresh-view">
                                    <a href="compare.html" class="position-relative top-quantity d-flex align-items-center text-white text-decoration-none">
                                        <i class="flaticon-shuffle flat-small text-dark"></i>
                                    </a>
                                </div>--%>
                                <div class="header-cart-4">
                                    <a href="<%= ResolveUrl("~/gio-hang/default.aspx") %>" class="cart has-cart-data" title="Giỏ hàng">
                                        <div class="cart-icon"><i class="flaticon-shopping-cart flat-small"></i> <span class="header-cart-count"><asp:Literal ID="CartCountLiteral" runat="server" /></span></div>
                                        <div class="cart-wrap">
                                            <div class="cart-text">Giỏ hàng</div>
                                            <span class="header-cart-count">(<asp:Literal ID="CartCountTextLiteral" runat="server" />) Sản phẩm</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-sticky bg-white py-10">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xxl-2 col-xl-2 col-lg-3 col-6 order-lg-1">
                            <div class="d-flex align-items-center h-100 md-py-10">
                                <div class="nav-leftpush-overlay">
                                    <nav class="navbar navbar-expand-lg nav-general nav-primary-hover">
                                        <button type="button" class="push-nav-toggle d-lg-none border-0">
                                            <i class="flaticon-menu-2 flat-small text-primary"></i>
                                        </button>
                                        <div class="navbar-slide-push transation-this">
                                            <div class="login-signup bg-secondary d-flex justify-content-between py-10 px-20 align-items-center">
                                                <a href="registration.html" class="d-flex align-items-center text-white">
                                                    <i class="flaticon-user flat-small me-1"></i>
                                                    <span>Login/Signup</span>
                                                </a>
                                                <span class="slide-nav-close"><i class="flaticon-cancel flat-mini text-white"></i></span>
                                            </div>
                                            <div class="menu-and-category">
                                                <ul class="nav nav-pills wc-tabs" id="menu-and-category" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <a class="nav-link active" id="pills-push-menu-tab" data-bs-toggle="pill" href="#pills-push-menu" role="tab" aria-controls="pills-push-menu" aria-selected="true">Menu</a>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <a class="nav-link" id="pills-push-categories-tab" data-bs-toggle="pill" href="#pills-push-categories" role="tab" aria-controls="pills-push-categories" aria-selected="true">Categories</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content" id="menu-and-categoryContent">
                                                    <div class="tab-pane fade show active woocommerce-Tabs-panel woocommerce-Tabs-panel--description" id="pills-push-menu" role="tabpanel" aria-labelledby="pills-push-menu-tab">
                                                        <div class="push-navbar">
                                                            <ul class="navbar-nav">
                                                                <li class="nav-item dropdown">
                                                                    <a class="nav-link dropdown-toggle" href="index.html">Home</a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a class="dropdown-item" href="index.html">All Demos</a></li>
                                                                        <li><a class="dropdown-item" href="index-minimal.html">Minimal</a></li>
                                                                        <li><a class="dropdown-item" href="index-watches.html">Watches</a></li>
                                                                        <li><a class="dropdown-item" href="index-fatloss.html">Fatloss</a></li>
                                                                        <li><a class="dropdown-item" href="index-handicruft.html">Handicruft</a></li>
                                                                        <li><a class="dropdown-item" href="index-food-corner.html">Food Corner</a></li>
                                                                        <li><a class="dropdown-item" href="index-classic.html">Classic</a></li>
                                                                        <li><a class="dropdown-item" href="index-optical-shop.html">Optical</a></li>
                                                                        <li><a class="dropdown-item" href="index-furniture-store.html">Furniture</a></li>
                                                                        <li><a class="dropdown-item" href="index-grocery-store.html">Grocery</a></li>
                                                                        <li><a class="dropdown-item" href="index-cosmetic-store.html">Cosmetic</a></li>
                                                                        <li><a class="dropdown-item" href="index-women-fashion.html">Women Fashion</a></li>
                                                                        <li><a class="dropdown-item" href="index-pet-shop.html">Pet Shop</a></li>
                                                                        <li><a class="dropdown-item" href="index-man-fashion.html">Man Fashion</a></li>
                                                                        <li><a class="dropdown-item" href="index-electronic.html">Electronic</a></li>
                                                                        <li><a class="dropdown-item" href="index-standard.html">Standard</a></li>
                                                                    </ul>
                                                                </li>
                                                                <li class="nav-item dropdown">
                                                                    <a class="nav-link dropdown-toggle" href="blog-grid-left-sidebar.html">Tin tức</a>
                                                                    <ul class="dropdown-menu">
                                                                        <li class="dropdown"> <a class="dropdown-toggle dropdown-item" href="blog-grid-modern.html">Blog Grid</a>
                                                                            <ul class="dropdown-menu">
                                                                                <li><a class="dropdown-item" href="blog-grid-modern.html">Grid Modern</a></li>
                                                                                <li><a class="dropdown-item" href="blog-grid-left-sidebar.html">Left Sidebar Grid</a></li>
                                                                                <li><a class="dropdown-item" href="blog-grid-right-sidebar.html">Right Sidebar Grid</a></li>
                                                                            </ul>
                                                                        </li>
                                                                        <li class="dropdown"> <a class="dropdown-toggle dropdown-item" href="blog-list-modern.html">Blog List</a>
                                                                            <ul class="dropdown-menu">
                                                                                <li><a class="dropdown-item" href="blog-list-modern.html">List Modern</a></li>
                                                                                <li><a class="dropdown-item" href="blog-list-left-sidebar.html">Left Sidebar List</a></li>
                                                                                <li><a class="dropdown-item" href="blog-list-right-sidebar.html">Right Sidebar List</a></li>
                                                                            </ul>
                                                                        </li>
                                                                        <li class="dropdown"> <a class="dropdown-toggle dropdown-item" href="blog-single-modern.html">Blog Single</a>
                                                                            <ul class="dropdown-menu">
                                                                                <li><a class="dropdown-item" href="blog-single-modern.html">Blog Single Modern</a></li>
                                                                                <li><a class="dropdown-item" href="blog-single-left-sidebar.html">Blog Single Left Sidebar</a></li>
                                                                                <li><a class="dropdown-item" href="blog-single-right-sidebar.html">Blog Single Right Sidebar</a></li>
                                                                            </ul>
                                                                        </li>
                                                                        <li><a class="dropdown-item" href="blog-missionary-grid.html">Missionary Grid</a></li>
                                                                        <li><a class="dropdown-item" href="blog-video-grid.html">Video Grid</a></li>
                                                                    </ul>
                                                                </li>
                                                                <li class="nav-item"><a class="nav-link" href="contact.html">Liên hệ</a></li>
                                                            </ul>
                                                            <a href="#" class="p-20 d-block bg-secondary text-primary text-uppercase font-600 hover-text-primary">Buy now!</a>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="pills-push-categories" role="tabpanel" aria-labelledby="pills-push-categories-tab">
                                                        <div class="categories-menu">
                                                            <ul class="menu">
                                                                <li class="menu-item-has-children unicode-megamenu-dropdown unicode-megamenu-item-full-width">
                                                                    <a href="#">Women's Fashion</a>
                                                                    <div class="unicode-megamenu-wrapper" style="background-image: url(/public/theme/assets/images/banner/49.png); background-size: cover;
																		background-position:0px;">
                                                                        <div class="unicode-megamenu-holder">
                                                                            <div class="row row-cols-3">
                                                                                <div class="col">
                                                                                    <ul class="unicode-menu-element unicode-megamenu-list">
                                                                                        <li class="menu-item">
                                                                                            <a class="nav-link" href="#" title="Top wear"> <span>Top Clothing</span></a>
                                                                                            <ul class="unicode-sub-megamenu">
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Tops"> <span>Tops</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="T-Shirts"> <span>T-Shirts</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Shirts"> <span>Shirts</span></a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Jeans & Jeggings"> <span>Jeans & Jeggings</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Trousers & Capris"> <span>Trousers & Capris</span> </a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <ul class="unicode-menu-element unicode-megamenu-list">
                                                                                        <li class="menu-item"> <a class="nav-link" href="#" title="Fusion Wear"><span>Fusion Wear</span></a>
                                                                                            <ul class="unicode-sub-megamenu">
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Sweaters & Sweatshirts"> <span>Sweaters & Sweatshirts</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Coats & Blazers"> <span>Coats & Blazers</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Jackets & Waistcoats"> <span>Jackets & Waistcoats</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Shorts & Skirts"> <span>Shorts & Skirts</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Camisoles & Slips"> <span>Camisoles & Slips</span> </a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <ul class="unicode-menu-element unicode-megamenu-list">
                                                                                        <li class="menu-item">
                                                                                            <a class="nav-link" href="#" title="Sports & Active Wear"> <span>Sports & Active Wear</span> </a>
                                                                                            <ul class="unicode-sub-megamenu">
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Clothing"> <span>Clothing</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Footwear"> <span>Footwear</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="T-Shirts"> <span>T-Shirts</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Sports Accessories"> <span>Sports Accessories</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Sports Equipment"> <span>Sports Equipment</span> </a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <ul class="unicode-menu-element unicode-megamenu-list">
                                                                                        <li class="menu-item">
                                                                                            <a class="nav-link" href="#" title="Lingerie & Sleepwear"> <span>Lingerie & Sleepwear</span> </a>
                                                                                            <ul class="unicode-sub-megamenu">
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Bras & Lingerie Sets"> <span>Bras & Lingerie Sets</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Briefs"> <span>Briefs</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Shapewear"> <span>Shapewear</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Sleepwear & Loungewear"> <span>Sleepwear & Loungewear</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Camisoles & Thermals"> <span>Camisoles & Thermals</span> </a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="menu-item-has-children unicode-megamenu-dropdown unicode-megamenu-item-full-width">
                                                                    <a href="#">Men's Fashion</a>
                                                                    <div class="unicode-megamenu-wrapper">
                                                                        <div class="unicode-megamenu-holder">
                                                                            <div class="row row-cols-3">
                                                                                <div class="col">
                                                                                    <ul class="unicode-menu-element unicode-megamenu-list">
                                                                                        <li class="menu-item">
                                                                                            <a class="nav-link" href="#" title="Top wear"> <span>Top Clothing</span></a>
                                                                                            <ul class="unicode-sub-megamenu">
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Tops"> <span>Tops</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="T-Shirts"> <span>T-Shirts</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Shirts"> <span>Shirts</span></a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Jeans & Jeggings"> <span>Jeans & Jeggings</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Trousers & Capris"> <span>Trousers & Capris</span> </a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <ul class="unicode-menu-element unicode-megamenu-list">
                                                                                        <li class="menu-item"> <a class="nav-link" href="#" title="Fusion Wear"><span>Fusion Wear</span></a>
                                                                                            <ul class="unicode-sub-megamenu">
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Sweaters & Sweatshirts"> <span>Sweaters & Sweatshirts</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Coats & Blazers"> <span>Coats & Blazers</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Jackets & Waistcoats"> <span>Jackets & Waistcoats</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Shorts & Skirts"> <span>Shorts & Skirts</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Camisoles & Slips"> <span>Camisoles & Slips</span> </a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <ul class="unicode-menu-element unicode-megamenu-list">
                                                                                        <li class="menu-item">
                                                                                            <a class="nav-link" href="#" title="Sports & Active Wear"> <span>Sports & Active Wear</span> </a>
                                                                                            <ul class="unicode-sub-megamenu">
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Clothing"> <span>Clothing</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Footwear"> <span>Footwear</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="T-Shirts"> <span>T-Shirts</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Sports Accessories"> <span>Sports Accessories</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Sports Equipment"> <span>Sports Equipment</span> </a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <ul class="unicode-menu-element unicode-megamenu-list">
                                                                                        <li class="menu-item">
                                                                                            <a class="nav-link" href="#" title="Lingerie & Sleepwear"> <span>Lingerie & Sleepwear</span> </a>
                                                                                            <ul class="unicode-sub-megamenu">
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Bras & Lingerie Sets"> <span>Bras & Lingerie Sets</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Briefs"> <span>Briefs</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Shapewear"> <span>Shapewear</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Sleepwear & Loungewear"> <span>Sleepwear & Loungewear</span> </a>
                                                                                                </li>
                                                                                                <li class="menu-item">
                                                                                                    <a class="nav-link" href="#" title="Camisoles & Thermals"> <span>Camisoles & Thermals</span> </a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <img src="/public/theme/assets/images/banner/13.png" alt="">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="menu-item-has-children"><a href="#">Phones & Telecommunications</a></li>
                                                                <li class="menu-item-has-children"><a href="#">Computer, Office & Security</a></li>
                                                                <li class="menu-item-has-children"><a href="#">Consumer Electronics</a></li>
                                                                <li class="menu-item-has-children"><a href="#">Jewelry & Watches</a></li>
                                                                <li class="menu-item-has-children"><a href="#">Home, Pet & Appliances</a></li>
                                                                <li class="menu-item-has-children"><a href="#">Bags & Shoes</a></li>
                                                                <li class="menu-item-has-children"><a href="#">Toys , Kids & Babies</a></li>
                                                                <li class="menu-item-has-children"><a href="#">Outdoor Fun & Sports</a></li>
                                                                <li class="menu-item-has-children"><a href="#">Beauty, Health & Hair</a></li>
                                                                <li class="menu-item-has-children"><a href="#">Home Improvement & Tools</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </nav>
                                </div>
                                <a class="navbar-brand" href="#"><img class="nav-logo" src="/images/logo_ngang.png" alt="Beauty Story"></a>
                            </div>
                        </div>
                        <div class="col-xxl-3 col-xl-4 col-lg-3 col-6 order-lg-3">
                            <div class="margin-right-1 d-flex align-items-center justify-content-end h-100 md-py-10">
                                <%--<div class="sign-in position-relative font-general my-account-dropdown">
                                    <a href="my-account.html" class="has-dropdown d-flex align-items-center text-dark text-decoration-none" title="My Account">
                                        <i class="flaticon-user-3 flat-small me-1"></i>
                                    </a>
                                    <ul class="my-account-popup">
                                        <li><a href="my-account.html"><span class="menu-item-text">My Account</span></a></li>
                                        <li><a href="checkout.html"><span class="menu-item-text">Checkout</span></a></li>
                                        <li><a href="wishlist.html"><span class="menu-item-text">Wishlist</span></a></li>
                                    </ul>
                                </div>
                                <div class="wishlist-view">
                                    <a href="wishlist.html" class="position-relative top-quantity d-flex align-items-center text-white text-decoration-none" title="Wishlist">
                                        <i class="flaticon-like flat-small text-dark"></i>
                                    </a>
                                </div>--%>
                                <%--<div class="refresh-view">
                                    <a href="compare.html" class="position-relative top-quantity d-flex align-items-center text-dark text-decoration-none">
                                        <i class="flaticon-shuffle flat-small text-dark"></i>
                                    </a>
                                </div>--%>
                                <div class="header-cart-4">
                                    <a href="<%= ResolveUrl("~/gio-hang/default.aspx") %>" class="cart has-cart-data" title="Giỏ hàng">
                                        <div class="cart-icon"><i class="flaticon-shopping-cart flat-small"></i> <span class="header-cart-count"><asp:Literal ID="CartCountLiteralSticky" runat="server" /></span></div>
                                        <div class="cart-wrap">
                                            <div class="cart-text">Giỏ hàng</div>
                                            <span class="header-cart-count">(<asp:Literal ID="CartCountTextLiteralSticky" runat="server" />) sản phẩm</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-7 col-xl-6 col-lg-6 col-12 order-lg-2">
                            <div class="product-search-one">
                                <div class="form-inline search-pill-shape search-box">
                                        <input type="text" class="form-control search-field js-search-input" name="q" placeholder="T&#236;m s&#7843;n ph&#7849;m, th&#432;&#417;ng hi&#7879;u b&#7841;n mong mu&#7889;n...">
                                        <button type="button" class="search-submit"><i class="flaticon-search flat-mini text-white"></i></button>
                                        <div class="search-suggest"></div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
















