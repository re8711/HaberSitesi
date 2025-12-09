using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; // SQL kütüphanesini unutma

namespace HaberSitesiBireysel1
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        // Bağlantı sınıfını çağırıyoruz
        SqlBaglanti bgl = new SqlBaglanti();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Kategorileri sadece sayfa ilk yüklenirken getir (performans için)
            if (!IsPostBack)
            {
                KategorileriGetir();
            }

            // KULLANICI GİRİŞ KONTROLÜ
            if (Session["AdSoyad"] != null)
            {
                // Giriş yapılmışsa:
                pnlMisafir.Visible = false; // Kayıt/Giriş butonlarını gizle
                pnlUye.Visible = true;      // Üye panelini göster
                lblUyeAdSoyad.Text = Session["AdSoyad"].ToString(); // İsmi yazdır
            }
            else
            {
                // Giriş yapılmamışsa:
                pnlMisafir.Visible = true;  // Kayıt/Giriş butonlarını göster
                pnlUye.Visible = false;     // Üye panelini gizle
            }
        }

        // Kategorileri Menüye Çeken Metot
        void KategorileriGetir()
        {
            // NOT: Veritabanında "Tbl_Kategoriler" tablosu olmalı.
            SqlCommand komut = new SqlCommand("SELECT * FROM YeniHbrKategoriler", bgl.baglanti());
            SqlDataReader dr = komut.ExecuteReader();

            rptKategoriler.DataSource = dr;
            rptKategoriler.DataBind();

            bgl.baglanti().Close();
        }

        // Çıkış Butonu
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon(); // Oturumu öldür
            Session.RemoveAll(); // Verileri sil
            Response.Redirect("Default.aspx"); // Anasayfaya at
        }
    }
}