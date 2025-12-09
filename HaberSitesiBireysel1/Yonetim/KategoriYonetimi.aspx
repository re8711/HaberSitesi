<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.master" AutoEventWireup="true" CodeBehind="KategoriYonetimi.aspx.cs" Inherits="HaberSitesiBireysel1.Yonetim.KategoriYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="col-md-4">
            <div class="card p-3">
                <h4>Yeni Kategori Ekle</h4>
                <hr />
                <div class="mb-3">
                    <label>Kategori Adı:</label>
                    <asp:TextBox ID="txtKategoriAdi" runat="server" CssClass="form-control" placeholder="Örn: Teknoloji"></asp:TextBox>
                </div>
                <asp:Button ID="btnEkle" runat="server" Text="Ekle" CssClass="btn btn-success w-100" OnClick="btnEkle_Click" />
                <br /><br />
                <asp:Label ID="lblMesaj" runat="server" CssClass="fw-bold"></asp:Label>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card p-3">
                <h4>Mevcut Kategoriler</h4>
                <hr />
                
                <asp:GridView ID="gvKategoriler" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" OnRowCommand="gvKategoriler_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="KategoriID" HeaderText="ID" ItemStyle-Width="50px" />
                        <asp:BoundField DataField="KategoriAdi" HeaderText="Kategori Adı" />
                        
                        <asp:TemplateField HeaderText="İşlemler" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:Button ID="btnSil" runat="server" Text="Sil" CommandName="Sil" CommandArgument='<%# Eval("KategoriID") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Bu kategoriyi silmek istediğinize emin misiniz?')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>

</asp:Content>