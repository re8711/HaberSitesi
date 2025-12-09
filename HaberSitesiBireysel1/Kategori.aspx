<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Kategori.aspx.cs" Inherits="HaberSitesiBireysel1.Sayfalar.Kategori" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/swiper-bundle.min.css">
    <link rel="stylesheet" href="/assets/css/animate.min.css">
    <link rel="stylesheet" href="/assets/css/remixicon.css">
    <link rel="stylesheet" href="/assets/css/header.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/footer.css">
    <link rel="stylesheet" href="/assets/css/responsive.css">
    <link rel="stylesheet" href="/assets/css/dark-theme.css">

    <title>Haber Sitesi - Kategori</title>
    <link rel="icon" type="image/png" href="/assets/img/favicon.png">
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

    <div class="container pt-100 pb-100">
        <div class="row justify-content-center">
            
            <asp:Repeater ID="rptKategoriHaberleri" runat="server">
                <ItemTemplate>
                    <div class="col-xl-4 col-md-6">
                        <div class="news-card mb-50">
                            <div class="hover-anim-img round-6 overflow-hidden mb-28">
                                <img src='<%# Eval("ResimYolu") %>' alt="News" class="round-6 transition" style="width:100%; height:250px; object-fit:cover;">
                            </div>
                            <div class="news-info">
                                <ul class="news-metainfo list-unstyle mb-12">
                                    <li><i class="ri-time-line"></i><%# Eval("EklenmeTarihi", "{0:dd.MM.yyyy}") %></li>
                                    <li><i class="ri-eye-line"></i> <%# Eval("OkunmaSayisi") %> Görüntülenme</li>
                                    </ul>
                                <h3 class="fs-30 fw-semibold ls-3 mb-13">
                                    <a href='HaberDetay.aspx?id=<%# Eval("HaberID") %>' class="hover-anim-blue">
                                        <%# Eval("Baslik") %>
                                    </a>
                                </h3>
                                <p class="mb-22"><%# Eval("Ozet") %></p>
                                <a href='HaberDetay.aspx?id=<%# Eval("HaberID") %>' class="btn style-two fw-semibold">Devamını Oku<img src="/assets/img/icons/long-arrow-blue-2.svg" alt="Arrow"></a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Label ID="lblUyari" runat="server" Visible="false" CssClass="alert alert-warning text-center w-100">
                Bu kategoride henüz haber bulunmamaktadır.
            </asp:Label>

        </div>
        
        <ul class="page-nav text-center mt-35 list-unstyle">
            <li><a href="#" class="active d-flex flex-column align-items-center justify-content-center rounded-circle">01</a></li>
            <li><a href="#" class="d-flex flex-column align-items-center justify-content-center rounded-circle">02</a></li>
            <li><a href="#" class="d-flex flex-column align-items-center justify-content-center rounded-circle">03</a></li>
            <li><a href="#" class="d-flex flex-column align-items-center justify-content-center rounded-circle"><img src="/assets/img/icons/long-arrow-blue-2.svg" alt=""></a></li>
        </ul>
    </div>

    <div id="progress-wrap" class="progress-wrap">
        <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
            <path id="progress-path" d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
        </svg>
    </div>

    <script src="/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/js/swiper-bundle.min.js"></script>
    <script src="/assets/js/popup-video.js"></script>
    <script src="/assets/js/aos.js"></script>
    <script src="/assets/js/main.js"></script>
</asp:Content>