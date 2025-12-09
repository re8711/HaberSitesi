using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaberSitesiBireysel1.Yonetim
{
    public partial class KategoriYonetimi : System.Web.UI.Page
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
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM YeniHbrKategoriler", baglanti);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvKategoriler.DataSource = dt;
                gvKategoriler.DataBind();
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtKategoriAdi.Text))
            {
                lblMesaj.Text = "Kategori adı boş olamaz.";
                lblMesaj.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();
                SqlCommand komut = new SqlCommand("INSERT INTO YeniHbrKategoriler (KategoriAdi) VALUES (@ad)", baglanti);
                komut.Parameters.AddWithValue("@ad", txtKategoriAdi.Text);
                komut.ExecuteNonQuery();
            }

            txtKategoriAdi.Text = "";
            lblMesaj.Text = "Kategori eklendi.";
            lblMesaj.ForeColor = System.Drawing.Color.Green;
            KategorileriGetir();
        }

        protected void gvKategoriler_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Sil")
            {
                int kID = Convert.ToInt32(e.CommandArgument);

                try
                {
                    using (SqlConnection baglanti = new SqlConnection(connectionString))
                    {
                        baglanti.Open();
                        SqlCommand komut = new SqlCommand("DELETE FROM YeniHbrKategoriler WHERE KategoriID = @id", baglanti);
                        komut.Parameters.AddWithValue("@id", kID);
                        komut.ExecuteNonQuery();
                    }
                    KategorileriGetir();
                    lblMesaj.Text = "Kategori silindi.";
                    lblMesaj.ForeColor = System.Drawing.Color.Green;
                }
                catch (SqlException)
                {
                    lblMesaj.Text = "Hata: Bu kategorinin içinde haberler olduğu için silemezsiniz. Önce haberleri silin veya kategorisini değiştirin.";
                    lblMesaj.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}