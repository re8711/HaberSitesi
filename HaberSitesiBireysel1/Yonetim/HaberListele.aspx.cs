using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaberSitesiBireysel1.Yonetim
{
    public partial class HaberListele : System.Web.UI.Page
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
                string sorgu = @"SELECT H.*, K.KategoriAdi 
                                 FROM YeniHbrHaberler H 
                                 INNER JOIN YeniHbrKategoriler K ON H.KategoriID = K.KategoriID 
                                 ORDER BY H.EklenmeTarihi DESC";

                SqlDataAdapter da = new SqlDataAdapter(sorgu, baglanti);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvHaberler.DataSource = dt;
                gvHaberler.DataBind();
            }
        }

        protected void gvHaberler_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Sil")
            {
                int haberID = Convert.ToInt32(e.CommandArgument);

                using (SqlConnection baglanti = new SqlConnection(connectionString))
                {
                    baglanti.Open();
                    SqlCommand komut = new SqlCommand("DELETE FROM YeniHbrHaberler WHERE HaberID = @id", baglanti);
                    komut.Parameters.AddWithValue("@id", haberID);
                    komut.ExecuteNonQuery();
                }
                HaberleriGetir();
            }
        }
    }
}