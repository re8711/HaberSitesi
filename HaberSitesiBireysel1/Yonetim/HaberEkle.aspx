<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.master" AutoEventWireup="true" CodeBehind="HaberEkle.aspx.cs" Inherits="HaberSitesiBireysel1.Yonetim.HaberEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Yeni Haber Ekle</h2>
    <div class="card p-4">
        
        <div class="mb-3">
            <label>Haber Başlığı</label>
            <asp:TextBox ID="txtBaslik" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label>Kategori Seç</label>
            <asp:DropDownList ID="ddlKategoriler" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>

        <div class="mb-3">
            <label>Kapak Resmi</label>
            <asp:FileUpload ID="fuResim" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>Özet (Kısa Açıklama)</label>
            <asp:TextBox ID="txtOzet" runat="server" CssClass="form-control" TextMode="MultiLine" Height="80"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label>Haber İçeriği (Detay)</label>
            <asp:TextBox ID="txtIcerik" runat="server" CssClass="form-control" TextMode="MultiLine" Height="200"></asp:TextBox>
        </div>

        <asp:Button ID="btnKaydet" runat="server" Text="Haberi Kaydet" CssClass="btn btn-success" OnClick="btnKaydet_Click" />
        
        <br /><br />
        <asp:Label ID="lblMesaj" runat="server" ForeColor="Green"></asp:Label>

    </div>
</asp:Content>