<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BannerHomePage.ascx.cs" Inherits="public_controls_trang_chu_BannerHomePage" %>
<!--==================== Slider Section End ====================-->
<div class="full-row p-0 bg-light">
    <div id="slider" style="width:1200px; height:650px; margin:0 auto; margin-bottom:0px;">
        <asp:Repeater ID="BannerRepeater" runat="server">
            <ItemTemplate>
                <div class="ls-slide" data-ls="duration:8000; transition2d:4; kenburnsscale:1.2;">
                    <img width="1920" height="750" src='<%# Eval("ImageUrl") %>' class="ls-bg" alt="" style="top:50%; left:50%; text-align:initial; font-weight:400; font-style:normal; text-decoration:none; mix-blend-mode:normal; width:100%;" data-ls="showinfo:1; durationin:2000; easingin:easeOutExpo; scalexin:1.5; scaleyin:1.5; position:fixed;">

                    <p style="width:450px; font-size:80px; line-height:60px; top:40%; left:100px; white-space:normal;" class="ls-l higlight-font font-700 ls-hide-phone text-dark" data-ls="offsetyin:150; durationin:700; delayin:500; easingin:easeOutQuint; rotatexin:20; scalexin:1.4; offsetyout:600; durationout:400; parallaxlevel:0;">
                        <%# Eval("TitleLine2") %>
                    </p>
                    <p style="font-size:14px; letter-spacing: 2px; line-height:20px; top:28%; left:100px;" class="ls-l ordenery-font text-dark text-uppercase font-700 ls-hide-phone" data-ls="offsetyin:150; durationin:700; easingin:easeOutQuint; rotatexin:20; scalexin:1.4; offsetyout:600; durationout:400; parallaxlevel:0;"><%# Eval("TitleLine1") %></p>

                    <p style="width:580px; font-weight:600; font-size:15px; line-height:30px; top:58%; left:120px; white-space:normal;" class="ls-l ls-hide-phone text-dark ordenery-font text-uppercase" data-ls="offsetxin:150; durationin:700; easingin:easeOutBack; rotatexin:20; scalexin:1; offsetyout:600; durationout:400; parallaxlevel:0; delayin:900;"><%# Eval("TitleLine3") %></p>

                    <div style="width:3px; height:60px; border-radius:0; top:58%; left:100px;" class="ls-l ls-hide-phone bg-primary" data-ls="offsetxin:100; easingin:easeOutBack; delayin:700; durationout:400; offsetxout:-20; parallax:false; parallaxlevel:1;"></div>

                    <asp:PlaceHolder ID="LinkWrap" runat="server" Visible='<%# (bool)Eval("ShowLink") %>'>
                        <a class="ls-l ls-hide-phone" href='<%# Eval("LinkUrl") %>' target="_self" data-ls="offsetyin:150; durationin:700; delayin:1200; easingin:easeOutQuint; rotatexin:20; scalexin:1.4; offsetyout:600; durationout:400; hover:true; hoveropacity:1; hoverbgcolor:#e74c3c ; parallaxlevel:0;">
                            <p style="cursor:pointer;padding-top:8px; padding-bottom:8px; font-weight: 500; font-size:14px; top:72%; left:100px; padding-right:25px; padding-left:25px; line-height:28px;" class="bg-dark text-white"><%# Eval("LinkText") %></p>
                        </a>
                    </asp:PlaceHolder>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<!--==================== Slider Section End ====================-->
