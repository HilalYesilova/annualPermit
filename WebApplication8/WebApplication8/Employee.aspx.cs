using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication8
{

    public partial class Employee : System.Web.UI.Page
    {
        public string k;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string connetionString = null;
            SqlConnection cnn;
            connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
            cnn = new SqlConnection(connetionString);
            SqlDataAdapter sda = new SqlDataAdapter("Select Personel.adSoyad AS \"Ad Soyad\", Personel.daireBolgeSube AS \"Daire Bölge Şube\", Personel.servis AS \"Servis\", Personel.sicilDosyaNo AS \"Sicil Dosya No\", Personel.pozisyon AS \"Pozisyon\", Personel.ucretStatu AS \"Ücret Statü\", Personel.iseGirisTarihi AS \"İşe Giriş Tarihi\", Personel.kalanIzinSuresi AS \"Kalan İzin Süresi\" from Personel where idKullaniciGiris = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' )", cnn);
            DataTable dt2 = new DataTable();
            cnn.Open();
            sda.Fill(dt2);
            GridView1.DataSource = dt2;
            GridView1.DataBind();
            k = Session["kullaniciAdi"].ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Add("kullaniciAdi", k);           
            Response.Redirect("ExportData.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Add("kullaniciAdi", k);
            Response.Redirect("AnnualPermit.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}