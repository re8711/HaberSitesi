<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.master" AutoEventWireup="true" CodeBehind="YorumOnay.aspx.cs" Inherits="HaberSitesiBireysel1.Yonetim.YorumOnay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-4">Onay Bekleyen Yorumlar</h2>

    <asp:GridView ID="gvYorumlar" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" OnRowCommand="gvYorumlar_RowCommand">
        <Columns>
            <asp:BoundField DataField="YorumID" HeaderText="ID" />
            <asp:BoundField DataField="AdSoyad" HeaderText="Yazar" />
            <asp:BoundField DataField="YorumMetni" HeaderText="Yorum" />
            <asp:BoundField DataField="Baslik" HeaderText="Haber Başlığı" />
            <asp:BoundField DataField="Tarih" HeaderText="Tarih" DataFormatString="{0:dd.MM.yyyy HH:mm}" />
            
            <asp:TemplateField HeaderText="İşlemler">
                <ItemTemplate>
                    <asp:Button ID="btnOnayla" runat="server" Text="Onayla" CommandName="Onayla" CommandArgument='<%# Eval("YorumID") %>' CssClass="btn btn-success btn-sm" />
                    
                    <asp:Button ID="btnSil" runat="server" Text="Sil" CommandName="Sil" CommandArgument='<%# Eval("YorumID") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Bu yorumu silmek istediğinize emin misiniz?')" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Label ID="lblMesaj" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>