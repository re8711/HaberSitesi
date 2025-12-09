<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="İletisim.aspx.cs" Inherits="HaberSitesiBireysel1.Sayfalar.İletisim" %>

<%-- 1. HEAD İÇERİĞİ: CSS, Title ve Meta etiketleri --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/remixicon.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <link rel="stylesheet" href="assets/css/dark-theme.css">

    <title>Renaz - İletişim Sayfası</title>
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
</asp:Content>

<%-- 2. BODY İÇERİĞİ: Sayfanın asıl içeriği ve JS Script'leri --%>
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

    <%-- 
        Navbar (Menü) ve Responsive Navbar (Mobil Menü) SİLİNDİ.
        Çünkü bu kodlar zaten MasterPage.Master dosyasında mevcut.
    --%>

    <div class="container pt-100 pb-70 contact-wrap style-one">
        <div class="row">
            <div class="col-lg-6">
                <div class="contact-content mb-30">
                    <h2 class="fs-46 ls-3">Bilgi Almak İstediğiniz Her Konuda Bize Ulaşın</h2>
                    <p class="contact-text text-paraThree fs-xxl-20">Ekibimiz dünya geneline yayılmış olup uzaktan çalışmaktadır. Ancak bazen bizi Zemin Kat, Bella Strada, 037 Santorini, Yunanistan adresinde ziyaret edebilirsiniz.</p>
                    <p class="fs-xxl-20 text-paraThree mb-18">915 Cheshire Road, Stratford Street College, <br> Amerika Birleşik Devletleri</p>
                    <span class="text-paraThree fs-xxl-20 d-block mb-20 ls-2">Bize Ulaşın: <a href="tel:99034688764" class="hover-anim-black text-title fw-semibold"> +990 3468 8764</a></span>
                    <ul class="social-profile list-unstyle">
                        <li><a href="https://www.facebook.com/" target="_blank" class="d-flex flex-column align-items-center justify-content-center rounded-circle"><img src="assets/img/icons/facebook.svg" alt="Facebook"></a></li>
                        <li><a href="https://x.com/?lang=en" target="_blank" class="d-flex flex-column align-items-center justify-content-center rounded-circle"><img src="assets/img/icons/twitter.svg" alt="Twitter"></a></li>
                        <li><a href="https://www.youtube.com/" target="_blank" class="d-flex flex-column align-items-center justify-content-center rounded-circle"><img src="assets/img/icons/youtube.svg" alt="YouTube"></a></li>
                        <li><a href="https://www.linkedin.com/" target="_blank" class="d-flex flex-column align-items-center justify-content-center rounded-circle"><img src="assets/img/icons/linkedin.svg" alt="Linedin"></a></li>
                        <li><a href="https://www.instagram.com/" target="_blank" class="d-flex flex-column align-items-center justify-content-center rounded-circle"><img src="assets/img/icons/instagram.svg" alt="Instagram"></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="contact-form-wrap mb-30">
                    <h3 class="fs-30 ls-3 mb-1">İletişime Geçin</h3>
                    <p class="mb-25">E-posta adresiniz yayınlanmayacaktır. Gerekli alanlar * ile işaretlenmiştir.</p>
                    <form action="#" class="contact-form">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group mb-30">
                                    <textarea name="messages" id="messages" cols="30" rows="10" placeholder="Mesajınız buraya..." class="bg-gray w-100 round-6 br-one"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group mb-30">
                                    <input type="text" name="name" id="name" placeholder="Adınız" required class="bg-gray w-100 round-6 br-one">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group mb-30">
                                    <input type="email" name="email" id="email" placeholder="E-posta adresiniz" required class="bg-gray w-100 round-6 br-one">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-check checkbox style-two mb-28">
                                    <input class="form-check-input" type="checkbox" id="test_2">
                                    <label class="form-check-label text-firod fs-xxl-18" for="test_2">
                                        <a href="terms-conditions.html" class="link style-three fs-15">Şartlar & Koşulları</a> ve <a href="privacy-policy.html" class="link style-three fs-15">Gizlilik Politikasını</a> kabul ediyorum.
                                    </label>
                                </div>
                            </div>
                            <div class="col-12">
                                <button class="btn style-one">Mesajı Şimdi Gönder<img src="assets/img/icons/long-arrow-white.svg" alt="Arrow"></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="comp-map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.8385385572983!2d144.95358331584498!3d-37.81725074201705!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d4dd5a05d97%3A0x3e64f855a564844d!2s121%20King%20St%2C%20Melbourne%20VIC%203000%2C%20Australia!5e0!3m2!1sen!2sbd!4v1612419490850!5m2!1sen!2sbd">
        </iframe>
    </div>
    <%-- 
        Footer (Alt Bilgi) SİLİNDİ.
        Çünkü bu kod zaten MasterPage.Master dosyasında mevcut.
    --%>

    <div id="progress-wrap" class="progress-wrap">
        <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
            <path id="progress-path" d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
        </svg>
    </div>

    <div class="modal fade" id="newsletter-popup" tabindex="-1" aria-labelledby="newsletter-popup" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <button type="button" class="btn_close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="ri-close-fill"></i>
                </button>
                <div class="modal-body">
                    <div class="newsletter-bg bg-f"></div>
                    <div class="newsletter-content d-flex flex-column justify-content-center">
                        <h2 class="fs-36 ls-3">Bültenimize Katılın & Yeni Yazıları İlk Siz Okuyun</h2>
                        <form action="#" class="newsletter-form">
                            <input type="email" placeholder="E-posta Adresi">
                            <button type="button" class="btn style-one">Abone Ol<i class="flaticon-arrow-right"></i></button>
                        </form>
                        <div class="form-check checkbox">
                            <input class="form-check-input" type="checkbox" id="test_21">
                            <label class="form-check-label" for="test_21">
                                <a href="privacy-policy.html">Gizlilik Politikasını</a> okudum ve kabul ediyorum.
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/swiper-bundle.min.js"></script>
    <script src="assets/js/popup-video.js"></script>
    <script src="assets/js/aos.js"></script>
    <script src="assets/js/main.js"></script>
</asp:Content>