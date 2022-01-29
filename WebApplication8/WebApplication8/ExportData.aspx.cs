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
    public partial class ExportData : System.Web.UI.Page
    {
        public string k;
        public int kalan_izin_suresi;
        protected void Page_Load(object sender, EventArgs e)
        {

            k = Session["kullaniciAdi"].ToString();
            string connetionString = null;
            SqlConnection cnn;
            connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
            cnn = new SqlConnection(connetionString);
            
            SqlDataAdapter sda1 = new SqlDataAdapter("Select onayRetDurumu, idPersonel from izinForm where idPersonel = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "')" , cnn );
            DataTable dt = new DataTable();
            cnn.Open();
            sda1.Fill(dt);
            cnn.Close();
            //string onaylı = dt.Rows[0][0].ToString();
            try
            {
                SqlDataAdapter sda = new SqlDataAdapter("Select daireBolgeSube, servis, adSoyad, sicilDosyaNo, pozisyon, ucretStatu, iseGirisTarihi, kalanIzinSuresi id from Personel where idKullaniciGiris = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' )", cnn);
                DataTable dt1 = new DataTable();
                cnn.Open();
                sda.Fill(dt1);
                cnn.Close();
                string daireSube = dt1.Rows[0][0].ToString();
                string servisi = dt1.Rows[0][1].ToString();
                string adiSoyadi = dt1.Rows[0][2].ToString();
                string dosyaNo = dt1.Rows[0][3].ToString();
                string pozisyonu = dt1.Rows[0][4].ToString();
                string statu = dt1.Rows[0][5].ToString();
                string iseGirme = dt1.Rows[0][6].ToString();
                string kalanizin = dt1.Rows[0][7].ToString();
                daire.Text = daireSube;
                servis.Text = servisi;
                adSoyad.Text = adiSoyadi;
                sicil.Text = dosyaNo;
                pozisyon.Text = pozisyonu;
                ücret.Text = statu;
                iseGiris.Text = iseGirme;

                //string q2 = "select izinForm.izinTuru, izinForm.yolizni, izinForm.izinSuresi, izinForm.izinBaslangicTarihi, izinForm.izindekiAdres, izinForm.izinHakkiBaslangicTarihi, izinForm.hizmetSuresi, izinForm.izinBitisTarihi, izinForm.idPersonel as personelİzinForm, izinForm.onayRetDurumu, x.idPersonel as Xpers from izinForm inner join (select idPersonel from projePersonelEkleme where idProje in (select idProje from projePersonelEkleme where idPersonel = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idProje) and idPersonel != (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idPersonel) as x on izinForm.idPersonel = x.idPersonel";
                SqlDataAdapter sda2 = new SqlDataAdapter("select izinTuru, yolizni, izinSuresi, izinBaslangicTarihi, izindekiAdres, izinHakkiBaslangicTarihi, hizmetSuresi, izinBitisTarihi, idPersonel from izinForm where idPersonel=(select id from kullaniciGiris where kullaniciAdi='" + Session["kullaniciAdi"] + "') and onayRetDurumu=1", cnn);
                DataTable dt2 = new DataTable();
                cnn.Open();
                sda2.Fill(dt2);
                cnn.Close();
                string tur = dt2.Rows[0][0].ToString();
                string izin = dt2.Rows[0][1].ToString();
                string sure = dt2.Rows[0][2].ToString();
                string baslangic = dt2.Rows[0][3].ToString();
                string adresi = dt2.Rows[0][4].ToString();
                string hakBaslangic = dt2.Rows[0][5].ToString();
                string hizmet = dt2.Rows[0][6].ToString();
                string izinbitis = dt2.Rows[0][7].ToString();
                izinTuru.Text = tur;
                yolizni.Text = izin;
                günsayisi.Text = sure;
                baslama.Text = baslangic;
                adres.Text = adresi;
                izinhakkitarihi.Text = hakBaslangic;
                hizmetsuresi.Text = hizmet;

                int x = Convert.ToInt32(sure);
                string a = Class1.getOzan();
                int t = Convert.ToInt32(a);
                int y = Convert.ToInt32(kalanizin);
            if(t > 0)
                {

                
                if (tur == "Yıllık İzin")
                {
                    kalan_izin_suresi = x + y - t;
                }
                else if (tur == "Evlenme")
                {
                    kalan_izin_suresi = (x + y - 7 - t);
                }
                else if (tur == "Doğum")
                {
                    kalan_izin_suresi = (x + y - 10 - t);
                }
                else if (tur == "Ölüm")
                {
                    kalan_izin_suresi = (x + y - 7 - t);
                }
                else if (tur == "Afet")
                {
                    kalan_izin_suresi = (x + y - 7 - t);
                }
                else if (tur == "Ücretsiz Mazaret")
                {
                    kalan_izin_suresi = (x + y - t);
                }
                else
                {

                }
            }
            else
                {
                    if (tur == "Yıllık İzin")
                    {
                        kalan_izin_suresi = x + y;
                    }
                    else if (tur == "Evlenme")
                    {
                        kalan_izin_suresi = (x + y - 7);
                    }
                    else if (tur == "Doğum")
                    {
                        kalan_izin_suresi = (x + y - 10);
                    }
                    else if (tur == "Ölüm")
                    {
                        kalan_izin_suresi = (x + y - 7);
                    }
                    else if (tur == "Afet")
                    {
                        kalan_izin_suresi = (x + y - 7);
                    }
                    else if (tur == "Ücretsiz Mazaret")
                    {
                        kalan_izin_suresi = (x + y);
                    }
                    else
                    {

                    }
                }
                izinsuresi.Text = kalan_izin_suresi.ToString();
                kullanacagimiktar.Text = sure;
                bakiye.Text = kalanizin;
                izinebaslama.Text = baslangic;
                izindendonme.Text = izinbitis;
            }          
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Onaylı izin Kaydı Bulunamadı'); window.location = '/Employee.aspx';", true);                                
            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {


        }

        
    }
}