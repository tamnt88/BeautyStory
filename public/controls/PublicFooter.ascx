<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PublicFooter.ascx.cs" Inherits="PublicFooter" %>

<%--<div class="full-row bg-dark p-0">
    <div class="container py-50 border-white border-2 border-bottom">
        <div class="row align-items-center">
            <div class="col-md-4">
                <div class="d-flex align-items-center border-2 border-end border-gray pr-50">
                    <i class="flaticon-email flat-large text-primary mr-20"></i>
                    <div class="h5 text-white mb-0">Join now and get 10% off your next purchase!</div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="row align-items-center">
                    <div class="col-md-4">
                        <div class="sm-my-30 font-400 h6 text-white">Subscribe to the weekly newsletter for all the latest updates</div>
                    </div>
                    <div class="col-md-8">
                        <form action="#" class="subscribe-form position-relative">
                            <input class="form-control bg-white" type="text" placeholder="Your email address" aria-label="Address" />
                            <button class="btn btn-primary" type="submit">SUBMIT</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>

<div class="footer-benefits">
    <div class="container">
        <div class="row g-3 align-items-center">
            <div class="col-lg-2 col-md-4 col-6">
                <div class="benefit-item">
                    <img src="<%= ResolveUrl("~/public/assets/icon/1.png") %>" alt="Thanh toán" />
                    <div>Thanh toán<br />khi nhận hàng</div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-6">
                <div class="benefit-item">
                    <img src="<%= ResolveUrl("~/public/assets/icon/2.png") %>" alt="Giao nhanh" />
                    <div>Giao nhanh<br />miễn phí 2H</div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-6">
                <div class="benefit-item">
                    <img src="<%= ResolveUrl("~/public/assets/icon/3.png") %>" alt="Đổi trả" />
                    <div>30 ngày đổi<br />trả miễn phí</div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-6">
                <div class="benefit-item">
                    <img src="<%= ResolveUrl("~/public/assets/icon/4.png") %>" alt="Thương hiệu" />
                    <div>Thương hiệu<br />uy tín toàn cầu</div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-6">
                <div class="benefit-action">
                    <div class="benefit-label"><i class="fa-solid fa-circle-question"></i> Hotline CSKH</div>
                    <a class="benefit-button" href="tel:0828 409 096">0828 409 096</a>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-6">
                <div class="benefit-action">
                    <div class="benefit-label"><i class="fa-solid fa-location-dot"></i> Tìm chi nhánh</div>
                    <a class="benefit-button" href="#">Hệ thống Beauty Story</a>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="full-row bg-dark">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="footer-widget mb-5">
                    <div class="footer-logo mb-4">
                        <a href="<%= ResolveUrl("~/") %>"><img src="<%= ResolveUrl("~/images/logo_doc.png") %>" alt="Beauty Story" /></a>
                    </div>
                    <div class="widget-ecommerce-contact">
                        <span class="font-medium font-500 text-primary">Got Questions? Call us 24/7</span>
                        <div class="text-primary font-500 h4">0909 221 558</div>
                        <div class="text-general font-500 mt-20">143 đường số 32-CL, Phường Cát Lái, TP Hồ Chí Minh, Việt Nam</div>
                    </div>
                </div>
                <div class="footer-widget media-widget mb-5">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="footer-widget category-widget mb-5">
                    <h6 class="widget-title mb-4">Dịch vụ</h6>
                    <ul>
                        <li><a href="#">Hướng dẫn lắp ráp</a></li>
                        <li><a href="#">Gói nội thất</a></li>
                        <li><a href="#">Chương trình thương mại</a></li>
                        <li><a href="#">Doanh thu</a></li>
                        <li><a href="#">Thiết kế mới</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="footer-widget category-widget mb-5">
                    <h6 class="widget-title mb-4 xs-mx-none">Trang website</h6>
                    <ul>
                        <li><a href="#">Về chúng tôi</a></li>
                        <li><a href="#">Hỗ trợ</a></li>
                        <li><a href="#">Liên hệ</a></li>
                        <li><a href="#">So sánh</a></li>
                        <li><a href="#">Câu hỏi thường gặp</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-6">
                <div class="footer-widget widget-nav mb-5">
                    <h6 class="widget-title mb-4">Hỗ trợ</h6>
                    <ul>
                        <li><a href="#">Tài khoản của tôi</a></li>
                        <li><a href="#">Theo dõi đơn hàng của bạn</a></li>
                        <li><a href="#">Dịch vụ khách hàng</a></li>
                        <li><a href="#">Trả hàng/Đổi hàng</a></li>
                        <li><a href="#">Hỗ trợ sản phẩm</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>

<div class="full-row copyright py-3" style="background-color: #101112;">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <span class="text-white font-500 sm-mb-10 d-block">Copyright (c) 2025 Beauty Story. All rights reserved.</span>
            </div>
            <div class="col-md-6">
                <ul class="list-ml-30 d-flex align-items-center justify-content-md-end">
                    <li>
                        <a href="#"><img src="<%= ResolveUrl("~/public/theme/assets/images/cards/1.png") %>" alt="" /></a>
                    </li>
                    <li>
                        <a href="#"><img src="<%= ResolveUrl("~/public/theme/assets/images/cards/2.png") %>" alt="" /></a>
                    </li>
                    <li>
                        <a href="#"><img src="<%= ResolveUrl("~/public/theme/assets/images/cards/3.png") %>" alt="" /></a>
                    </li>
                    <li>
                        <a href="#"><img src="<%= ResolveUrl("~/public/theme/assets/images/cards/4.png") %>" alt="" /></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<a href="#" class="bg-primary text-white" id="scroll"><i class="fa fa-angle-up"></i></a>
