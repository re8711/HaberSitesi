using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace HaberSitesiBireysel1
{
    public partial class HaberDetay : System.Web.UI.Page
    {
        
        string connectionString = "Data Source=kutuphane1.mssql.somee.com;Initial Catalog=kutuphane1;Persist Security Info=True;User ID=resull871_SQLLogin_1;Password=22kuotkxfi;Pooling=False;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Packet Size=4096;Workstation ID=kutuphane1.mssql.somee.com;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int haberID;
                    if (int.TryParse(Request.QueryString["id"], out haberID))
                    {
                        HttpCookie okunanCookie = Request.Cookies["OkunanHaberler"];
                        bool dahaOnceOkunduMu = false;

                        if (okunanCookie != null)
                        {
                            string[] okunanlar = okunanCookie.Value.Split(',');
                            foreach (string id in okunanlar)
                            {
                                if (id == haberID.ToString())
                                {
                                    dahaOnceOkunduMu = true;
                                    break;
                                }
                            }
                        }

                        if (!dahaOnceOkunduMu)
                        {
                            OkunmaSayisiArttir(haberID);

                            if (okunanCookie == null)
                            {
                                okunanCookie = new HttpCookie("OkunanHaberler");
                                okunanCookie.Value = haberID.ToString();
                            }
                            else
                            {
                                okunanCookie.Value = okunanCookie.Value + "," + haberID.ToString();
                            }

                            okunanCookie.Expires = DateTime.Now.AddDays(1);
                            Response.Cookies.Add(okunanCookie);
                        }

                        HaberGetir(haberID);
                        YorumlariGetir(haberID);
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        void HaberGetir(int id)
        {
            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();
                string sorgu = @"SELECT H.*, K.KategoriAdi 
                                 FROM YeniHbrHaberler H 
                                 INNER JOIN YeniHbrKategoriler K ON H.KategoriID = K.KategoriID 
                                 WHERE H.HaberID = @id";

                SqlCommand komut = new SqlCommand(sorgu, baglanti);
                komut.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = komut.ExecuteReader();
                if (dr.Read())
                {
                    lblBaslik.Text = dr["Baslik"].ToString();
                    litIcerik.Text = dr["Icerik"].ToString();
                    lblTarih.Text = Convert.ToDateTime(dr["EklenmeTarihi"]).ToString("dd MMMM yyyy");
                    lblOkunma.Text = dr["OkunmaSayisi"].ToString();
                    lblKategori.Text = dr["KategoriAdi"].ToString();
                    lblOzet.Text = dr["Ozet"].ToString();
                    imgHaberResim.ImageUrl = dr["ResimYolu"].ToString();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        void OkunmaSayisiArttir(int id)
        {
            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();
                SqlCommand komut = new SqlCommand("UPDATE YeniHbrHaberler SET OkunmaSayisi = OkunmaSayisi + 1 WHERE HaberID = @id", baglanti);
                komut.Parameters.AddWithValue("@id", id);
                komut.ExecuteNonQuery();
            }
        }
        void YorumlariGetir(int id)
        {
            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();
                string sorgu = "SELECT * FROM YeniHbrYorumlar WHERE HaberID = @id AND OnayliMi = 1 ORDER BY Tarih DESC";
                SqlCommand komut = new SqlCommand(sorgu, baglanti);
                komut.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = komut.ExecuteReader();
                rptYorumlar.DataSource = dr;
                rptYorumlar.DataBind();

                if (rptYorumlar.Items.Count == 0)
                {
                    lblYorumYok.Visible = true;
                    lblYorumSayisi.Text = "0";
                }
                else
                {
                    lblYorumYok.Visible = false;
                    lblYorumSayisi.Text = rptYorumlar.Items.Count.ToString();
                }
            }
        }
        protected void btnYorumGonder_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtAdSoyad.Text) || string.IsNullOrEmpty(txtYorum.Text))
            {
                lblMesaj.Text = "Lütfen isminizi ve yorumunuzu yazın.";
                lblMesaj.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int haberID = Convert.ToInt32(Request.QueryString["id"]);

            using (SqlConnection baglanti = new SqlConnection(connectionString))
            {
                baglanti.Open();
                string sorgu = @"INSERT INTO YeniHbrYorumlar (AdSoyad, Email, YorumMetni, Tarih, OnayliMi, HaberID) 
                                 VALUES (@ad, @mail, @yorum, @tarih, 0, @id)";

                SqlCommand komut = new SqlCommand(sorgu, baglanti);
                komut.Parameters.AddWithValue("@ad", txtAdSoyad.Text);
                komut.Parameters.AddWithValue("@mail", txtEmail.Text);
                komut.Parameters.AddWithValue("@yorum", txtYorum.Text);
                komut.Parameters.AddWithValue("@tarih", DateTime.Now);
                komut.Parameters.AddWithValue("@id", haberID);

                komut.ExecuteNonQuery();

                lblMesaj.Text = "Yorumunuz gönderildi. Yönetici onayından sonra yayınlanacaktır.";
                lblMesaj.ForeColor = System.Drawing.Color.Green;

                txtAdSoyad.Text = "";
                txtEmail.Text = "";
                txtYorum.Text = "";
            }
        }
    }
}