<%@ Page Title="Giriş Yap" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="HaberSitesiBireysel1.Giris" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-box {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            max-width: 500px;
            margin: 0 auto;
        }
        /* Tema butonu MasterPage kullanıldığı için ContentPlaceHolder dışına, ama ContentPlaceHolder'ın hemen üstüne eklenmeli */
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="switch-theme-mode">
        <label id="switch" class="switch">
            <input type="checkbox" onchange="toggleTheme()" id="slider">
            <span class="slider round"></span>
        </label>
    </div>
    <div class="container pt-100 pb-100">
        <div class="row">
            <div class="col-12">
                <div class="login-box">
                    <h2 class="text-center mb-4">Giriş Yap</h2>
                    
                    <div class="form-group mb-3">
                        <label class="mb-2">Kullanıcı Adı veya E-posta</label>
                        <asp:TextBox ID="txtKullanici" runat="server" CssClass="form-control" placeholder="Giriş bilginiz"></asp:TextBox>
                    </div>

                    <div class="form-group mb-4">
                        <label class="mb-2">Şifre</label>
                        <asp:TextBox ID="txtSifre" runat="server" CssClass="form-control" TextMode="Password" placeholder="******"></asp:TextBox>
                    </div>

                   <asp:Button 
                        ID="btnGiris" 
                        runat="server" 
                        Text="Giriş Yap" 
                        CssClass="btn btn-primary w-100" 
                        Style="background-color: #0d6efd; color: #fff; padding: 12px; font-weight: 600; border: none;"
                        OnClick="btnGiris_Click" 
                    />

                    <div class="mt-3 text-center">
                        <p>Hesabın yok mu? <a href="Kayit.aspx" class="text-primary fw-bold">Hemen Kayıt Ol</a></p>
                    </div>

                    <div class="mt-3 text-center">
                        <asp:Label ID="lblMesaj" runat="server" CssClass="fw-bold text-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>