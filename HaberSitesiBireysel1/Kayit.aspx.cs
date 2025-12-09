using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; 

namespace HaberSitesiBireysel1
{
    public partial class Kayit : System.Web.UI.Page
    {
        
        SqlBaglanti bgl = new SqlBaglanti();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnKayitOl_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtAdSoyad.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtSifre.Text))
            {
                lblMesaj.Text = "Lütfen tüm alanları doldurunuz!";
                lblMesaj.CssClass = "fw-bold text-warning";
                return; 
            }

            try
            {
                SqlCommand komut = new SqlCommand("INSERT INTO Tbl_Uyeler (AdSoyad, Email, Sifre) VALUES (@p1, @p2, @p3)", bgl.baglanti());

                komut.Parameters.AddWithValue("@p1", txtAdSoyad.Text);
                komut.Parameters.AddWithValue("@p2", txtEmail.Text);
                komut.Parameters.AddWithValue("@p3", txtSifre.Text);

                komut.ExecuteNonQuery();
                bgl.baglanti().Close();

                lblMesaj.Text = "Kayıt Başarılı! Yönlendiriliyorsunuz...";
                lblMesaj.CssClass = "fw-bold text-success";

                Response.AddHeader("REFRESH", "2;URL=Giris.aspx");
            }
            catch (Exception ex)
            {
                lblMesaj.Text = "Hata oluştu: " + ex.Message;
                lblMesaj.CssClass = "fw-bold text-danger";
            }
        }
    }
}