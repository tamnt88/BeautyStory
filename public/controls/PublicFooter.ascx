<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PublicFooter.ascx.cs" Inherits="PublicFooter" %>

<div class="full-row bg-dark p-0">
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
                        <div class="text-primary font-500 h4">(090) 8001-8588, (090) 874 548</div>
                        <div class="text-general font-500 mt-20">Beauty Story, Ho Chi Minh City, Vietnam</div>
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
                    <h6 class="widget-title mb-4">Services</h6>
                    <ul>
                        <li><a href="#">Assembly Guides</a></li>
                        <li><a href="#">Furniture Packages and Fitouts</a></li>
                        <li><a href="#">Trade Programme</a></li>
                        <li><a href="#">Sale</a></li>
                        <li><a href="#">New Designs</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="footer-widget category-widget mb-5">
                    <h6 class="widget-title mb-4 xs-mx-none">Pages</h6>
                    <ul>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Support</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Compare</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-6">
                <div class="footer-widget widget-nav mb-5">
                    <h6 class="widget-title mb-4">Support</h6>
                    <ul>
                        <li><a href="#">My Account</a></li>
                        <li><a href="#">Track your Order</a></li>
                        <li><a href="#">Customer Service</a></li>
                        <li><a href="#">Returns/Exchange</a></li>
                        <li><a href="#">Product Support</a></li>
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
                <span class="text-white font-500 sm-mb-10 d-block">(c) 2025 Beauty Story. All rights reserved.</span>
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
