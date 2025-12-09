<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.master" AutoEventWireup="true" CodeBehind="HaberListele.aspx.cs" Inherits="HaberSitesiBireysel1.Yonetim.HaberListele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-4">Haber Listesi</h2>
    <a href="HaberEkle.aspx" class="btn btn-primary mb-3">+ Yeni Haber Ekle</a>

    <asp:GridView ID="gvHaberler" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" OnRowCommand="gvHaberler_RowCommand" DataKeyNames="HaberID">
        <Columns>
            <asp:BoundField DataField="HaberID" HeaderText="ID" ItemStyle-Width="50px" />
            
            <asp:TemplateField HeaderText="Resim">
                <ItemTemplate>
                    <img src='<%# ResolveUrl("~/" + Eval("ResimYolu")) %>' width="80" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Baslik" HeaderText="Başlık" />
            <asp:BoundField DataField="KategoriAdi" HeaderText="Kategori" />
            <asp:BoundField DataField="EklenmeTarihi" HeaderText="Tarih" DataFormatString="{0:dd.MM.yyyy}" />
            <asp:BoundField DataField="OkunmaSayisi" HeaderText="Okunma" />

            <asp:TemplateField HeaderText="İşlemler">
                <ItemTemplate>
                    <asp:Button ID="btnSil" runat="server" Text="Sil" CommandName="Sil" CommandArgument='<%# Eval("HaberID") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Bu haberi ve habere ait tüm yorumları silmek istediğinize emin misiniz?')" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>