<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HaberDetay.aspx.cs" Inherits="HaberSitesiBireysel1.HaberDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-45 pb-100">
        <div class="row">
            <div class="col-xl-8">
                <div class="content-left">
                    
                    <div class="news-details">
                        <div class="single-img round-6 mb-30">
                            <asp:Image ID="imgHaberResim" runat="server" CssClass="round-6" Style="width:100%; max-height:500px; object-fit:cover;" />
                        </div>
                        
                        <ul class="news-metainfo list-unstyle d-flex flex-wrap align-items-center mb-3">
                            <li class="news-author fs-14 d-inline-flex align-items-center">
                               <%-- <span class="author-img rounded-circle">
                                    <img src="assets/img/author/author-5.png" alt="Image" class="rounded-circle">
                                </span>--%>

                                <span class="text-link">Admin</span>
                            </li>
                            <li><i class="ri-time-line"></i> <asp:Label ID="lblTarih" runat="server"></asp:Label></li>
                            <li><i class="ri-eye-line"></i> <asp:Label ID="lblOkunma" runat="server"></asp:Label> Okunma</li>
                            <li>
                                <asp:Label ID="lblKategori" runat="server" CssClass="text-primary fw-bold"></asp:Label>
                            </li>
                        </ul>

                        <div class="single-para">
                            <h1><asp:Label ID="lblBaslik" runat="server"></asp:Label></h1>
                            
                            <div class="wp-blockquote d-flex flex-wrap align-items-center mb-35 mt-4">
                                <span class="quote-icon d-flex flex-column align-items-center justify-content-center rounded-circle bg_primary"><img src="assets/img/icons/quote-icon.svg" alt="Quote Icon"></span>
                                <div>
                                    <h6 class="fs-22 ls-3 fw-semibold">
                                        <asp:Label ID="lblOzet" runat="server"></asp:Label>
                                    </h6>
                                </div>
                            </div>

                            <div class="content-text">
                                <asp:Literal ID="litIcerik" runat="server"></asp:Literal>
                            </div>
                        </div>

                    </div>

                    <div class="news-metaoption">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="post-share d-flex align-items-center">
                                    <h6 class="font-primary fw-semibold mb-0">Paylaş:</h6>
                                    <ul class="social-profile style-one text-md-end list-unstyled">
                                        <li><a href="#" target="_blank"><i class="ri-facebook-fill"></i></a></li>
                                        <li><a href="#" target="_blank"><i class="ri-twitter-x-line"></i></a></li>
                                        <li><a href="#" target="_blank"><i class="ri-whatsapp-line"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr />

                    <h3 class="fs-30 ls-3 mb-30">Yorumlar (<asp:Label ID="lblYorumSayisi" runat="server"></asp:Label>)</h3>
                    
                    <div class="comment-item-wrap pb-50">
                        
                        <asp:Repeater ID="rptYorumlar" runat="server">
                            <ItemTemplate>
                                <div class="comment-item d-flex flex-wrap mb-4">
                                    <div class="comment-author w-100 d-flex flex-wrap">
                                       <%-- <div class="comment-author-img rounded-circle">
                                            <img src="assets/img/author/author-1.png" alt="Image" class="rounded-circle">
                                        </div>--%>
                                        <div class="comment-author-info">
                                            <h5 class="font-primary fw-semibold mb-0">
                                                <%# Eval("AdSoyad") %> 
                                                <span class="fs-14 text-paraThree fw-normal ms-2"><%# Eval("Tarih", "{0:dd MMMM yyyy}") %></span>
                                            </h5>
                                            <p class="comment-text"><%# Eval("YorumMetni") %></p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Label ID="lblYorumYok" runat="server" Visible="false" CssClass="alert alert-light w-100 d-block text-center">
                            Henüz yorum yapılmamış. İlk yorumu siz yapın!
                        </asp:Label>

                    </div>

                    <div class="leave-reply">
                        <h3 class="fs-30 ls-3 mb-1">Yorum Yap</h3>
                        <p class="mb-25">E-posta adresiniz yayınlanmayacaktır. Gerekli alanlar işaretlendi *</p>
                        
                        <div class="comment-form" id="cmt-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-30">
                                        <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="bg-gray w-100 round-6" placeholder="Adınız Soyadınız"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-30">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="bg-gray w-100 round-6" placeholder="E-posta Adresiniz"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group mb-30">
                                        <asp:TextBox ID="txtYorum" runat="server" TextMode="MultiLine" Rows="5" CssClass="bg-gray w-100 round-6" placeholder="Yorumunuzu buraya yazın..."></asp:TextBox>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <asp:LinkButton ID="btnYorumGonder" runat="server" CssClass="btn style-one" OnClick="btnYorumGonder_Click">
                                        Yorumu Gönder <img src="assets/img/icons/long-arrow-white.svg" alt="Arrow">
                                    </asp:LinkButton>

                                    <br /><br />
                                    <asp:Label ID="lblMesaj" runat="server" CssClass="fw-bold"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-xl-4 pe-xxl-1">
                <div class="sidebar sidebar-right ">
                    
                   <%-- <div class="sidebar-widget">
                        <div class="author-widget">
                            <h2 class="fs-36 fw-semibold ls-3 mb-35">Hoşgeldiniz</h2>
                            <img src="assets/img/author/author-6.png" alt="Author" class="author-avatar rounded-circle d-inline-block mb-40">
                            <h5 class="fs-22 ls-3 mb-15">Merhaba, Ben Admin</h5>
                            <p class="mb-0">Dünyadan en güncel haberleri ve teknolojik gelişmeleri sizlerle paylaşıyoruz. Doğru ve tarafsız habercilik.</p>
                        </div>
                    </div>--%>

                    <div class="sidebar-widget">
                        <h5 class="fs-22 fw-semibold lh-1 ls-3 mb-25">Kategoriler</h5>
                        <ul class="category-list list-unstyle">
                            <li><a href="Kategori.aspx?id=1">Teknoloji</a></li>
                            <li><a href="Kategori.aspx?id=2">Spor</a></li>
                            <li><a href="Kategori.aspx?id=3">Ekonomi</a></li>
                            <li><a href="Kategori.aspx?id=4">Magazin</a></li>
                            <li><a href="Kategori.aspx?id=5">Dünya</a></li>
                        </ul>
                    </div>

                    <div class="sidebar-widget">
                        <h5 class="fs-22 fw-semibold lh-1 ls-3 mb-25">Öne Çıkanlar</h5>
                        <div class="popular-news-widget">
                            <div class="thumbnail-news-card style-one d-flex flex-wrap align-items-md-center align-items-start">
                                <div class="news-img rounded-circle">
                                    <img src="assets/img/news/news-thumb-3.png" alt="Image" class="rounded-circle">
                                </div>
                                <div class="news-info">
                                    <ul class="news-metainfo list-unstyle">
                                        <li><i class="ri-time-line"></i>8 Saat önce</li>
                                        <li><a href="#">Teknoloji</a></li>
                                    </ul>
                                    <h3 class="fs-22 fw-semibold ls-3 mb-0"><a href="#" class="hover-anim-blue">Yapay Zeka Dünyayı Nasıl Değiştiriyor?</a></h3>
                                </div>
                            </div>
                            <div class="thumbnail-news-card style-one d-flex flex-wrap align-items-md-center align-items-start">
                                <div class="news-img rounded-circle">
                                    <img src="assets/img/news/news-thumb-4.png" alt="Image" class="rounded-circle">
                                </div>
                                <div class="news-info">
                                    <ul class="news-metainfo list-unstyle">
                                        <li><i class="ri-time-line"></i>3 Saat önce</li>
                                        <li><a href="#">Ekonomi</a></li>
                                    </ul>
                                    <h3 class="fs-22 fw-semibold ls-3 mb-0"><a href="#" class="hover-anim-blue">Küresel Piyasalar ve Genç Yatırımcılar</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="sidebar-widget">
                        <h5 class="fs-22 fw-semibold lh-1 ls-3 mb-25">Popüler Etiketler</h5>
                        <ul class="tag-list list-unstyle">
                            <li><a href="#">Yaşam</a></li>
                            <li><a href="#">Eğitim</a></li>
                            <li><a href="#">Yapay Zeka</a></li>
                            <li><a href="#">Ekonomi</a></li>
                            <li><a href="#">Pazarlama</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
    </asp:Content>