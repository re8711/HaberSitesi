using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient; // Bu kütüphane şart

namespace HaberSitesiBireysel1
{
    public class SqlBaglanti
    {
        public SqlConnection baglanti()
        {
            SqlConnection baglan = new SqlConnection("Data Source=kutuphane1.mssql.somee.com;Initial Catalog=kutuphane1;Persist Security Info=True;User ID=resull871_SQLLogin_1;Password=22kuotkxfi;Pooling=False;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Packet Size=4096;Workstation ID=kutuphane1.mssql.somee.com;");
            baglan.Open();
            return baglan;
        }
    }
}