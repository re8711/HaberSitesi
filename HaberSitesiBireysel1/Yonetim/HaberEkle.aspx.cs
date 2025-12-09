using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace HaberSitesiBireysel1.Yonetim
{
    public partial class HaberEkle : System.Web.UI.Page
    {
        
        string connectionString = "Data Source=kutuphane1.mssql.somee.com;Initial Catalog=kutuphane1;Persist Security Info=True;User ID=resull871_SQLLogin_1;Password=22kuotkxfi;Pooling=False;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Packet Size=4096;Workstation ID=kutuphane1.mssql.somee.com;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KategorileriGetir();
            }
        }

        void KategorileriGetir()
        {
            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();
                SqlCommand komut = new SqlCommand("SELECT * FROM YeniHbrKategoriler", baglanti);
                SqlDataReader dr = komut.ExecuteReader();

                ddlKategoriler.DataSource = dr;
                ddlKategoriler.DataTextField = "KategoriAdi";
                ddlKategoriler.DataValueField = "KategoriID";
                ddlKategoriler.DataBind();
            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (fuResim.HasFile)
            {
                string dosyaAdi = Path.GetFileName(fuResim.FileName);
                string yeniDosyaAdi = DateTime.Now.Ticks.ToString() + "_" + dosyaAdi;

                
                string kayitYeri = Server.MapPath("~/assets/img/upload/" + yeniDosyaAdi);
                fuResim.SaveAs(kayitYeri);

                string dbResimYolu = "assets/img/upload/" + yeniDosyaAdi;

                using (SqlConnection baglanti = new SqlConnection(connectionString))
                {
                    baglanti.Open();
                    string sorgu = "INSERT INTO YeniHbrHaberler (Baslik, Ozet, Icerik, ResimYolu, KategoriID, EklenmeTarihi, OkunmaSayisi) VALUES (@baslik, @ozet, @icerik, @resim, @katID, @tarih, 0)";

                    SqlCommand komut = new SqlCommand(sorgu, baglanti);
                    komut.Parameters.AddWithValue("@baslik", txtBaslik.Text);
                    komut.Parameters.AddWithValue("@ozet", txtOzet.Text);
                    komut.Parameters.AddWithValue("@icerik", txtIcerik.Text);
                    komut.Parameters.AddWithValue("@resim", dbResimYolu);
                    komut.Parameters.AddWithValue("@katID", ddlKategoriler.SelectedValue);
                    komut.Parameters.AddWithValue("@tarih", DateTime.Now);

                    komut.ExecuteNonQuery();
                    lblMesaj.Text = "Haber başarıyla eklendi.";

                    txtBaslik.Text = "";
                    txtOzet.Text = "";
                    txtIcerik.Text = "";
                }
            }
            else
            {
                lblMesaj.Text = "Lütfen bir resim seçiniz.";
                lblMesaj.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}