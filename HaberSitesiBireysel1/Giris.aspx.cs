using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace HaberSitesiBireysel1
{
    public partial class Giris : System.Web.UI.Page
    {
        SqlBaglanti bgl = new SqlBaglanti();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtKullanici.Text) || string.IsNullOrEmpty(txtSifre.Text))
            {
                lblMesaj.Text = "Lütfen bilgilerinizi giriniz.";
                return;
            }

            try
            {
                SqlCommand komutAdmin = new SqlCommand("SELECT * FROM YeniHbrYonetim WHERE KullaniciAdi=@p1 AND Sifre=@p2", bgl.baglanti());
                komutAdmin.Parameters.AddWithValue("@p1", txtKullanici.Text);
                komutAdmin.Parameters.AddWithValue("@p2", txtSifre.Text);

                SqlDataReader drAdmin = komutAdmin.ExecuteReader();

                if (drAdmin.Read())
                {
                    Session["YoneticiID"] = drAdmin[0];
                    Session["KullaniciAdi"] = drAdmin["KullaniciAdi"];
                    Session["AdminYetki"] = "Var";


                    Response.Redirect("Yonetim/HaberEkle.aspx");
                }
                else
                {
                    bgl.baglanti().Close();

                    SqlCommand komutUye = new SqlCommand("SELECT * FROM Tbl_Uyeler WHERE (Email=@p1 OR AdSoyad=@p1) AND Sifre=@p2", bgl.baglanti());
                    komutUye.Parameters.AddWithValue("@p1", txtKullanici.Text);
                    komutUye.Parameters.AddWithValue("@p2", txtSifre.Text);

                    SqlDataReader drUye = komutUye.ExecuteReader();

                    if (drUye.Read())
                    {
                        Session["KullaniciID"] = drUye["UyeID"];
                        Session["AdSoyad"] = drUye["AdSoyad"];

                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        lblMesaj.Text = "Hatalı Kullanıcı Adı veya Şifre!";
                    }
                }
                bgl.baglanti().Close();
            }
            catch (Exception ex)
            {
                lblMesaj.Text = "Hata: " + ex.Message;
            }
        }
    }
}