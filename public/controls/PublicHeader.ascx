<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PublicHeader.ascx.cs" Inherits="PublicHeader" %>



<header class="ecommerce-header">

    <div class="top-header d-none d-lg-block py-2 bg-light border-0 font-normal">

        <div class="container">

            <div class="row align-items-center">

                <div class="col-lg-4 sm-mx-none">

                    <div class="d-flex align-items-center">

                        <a href="#" class="text-general"><span><i class="fa-solid fa-location-dot"></i>&nbsp;143 &#272;&#432;&#7901;ng s&#7889; 32-CL, Ph&#432;&#7901;ng C&#225;t L&#225;i, TP H&#7891; Ch&#237; Minh, Vi&#7879;t Nam</span></a>

                    </div>

                </div>

                <div class="col-lg-8 d-flex">

                    <ul class="top-links d-flex ms-auto align-items-center">

                        <li><a href="tel:0828409096"><i class="fa-solid fa-phone"></i>&nbsp;Hotline: 0828 409 096</a></li>

                        <li><a href="mailto:beautystory0909@gmail.com"><i class="fa-solid fa-envelope"></i>&nbsp;beautystory0909@gmail.com</a></li>

                        <li><a href="<%= ResolveUrl("~/tra-cuu-don-hang") %>" title="Tra c&#7913;u &#273;&#417;n h&#224;ng"><i class="fa-solid fa-receipt"></i>&nbsp;Tra c&#7913;u &#273;&#417;n h&#224;ng</a></li>

                    </ul>

                </div>

            </div>

        </div>

    </div>

    <div class="main-nav bg-white d-none d-lg-block">

        <div class="container">

            <div class="row align-items-center">

                <div class="col-xl-8 col-md-9">

                    <nav class="navbar navbar-expand-lg nav-general nav-primary-hover">

                        <a class="navbar-brand mobile-logo" href="/"><img class="nav-logo" src="/images/logo_ngang.png" alt="Beauty Story"></a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">

                            <i class="flaticon-menu-2 flat-small text-primary"></i>

                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">

                            <div class="category-bar header-category-bar">

                                <div class="category-toggle">

                                    <i class="fas fa-bars"></i>

                                    <span>Danh m&#7909;c</span>

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

                                                                                        <a class="nav-link dropdown-toggle" href="/danh-muc/<%# Eval("SeoSlug") %>"><%# Eval("CategoryName") %></a>

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

                                <li class="nav-item"><a class="nav-link" href="/thuong-hieu">Th&#432;&#417;ng hi&#7879;u</a></li>

                                <li class="nav-item"><a class="nav-link" href="/">H&#224;ng m&#7899;i v&#7873;</a></li>

                                <li class="nav-item"><a class="nav-link" href="/">B&#225;n ch&#7841;y</a></li>

                                <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="blog-grid-left-sidebar.html">Blog</a>
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

                                <li class="nav-item"><a class="nav-link" href="/">Li&#234;n h&#7879;</a></li>

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

                        <div class="header-cart-4">

                            <a href="<%= ResolveUrl("~/gio-hang") %>" class="cart has-cart-data" title="Gi&#7887; h&#224;ng">

                                <div class="cart-icon"><i class="flaticon-shopping-cart flat-small"></i> <span class="header-cart-count"><asp:Literal ID="CartCountLiteral" runat="server" /></span></div>

                                <div class="cart-wrap">

                                    <div class="cart-text">Gi&#7887; h&#224;ng</div>

                                    <span class="header-cart-count">(<asp:Literal ID="CartCountTextLiteral" runat="server" />) s&#7843;n ph&#7849;m</span>

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

                                        <a href="/admin" class="d-flex align-items-center text-white">

                                            <i class="flaticon-user flat-small me-1"></i>

                                            <span>&#272;&#259;ng nh&#7853;p / &#272;&#259;ng k&#253;</span>

                                        </a>

                                        <span class="slide-nav-close"><i class="flaticon-cancel flat-mini text-white"></i></span>

                                    </div>

                                    <div class="menu-and-category">

                                        <ul class="nav nav-pills wc-tabs" id="menu-and-category" role="tablist">
                                            <li class="nav-item" role="presentation">

                                                <a class="nav-link active" id="pills-push-categories-tab" data-bs-toggle="pill" href="#pills-push-categories" role="tab" aria-controls="pills-push-categories" aria-selected="true">Danh mục</a>

                                            </li>


                                            <li class="nav-item" role="presentation">

                                                <a class="nav-link" id="pills-push-menu-tab" data-bs-toggle="pill" href="#pills-push-menu" role="tab" aria-controls="pills-push-menu" aria-selected="true">Menu</a>

                                            </li>

                                            

                                        </ul>

                                        <div class="tab-content" id="menu-and-categoryContent">

                                            <div class="tab-pane fade" id="pills-push-menu" role="tabpanel" aria-labelledby="pills-push-menu-tab">

                                                <div class="push-navbar">

                                                    <ul class="navbar-nav">

                                                        <li class="nav-item"><a class="nav-link" href="/thuong-hieu">Th&#432;&#417;ng hi&#7879;u</a></li>

                                                        <li class="nav-item"><a class="nav-link" href="/">H&#224;ng m&#7899;i v&#7873;</a></li>

                                                        <li class="nav-item"><a class="nav-link" href="/">B&#225;n ch&#7841;y</a></li>

                                                       <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="blog-grid-left-sidebar.html">Blog</a>
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

                                                        <li class="nav-item"><a class="nav-link" href="/">Li&#234;n h&#7879;</a></li>

                                                    </ul>

                                                </div>

                                            </div>

                                            <div class="tab-pane fade show active woocommerce-Tabs-panel woocommerce-Tabs-panel--description" id="pills-push-categories" role="tabpanel" aria-labelledby="pills-push-categories-tab">

                                                <div class="push-navbar">

                                                    <ul class="navbar-nav">

                                                        <asp:Repeater ID="MobileCategoryRepeater" runat="server">

                                                            <ItemTemplate>

                                                                <li class="dropdown menu-item-has-children">

                                                                    <a class="nav-link dropdown-toggle" href="/danh-muc/<%# Eval("SeoSlug") %>"><%# Eval("CategoryName") %></a>

                                                                    <ul class="dropdown-menu">

                                                                        <asp:Repeater ID="MobileChildRepeater" runat="server" DataSource='<%# Eval("Children") %>'>

                                                                            <ItemTemplate>

                                                                                <li class="dropdown menu-item-has-children">

                                                                                    <a class="dropdown-item dropdown-toggle" href="/danh-muc/<%# Eval("SeoSlug") %>"><%# Eval("CategoryName") %></a>

                                                                                    <ul class="dropdown-menu">

                                                                                        <asp:Repeater ID="MobileGrandChildRepeater" runat="server" DataSource='<%# Eval("Children") %>'>

                                                                                            <ItemTemplate>

                                                                                                <li>

                                                                                                    <a class="dropdown-item" href="/danh-muc/<%# Eval("SeoSlug") %>"><%# Eval("CategoryName") %></a>

                                                                                                </li>

                                                                                            </ItemTemplate>

                                                                                        </asp:Repeater>

                                                                                    </ul>

                                                                                </li>

                                                                            </ItemTemplate>

                                                                        </asp:Repeater>

                                                                    </ul>

                                                                </li>

                                                            </ItemTemplate>

                                                        </asp:Repeater>

                                                    </ul>

                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </nav>

                        </div>

                        <a class="navbar-brand mobile-logo" href="/"><img class="nav-logo" src="/images/logo_ngang.png" alt="Beauty Story"></a>

                    </div>

                </div>

                <div class="col-xxl-8 col-xl-8 col-lg-6 order-lg-2">

                    <div class="product-search-one flex-grow-1 global-search py-10 px-15 w-100">

                        <div class="form-inline search-pill-shape search-box">

                            <input type="text" class="form-control search-field js-search-input" name="q" placeholder="T&#236;m s&#7843;n ph&#7849;m, th&#432;&#417;ng hi&#7879;u b&#7841;n mong mu&#7889;n...">

                            <button type="button" class="search-submit"><i class="flaticon-search flat-mini text-white"></i></button>

                            <div class="search-suggest"></div>

                        </div>

                    </div>

                </div>

                <div class="col-xxl-2 col-xl-2 col-lg-3 col-6 order-lg-3">

                    <div class="header-cart-4 d-flex justify-content-end">

                        <a href="<%= ResolveUrl("~/gio-hang") %>" class="cart has-cart-data" title="Gi&#7887; h&#224;ng">

                            <div class="cart-icon"><i class="flaticon-shopping-cart flat-small"></i> <span class="header-cart-count"><asp:Literal ID="CartCountTextLiteralMobile" runat="server" /></span></div>

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</header>

