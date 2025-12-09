using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaberSitesiBireysel1.Yonetim
{
    public partial class YorumOnay : System.Web.UI.Page
    {
        string connectionString = "Data Source=kutuphane1.mssql.somee.com;Initial Catalog=kutuphane1;Persist Security Info=True;User ID=resull871_SQLLogin_1;Password=22kuotkxfi;Pooling=False;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Packet Size=4096;Workstation ID=kutuphane1.mssql.somee.com;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                YorumlariGetir();
            }
        }

        void YorumlariGetir()
        {
            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();
                
                string sorgu = @"SELECT Y.*, H.Baslik 
                                 FROM YeniHbrYorumlar Y 
                                 INNER JOIN YeniHbrHaberler H ON Y.HaberID = H.HaberID 
                                 WHERE Y.OnayliMi = 0 
                                 ORDER BY Y.Tarih DESC";

                SqlDataAdapter da = new SqlDataAdapter(sorgu, baglanti);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvYorumlar.DataSource = dt;
                gvYorumlar.DataBind();

                if (dt.Rows.Count == 0)
                {
                    lblMesaj.Text = "Onay bekleyen yorum yok.";
                }
                else
                {
                    lblMesaj.Text = "";
                }
            }
        }

        protected void gvYorumlar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int yorumID = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();

                if (e.CommandName == "Onayla")
                {
                    
                    SqlCommand komut = new SqlCommand("UPDATE YeniHbrYorumlar SET OnayliMi = 1 WHERE YorumID = @id", baglanti);
                    komut.Parameters.AddWithValue("@id", yorumID);
                    komut.ExecuteNonQuery();
                }
                else if (e.CommandName == "Sil")
                {
                    
                    SqlCommand komut = new SqlCommand("DELETE FROM YeniHbrYorumlar WHERE YorumID = @id", baglanti);
                    komut.Parameters.AddWithValue("@id", yorumID);
                    komut.ExecuteNonQuery();
                }
            }

            YorumlariGetir();
        }
    }
}