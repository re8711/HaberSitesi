<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HaberSitesiBireysel1.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="preloader-area" id="preloader">
        <div id="loader"></div>
    </div>

    <div class="switch-theme-mode">
        <label id="switch" class="switch">
            <input type="checkbox" onchange="toggleTheme()" id="slider">
            <span class="slider round"></span>
        </label>
    </div>

    <div class="cursor"></div>
    <div class="cursor-inner"></div>

    <div class="modal fade searchModal" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <input type="text" class="form-control" placeholder="Haber ara....">
                    <button type="submit"><i class="ri-search-2-line"></i></button>
                </form>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="ri-close-large-line"></i></button>
            </div>
        </div>
    </div>

    <div class="sidebar-menu offcanvas offcanvas-end border-0" data-bs-backdrop="static" tabindex="-1" id="sidebarOffcanvas">
        <button type="button" class="close-btn bg-transparent p-0 border-0" data-bs-dismiss="offcanvas" aria-label="Close">
            <i class="ri-close-large-line"></i>
        </button>
        <div class="offcanvas-body">
            <div class="sidebar-header">
                <a href="Default.aspx" class="logo d-block">
                    <img src="assets/img/logo-white.png" alt="Logo">
                </a>
                <p class="text-offwhite mb-0 fw-light">En güncel haberler ve son dakika gelişmeleri.</p>
            </div>
            
            <div class="thumb-news-wrapper mb-30">
                <h5 class="fs-22 ls-3 fw-semibold text-white lh-1 mb-35">Öne Çıkanlar</h5>
                
                <asp:Repeater ID="rptSidebar" runat="server">
                    <ItemTemplate>
                        <div class="thumbnail-news-card style-one d-flex flex-wrap align-items-md-center align-items-start mb-25">
                            <div class="news-img rounded-circle">
                                <img src='<%# Eval("ResimYolu") %>' alt="News" class="rounded-circle">
                            </div>
                            <div class="news-info">
                                <ul class="news-metainfo style-four list-unstyle">
                                    <li><i class="ri-time-line"></i><%# Eval("EklenmeTarihi", "{0:dd MMM}") %></li>
                                    <li><a href="#"><%# Eval("KategoriAdi") %></a></li>
                                </ul>
                                <h3 class="fs-22 fw-semibold ls-3 mb-0">
                                    <a href='<%# "HaberDetay.aspx?id=" + Eval("HaberID") %>' class="hover-anim-white text-white">
                                        <%# Eval("Baslik") %>
                                    </a>
                                </h3>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
            <div class="sidebar-footer">
                <h3 class="fs-22 ls-3 text-white mb-20">İletişim</h3>
                <ul class="social-profile list-unstyle">
                    <li><a href="#" class="d-flex flex-column align-items-center justify-content-center rounded-circle"><img src="assets/img/icons/facebook.svg" alt="Facebook"></a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="bg-optional">
        <div class="hero-wrap style-one pt-70 pb-70">
            <div class="container">
                <div class="row">
                    
                    <div class="col-xl-8">
                        <asp:Repeater ID="rptManset" runat="server">
                            <ItemTemplate>
                                <div class="news-card style-one position-relative index-1 round-5 mb-30">
                                    <div class="circle-text-wrap position-absolute d-flex flex-column align-items-center justify-content-center rounded-circle bg-white">
                                        <img src="assets/img/hero/circle-text.png" alt="Fire" class="circle-text">
                                        <img src="assets/img/hero/fire.png" alt="Fire" class="center-img position-absolute">
                                    </div>
                                    <img src='<%# Eval("ResimYolu") %>' alt="News" class="round-5" style="width:100%;">
                                    <div class="news-info">
                                        <ul class="news-metainfo style-one list-unstyle d-inline-block">
                                            <li><i class="ri-time-line"></i><%# Eval("EklenmeTarihi", "{0:dd.MM.yyyy}") %></li>
                                            <li><a href="#"><%# Eval("KategoriAdi") %></a></li>
                                        </ul>
                                        <h1 class="ls-2">
                                            <a href='<%# "HaberDetay.aspx?id=" + Eval("HaberID") %>'>
                                                <span><%# Eval("Baslik") %></span> 
                                            </a>
                                        </h1>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div class="col-xl-4 pe-xl-1">
                        <div class="thumb-news-wrapper mb-30">
                            <h5 class="section-subtitle fw-semibold lh-1">Son Haberler</h5>
                            
                            <asp:Repeater ID="rptSonHaberler" runat="server">
                                <ItemTemplate>
                                    <div class="thumbnail-news-card style-one d-flex flex-wrap align-items-md-center align-items-start mb-25">
                                        <div class="news-img rounded-circle">
                                            <img src='<%# Eval("ResimYolu") %>' alt="News" class="rounded-circle">
                                        </div>
                                        <div class="news-info">
                                            <ul class="news-metainfo list-unstyle">
                                                <li><i class="ri-time-line"></i><%# Eval("EklenmeTarihi", "{0:HH:mm}") %></li>
                                                <li><a href="#"><%# Eval("KategoriAdi") %></a></li>
                                            </ul>
                                            <h3 class="fs-22 fw-semibold ls-3 mb-0">
                                                <a href='<%# "HaberDetay.aspx?id=" + Eval("HaberID") %>' class="hover-anim-blue">
                                                    <%# Eval("Baslik") %>
                                                </a>
                                            </h3>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container pb-70">
            <div class="row align-items-center mb-25">
                <div class="col-md-6 mb-sm-15">
                    <h5 class="section-subtitle fw-semibold mb-0">Gündem</h5>
                </div>
            </div>
            <div class="row justify-content-center">
                
                <asp:Repeater ID="rptGundem" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-4 col-md-6">
                            <div class="news-card style-two mb-30">
                                <div class="hover-anim-img mb-15 round-6 overflow-hidden">
                                    <img src='<%# Eval("ResimYolu") %>' alt="News" class="round-6 transition" style="width:100%; height:250px; object-fit:cover;">
                                </div>
                                <div class="news-info">
                                    <ul class="news-metainfo list-unstyle mb-9">
                                        <li><i class="ri-time-line"></i><%# Eval("EklenmeTarihi", "{0:dd.MM.yyyy}") %></li>
                                        <li><a href="#"><%# Eval("KategoriAdi") %></a></li>
                                    </ul>
                                    <h3 class="fs-22 ls-3 xmb-4">
                                        <a href='<%# "HaberDetay.aspx?id=" + Eval("HaberID") %>' class="hover-anim-blue">
                                            <%# Eval("Baslik") %>
                                        </a>
                                    </h3>
                                    <p><%# Eval("Ozet") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>

    <div class="container pt-100 pb-50">
        <div class="row align-items-center mb-40">
            <div class="col-xl-5 col-lg-4 mb-lg-20">
                <h2 class="section-title mb-0">Haber Akışı</h2>
            </div>
            <div class="col-xl-7 col-lg-8">
                <ul class="nav nav-tabs news-tablist border-0 d-flex justify-content-lg-end" role="tablist">
                    <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tab_1" type="button" role="tab">Tümü</button>
                    </li>
                </ul>
            </div>
        </div>
        <div class="tab-content product-tab-content">
            <div class="tab-pane fade show active" id="tab_1" role="tabpanel">
                <div class="row justify-content-center">
                    
                    <asp:Repeater ID="rptHaberAkisi" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6">
                                <div class="news-card mb-50">
                                    <div class="hover-anim-img round-6 overflow-hidden mb-30">
                                        <a href='<%# "HaberDetay.aspx?id=" + Eval("HaberID") %>'>
                                            <img src='<%# Eval("ResimYolu") %>' alt="News" class="round-6 transition" 
                                                 style="width: 100%; height: 300px; object-fit: cover; border-radius: 6px !important;">
                                        </a>
                                    </div>
                                    <div class="news-info text-center">
                                        <ul class="news-metainfo list-unstyle mb-15">
                                            <li><i class="ri-time-line"></i><%# Eval("EklenmeTarihi", "{0:dd MMM yyyy}") %></li>
                                            <li><i class="ri-eye-line"></i> <%# Eval("OkunmaSayisi") %> Görüntülenme</li>
                                            <li><a href="#"><%# Eval("KategoriAdi") %></a></li>
                                        </ul>
                                        <h3 class="fs-36 fw-semibold ls-3 mb-22">
                                            <a href='<%# "HaberDetay.aspx?id=" + Eval("HaberID") %>' class="hover-anim-blue">
                                                <%# Eval("Baslik") %>
                                            </a>
                                        </h3>
                                        <a href='<%# "HaberDetay.aspx?id=" + Eval("HaberID") %>' class="btn style-two fw-semibold">Devamını Oku<img src="assets/img/icons/long-arrow-blue-2.svg" alt="Arrow"></a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="subscribe-box style-one position-relative index-1">
            <div class="row justify-content-center">
                <div class="col-lg-4">
                    <div class="subscribe-img">
                        <img src="assets/img/subscribe.jpg" alt="Image">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="subscribe-content">
                        <h3 class="fs-26 fw-medium text-white ls-5 xmb-5">Bültene Abone Ol</h3>
                        <p class="text-white fw-light mb-25">En yeni haberler ilk sizde olsun.</p>
                        <form action="#" class="subscribe-form position-relative">
                            <input type="email" placeholder="Email adresiniz" class="w-100">
                            <button class="btn style-three fw-semibold">Abone Ol <img src="assets/img/icons/long-arrow-black.svg" alt="Arrow"></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container pt-100 pb-70">
        <h2 class="section-title text-center mb-40">Ana Başlıklar</h2>
        <div class="main-topics-wrap d-flex flex-wrap justify-content-between overflow-hidden">
            <div class="news-card-wrap">
                <div class="row justify-content-center">
                    
                    <asp:Repeater ID="rptAnaBasliklar" runat="server">
                        <ItemTemplate>
                            <div class="col-xxl-3 col-xl-4 col-md-6">
                                <div class="news-card mb-28">
                                    <div class="hover-anim-img position-relative mb-18 round-6 overflow-hidden">
                                        <img src='<%# Eval("ResimYolu") %>' alt="News" class="round-6 transition" style="width:100%; height:200px; object-fit:cover;">
                                        <a href="#" class="fs-14 ls-2 news-category bg_primary text-white d-inline-block position-absolute">
                                            <%# Eval("KategoriAdi") %>
                                        </a>
                                    </div>
                                    <div class="news-info">
                                        <ul class="news-metainfo list-unstyle mb-15">
                                            <li><i class="ri-time-line"></i><%# Eval("EklenmeTarihi", "{0:HH:mm}") %></li>
                                            <li><i class="ri-eye-line"></i> <%# Eval("OkunmaSayisi") %></li>
                                        </ul>
                                        <h3 class="fs-22 ls-3 mb-0">
                                            <a href='<%# "HaberDetay.aspx?id=" + Eval("HaberID") %>' class="hover-anim-blue">
                                                <%# Eval("Baslik") %>
                                            </a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
    </div>

    <div id="progress-wrap" class="progress-wrap">
        <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
            <path id="progress-path" d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"/>
        </svg>
    </div>

    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/swiper-bundle.min.js"></script>
    <script src="assets/js/popup-video.js"></script>
    <script src="assets/js/aos.js"></script>
    <script src="assets/js/main.js"></script>

</asp:Content>