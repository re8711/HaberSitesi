using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace HaberSitesiBireysel1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        string connectionString = "Data Source=kutuphane1.mssql.somee.com;Initial Catalog=kutuphane1;Persist Security Info=True;User ID=resull871_SQLLogin_1;Password=22kuotkxfi;Pooling=False;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Packet Size=4096;Workstation ID=kutuphane1.mssql.somee.com;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HaberleriGetir();
            }
        }

        void HaberleriGetir()
        {
            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();

                SqlDataAdapter daSidebar = new SqlDataAdapter("SELECT TOP 3 H.*, K.KategoriAdi FROM YeniHbrHaberler H INNER JOIN YeniHbrKategoriler K ON H.KategoriID = K.KategoriID ORDER BY OkunmaSayisi DESC", baglanti);
                DataTable dtSidebar = new DataTable();
                daSidebar.Fill(dtSidebar);
                rptSidebar.DataSource = dtSidebar;
                rptSidebar.DataBind();

                SqlDataAdapter daManset = new SqlDataAdapter("SELECT TOP 1 H.*, K.KategoriAdi FROM YeniHbrHaberler H INNER JOIN YeniHbrKategoriler K ON H.KategoriID = K.KategoriID ORDER BY EklenmeTarihi DESC", baglanti);
                DataTable dtManset = new DataTable();
                daManset.Fill(dtManset);
                rptManset.DataSource = dtManset;
                rptManset.DataBind();

                SqlDataAdapter daSon = new SqlDataAdapter("SELECT H.*, K.KategoriAdi FROM YeniHbrHaberler H INNER JOIN YeniHbrKategoriler K ON H.KategoriID = K.KategoriID ORDER BY EklenmeTarihi DESC OFFSET 1 ROWS FETCH NEXT 4 ROWS ONLY", baglanti);
                DataTable dtSon = new DataTable();
                daSon.Fill(dtSon);
                rptSonHaberler.DataSource = dtSon;
                rptSonHaberler.DataBind();

                SqlDataAdapter daGundem = new SqlDataAdapter("SELECT TOP 3 H.*, K.KategoriAdi FROM YeniHbrHaberler H INNER JOIN YeniHbrKategoriler K ON H.KategoriID = K.KategoriID ORDER BY OkunmaSayisi DESC", baglanti);
                DataTable dtGundem = new DataTable();
                daGundem.Fill(dtGundem);
                rptGundem.DataSource = dtGundem;
                rptGundem.DataBind();

                SqlDataAdapter daAkis = new SqlDataAdapter("SELECT TOP 6 H.*, K.KategoriAdi FROM YeniHbrHaberler H INNER JOIN YeniHbrKategoriler K ON H.KategoriID = K.KategoriID ORDER BY OkunmaSayisi DESC", baglanti);
                DataTable dtAkis = new DataTable();
                daAkis.Fill(dtAkis);
                rptHaberAkisi.DataSource = dtAkis;
                rptHaberAkisi.DataBind();

                SqlDataAdapter daAna = new SqlDataAdapter("SELECT TOP 4 H.*, K.KategoriAdi FROM YeniHbrHaberler H INNER JOIN YeniHbrKategoriler K ON H.KategoriID = K.KategoriID ORDER BY NEWID()", baglanti);
                DataTable dtAna = new DataTable();
                daAna.Fill(dtAna);
                rptAnaBasliklar.DataSource = dtAna;
                rptAnaBasliklar.DataBind();
            }
        }
    }
}