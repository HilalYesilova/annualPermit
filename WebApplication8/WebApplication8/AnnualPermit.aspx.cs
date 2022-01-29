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
    public partial class AnnualPermit : System.Web.UI.Page
    {
        public string k;
        public DateTime maxDate;
        public DateTime minDate;
        public DateTime bas;
        public DateTime son;
        public int cakismasuresi;
        public int result;
        public int result2;
        public int cakisma;
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem("Seçiniz", null));
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            k = Session["kullaniciAdi"].ToString();
            string connetionString = null;
            SqlConnection cnn;
            connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
            cnn = new SqlConnection(connetionString);
            SqlDataAdapter sda = new SqlDataAdapter("Select iseGirisTarihi, id from Personel where idKullaniciGiris = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' )", cnn);
            DataTable dt3 = new DataTable();
            cnn.Open();
            sda.Fill(dt3);
            cnn.Close();


            string x = dt3.Rows[0][0].ToString();
            if (x.Split('.')[0].Length == 1)
            {
                x = '0' + x;
            }
            string currentYear = DateTime.Now.Year.ToString();
            string izinHakkiTarihi = currentYear + "-" + x.Substring(3, 2) + "-" + x.Substring(0, 2);

            string hizmetSuresi = (Convert.ToInt32(currentYear) - Convert.ToInt32(x.Substring(6, 4))).ToString();

            SqlDataAdapter sda2 = new SqlDataAdapter("Select kalanIzinSuresi from Personel where idKullaniciGiris = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' )", cnn);
            DataTable dt4 = new DataTable();
            cnn.Open();
            sda2.Fill(dt4);
            cnn.Close();
            string toplam_izin = dt4.Rows[0][0].ToString();
            int kalan_izin_suresi = Convert.ToInt32(dt4.Rows[0][0].ToString());

            int izin_suresi = Convert.ToInt32(TextBox3.Text);

            if (DropDownList1.SelectedItem.Value == "Yıllık İzin")
            {
                kalan_izin_suresi = (Convert.ToInt32(toplam_izin) - izin_suresi);
            }
            else if (DropDownList1.SelectedItem.Value == "Evlenme")
            {
                kalan_izin_suresi = (Convert.ToInt32(toplam_izin) - izin_suresi + 7);
            }
            else if (DropDownList1.SelectedItem.Value == "Doğum")
            {
                kalan_izin_suresi = (Convert.ToInt32(toplam_izin) - izin_suresi + 10);
            }
            else if (DropDownList1.SelectedItem.Value == "Ölüm")
            {
                kalan_izin_suresi = (Convert.ToInt32(toplam_izin) - izin_suresi + 7);
            }
            else if (DropDownList1.SelectedItem.Value == "Afet")
            {
                kalan_izin_suresi = (Convert.ToInt32(toplam_izin) - izin_suresi + 7);
            }
            else if (DropDownList1.SelectedItem.Value == "Ücretsiz Mazaret")
            {
                kalan_izin_suresi = (Convert.ToInt32(toplam_izin) - izin_suresi);
            }
            else
            {

            }

            string izinBitisTarihi = Calendar1.SelectedDate.AddDays(Convert.ToInt32(TextBox3.Text)).ToString().Substring(0, 10).Replace('.', '-');
            if (izinBitisTarihi.Split('-')[0].Length == 1)
            {
                izinBitisTarihi = '0' + izinBitisTarihi;
            }
            //string izinBitisTarihi = Calendar1.SelectedDate.AddDays(Convert.ToInt32(TextBox3.Text)).ToString().Substring(0, 10).Replace('.', '-');
            string izinBitisTarihi2 = izinBitisTarihi.Substring(6, 4) + '-' + izinBitisTarihi.Substring(3, 2) + '-' + izinBitisTarihi.Substring(0, 2);
            string id_personel = dt3.Rows[0][1].ToString();
            //DateTime date = new DateTime();
            String date = DateTime.Now.ToString();
            //date.ToString.
            if (date.Split('.')[0].Length == 1)
            {
                date = '0' + date;
            }

            string currentDate = date.ToString().Substring(0, 10).Replace('.', '-').Substring(6, 4) + '-' + date.ToString().Substring(3, 2) + '-' + date.ToString().Substring(0, 2);
            string secilenTarih2 = Calendar1.SelectedDate.Day.ToString() + '-' + Calendar1.SelectedDate.Month.ToString() + '-' + Calendar1.SelectedDate.Year.ToString();
            if (secilenTarih2.Split('-')[0].Length == 1)
            {
                secilenTarih2 = '0' + secilenTarih2;
            }
            string yedek;
            if (secilenTarih2.Split('-')[1].Length == 1)
            {
                yedek = secilenTarih2.Split('-')[0] + "-" + "0" + secilenTarih2.Split('-')[1] + "-" + secilenTarih2.Split('-')[2];
                secilenTarih2 = yedek;
            }

            string secilenTarih = secilenTarih2.Substring(6, 4) + '-' + secilenTarih2.Substring(3, 2) + '-' + secilenTarih2.Substring(0, 2);


            connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
            cnn = new SqlConnection(connetionString);
            //TextBox5.Text = "select count(*) from(select izinForm.izinBaslangicTarihi, izinForm.izinBitisTarihi, izinForm.idPersonel as personelİzinForm, izinForm.onayRetDurumu, x.idPersonel as Xpers from izinForm inner join (select idPersonel from projePersonelEkleme where idProje in (select idProje from projePersonelEkleme where idPersonel = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idProje) and idPersonel != (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idPersonel) as x on izinForm.idPersonel = x.idPersonel where izinForm.izinBitisTarihi > (SELECT CAST(GETDATE() AS Date)) and izinForm.onayRetDurumu = 1) as Tarihler where(Tarihler.izinBaslangicTarihi >= '" + secilenTarih + "' and Tarihler.izinBaslangicTarihi <= '" + izinBitisTarihi2 + ")' or('" + secilenTarih + "' >= Tarihler.izinBaslangicTarihi and '" + izinBitisTarihi2 + "' <= Tarihler.izinBitisTarihi))";

            DataTable dt5 = new DataTable();
            SqlDataAdapter sda3 = new SqlDataAdapter("select count(*) from(select izinForm.izinBaslangicTarihi, izinForm.izinBitisTarihi, izinForm.idPersonel as personelİzinForm, izinForm.onayRetDurumu, x.idPersonel as Xpers from izinForm inner join (select idPersonel from projePersonelEkleme where idProje in (select idProje from projePersonelEkleme where idPersonel = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idProje) and idPersonel != (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idPersonel) as x on izinForm.idPersonel = x.idPersonel where izinForm.izinBitisTarihi > (SELECT CAST(GETDATE() AS Date)) and izinForm.onayRetDurumu = 1) as Tarihler where(Tarihler.izinBaslangicTarihi >= '" + secilenTarih + "' and Tarihler.izinBaslangicTarihi <= '" + izinBitisTarihi2 + "') or('" + secilenTarih + "' >= Tarihler.izinBaslangicTarihi and '" + izinBitisTarihi2 + "' <= Tarihler.izinBitisTarihi)", cnn);
            cnn.Open();
            sda3.Fill(dt5);
            cnn.Close();

            connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
            cnn = new SqlConnection(connetionString);
            //TextBox5.Text = "select count(*) from(select izinForm.izinBaslangicTarihi, izinForm.izinBitisTarihi, izinForm.idPersonel as personelİzinForm, izinForm.onayRetDurumu, x.idPersonel as Xpers from izinForm inner join (select idPersonel from projePersonelEkleme where idProje in (select idProje from projePersonelEkleme where idPersonel = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idProje) and idPersonel != (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idPersonel) as x on izinForm.idPersonel = x.idPersonel where izinForm.izinBitisTarihi > (SELECT CAST(GETDATE() AS Date)) and izinForm.onayRetDurumu = 1) as Tarihler where(Tarihler.izinBaslangicTarihi >= '" + secilenTarih + "' and Tarihler.izinBaslangicTarihi <= '" + izinBitisTarihi2 + ")' or('" + secilenTarih + "' >= Tarihler.izinBaslangicTarihi and '" + izinBitisTarihi2 + "' <= Tarihler.izinBitisTarihi))";
            string query3 = "select ozelGunBaslangic as Tarih from ozelGun where ozelGun.ozelGunBaslangic between '" + secilenTarih + "' and '" + izinBitisTarihi2 + "' or ozelGunBitis between '" + secilenTarih + "' and '" + izinBitisTarihi2 + "'";
            //TextBox2.Text = query;
            DataTable dt6 = new DataTable();
            SqlDataAdapter sda4 = new SqlDataAdapter(query3, cnn);

            cnn.Open();
            sda4.Fill(dt6);
            cnn.Close();
            //minDate = Convert.ToDateTime(dt6.Rows[0][0]);

            connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
            cnn = new SqlConnection(connetionString);
            //TextBox5.Text = "select count(*) from(select izinForm.izinBaslangicTarihi, izinForm.izinBitisTarihi, izinForm.idPersonel as personelİzinForm, izinForm.onayRetDurumu, x.idPersonel as Xpers from izinForm inner join (select idPersonel from projePersonelEkleme where idProje in (select idProje from projePersonelEkleme where idPersonel = (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idProje) and idPersonel != (select id from kullaniciGiris where kullaniciAdi = '" + Session["kullaniciAdi"] + "' ) group by idPersonel) as x on izinForm.idPersonel = x.idPersonel where izinForm.izinBitisTarihi > (SELECT CAST(GETDATE() AS Date)) and izinForm.onayRetDurumu = 1) as Tarihler where(Tarihler.izinBaslangicTarihi >= '" + secilenTarih + "' and Tarihler.izinBaslangicTarihi <= '" + izinBitisTarihi2 + ")' or('" + secilenTarih + "' >= Tarihler.izinBaslangicTarihi and '" + izinBitisTarihi2 + "' <= Tarihler.izinBitisTarihi))";
            string query4 = "select ozelGunBitis as Tarih from ozelGun where ozelGun.ozelGunBaslangic between '" + secilenTarih + "' and '" + izinBitisTarihi2 + "' or ozelGunBitis between '" + secilenTarih + "' and '" + izinBitisTarihi2 + "'";
            //TextBox2.Text = query;
            DataTable dt7 = new DataTable();
            SqlDataAdapter sda5 = new SqlDataAdapter(query4, cnn);

            cnn.Open();
            sda5.Fill(dt7);
            cnn.Close();
            //maxDate = Convert.ToDateTime(dt7.Rows[0][0]);

            try
            {
                minDate = Convert.ToDateTime(dt6.Rows[0][0]);
                maxDate = Convert.ToDateTime(dt7.Rows[0][0]);
                int result = DateTime.Compare(minDate, Convert.ToDateTime(secilenTarih));
                if (result == 1)
                {
                    bas = minDate;
                }
                else
                {
                    bas = Convert.ToDateTime(secilenTarih);
                }

                int result2 = DateTime.Compare(maxDate, Convert.ToDateTime(izinBitisTarihi));
                if (result == 1)
                {
                    son = maxDate;
                }
                else
                {
                    son = Convert.ToDateTime(izinBitisTarihi);
                }

                TimeSpan span = son.Subtract(bas);
                cakismasuresi = span.Days + 1;
            }
            catch
            {
                cakismasuresi = 0;
            }
            Class1.setOzan(cakismasuresi.ToString());
            kalan_izin_suresi = kalan_izin_suresi + cakismasuresi;


            if (dt5.Rows[0][0].ToString() == "0" && kalan_izin_suresi>=0)
            {
                string query = "insert into izinForm(izinTuru, yolizni,izinSuresi,izinBaslangicTarihi, izindekiAdres, " +
                "izinHakkiBaslangicTarihi, hizmetSuresi, toplamIzinMuddeti, kalanYillikIzinSuresi, izinBitisTarihi, " +
                "ekleyenKullanici, eklenmeTarihi,idPersonel) values ('" + DropDownList1.SelectedItem.Value + "'," + Convert.ToInt32(TextBox2.Text) +
                ",'" + TextBox3.Text + "','" + secilenTarih + "','" + TextBox5.Text + "','" + izinHakkiTarihi + "'," + hizmetSuresi
                + "," + toplam_izin + "," + kalan_izin_suresi.ToString() + ",'" + izinBitisTarihi2 + "'," + id_personel + ",'" + currentDate + "'," +
                id_personel + ")";

                cnn.Open();
                try
                {
                    SqlCommand command = new SqlCommand(query, cnn);
                    command.ExecuteNonQuery();
                    MessageBox.Show(this.Page, "İzin Kaydı Başarılı Bir Şekilde Oluşturuldu");

                }
                catch (Exception error)
                {
                    MessageBox.Show(this.Page, "İzin Kaydı Oluşturulamadı");
                }
                finally
                {
                    cnn.Close();
                }
            }
            else
            {
                MessageBox.Show(this.Page, "Çakıştı ya da İzin hakkı doldu");
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(TextBox2.Text)<=0)
            {
                MessageBox.Show(this.Page, "Negatif Değer Girilemez");
                this.TextBox2.Text = "";                
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(TextBox3.Text) <= 0)
            {
                MessageBox.Show(this.Page, "Negatif Değer Girilemez");
                this.TextBox3.Text = "";
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee.aspx");
        }
    }
}