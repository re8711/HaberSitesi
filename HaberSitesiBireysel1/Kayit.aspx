<%@ Page Title="Kayıt Ol" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Kayit.aspx.cs" Inherits="HaberSitesiBireysel1.Kayit" %>

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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-100 pb-100">
        <div class="row">
            <div class="col-12">
                <div class="login-box">
                    <h2 class="text-center mb-4">Aramıza Katıl</h2>
                    
                    <div class="form-group mb-3">
                        <label class="mb-2">Ad Soyad</label>
                        <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="form-control" placeholder="Adınız ve Soyadınız"></asp:TextBox>
                    </div>

                    <div class="form-group mb-3">
                        <label class="mb-2">E-posta Adresi</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="ornek@email.com"></asp:TextBox>
                    </div>

                    <div class="form-group mb-4">
                        <label class="mb-2">Şifre</label>
                        <asp:TextBox ID="txtSifre" runat="server" CssClass="form-control" TextMode="Password" placeholder="******"></asp:TextBox>
                    </div>

                    <asp:Button 
                        ID="btnKayitOl" 
                        runat="server" 
                        Text="Kayıt Ol" 
                        CssClass="btn w-100" 
                        Style="border-style: none; border-color: inherit; border-width: medium; background-color: #0d6efd; color: #fff; padding: 12px; font-weight: 600; top: 0px; left: 0px;"
                        OnClick="btnKayitOl_Click" 
                    />

                    <div class="mt-3 text-center">
                        <p>Zaten bir hesabın var mı? <a href="Giris.aspx" class="text-primary fw-bold">Giriş Yap</a></p>
                    </div>

                    <div class="mt-3 text-center">
                        <asp:Label ID="lblMesaj" runat="server" CssClass="fw-bold text-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>