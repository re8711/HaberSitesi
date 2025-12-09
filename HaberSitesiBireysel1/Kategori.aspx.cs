using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace HaberSitesiBireysel1.Sayfalar
{
    public partial class Kategori : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int kategoriID;
                    if (int.TryParse(Request.QueryString["id"], out kategoriID))
                    {
                        HaberleriGetir(kategoriID);
                    }
                    else
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }

        void HaberleriGetir(int kID)
        {
            
            string connectionString = "Data Source=kutuphane1.mssql.somee.com;Initial Catalog=kutuphane1;Persist Security Info=True;User ID=resull871_SQLLogin_1;Password=22kuotkxfi;Pooling=False;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Packet Size=4096;Workstation ID=kutuphane1.mssql.somee.com;";

            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();
                SqlCommand komut = new SqlCommand("SELECT * FROM YeniHbrHaberler WHERE KategoriID = @id ORDER BY EklenmeTarihi DESC", baglanti);
                komut.Parameters.AddWithValue("@id", kID);

                SqlDataReader dr = komut.ExecuteReader();

                if (dr.HasRows)
                {
                    rptKategoriHaberleri.DataSource = dr;
                    rptKategoriHaberleri.DataBind();
                    lblUyari.Visible = false;
                }
                else
                {
                    lblUyari.Visible = true;
                }
            }
        }
    }
}