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
    public partial class Login : System.Web.UI.Page
    {
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            string kad, ksifre;
            kad = txtAd.Text;
            ksifre = txtSifre.Text;       
            string connetionString = null;
            SqlConnection cnn;
            connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
            cnn = new SqlConnection(connetionString);
            SqlDataAdapter sda = new SqlDataAdapter("Select sifre,kullaniciTuru from kullaniciGiris where kullaniciAdi='" + kad + "'", cnn);
            DataTable dt = new DataTable();
            int flag = 0;
            int flag2 = 0;
            try
            {
                cnn.Open();
                sda.Fill(dt);

                foreach (DataRow dataRow in dt.Rows)
                {
                    foreach (var item in dataRow.ItemArray)
                    {

                        lblDurum.Text = item.ToString();
                        if (item.ToString() == ksifre)
                        {
                            flag = 1;
                        }

                        if (item.ToString() == "yonetici")
                        {
                            flag = 2;
                            flag2 = 1;
                        }
                        else if (item.ToString() == "personel")
                        {
                            flag2 = 1;
                        }

                        if (flag2 == 1)
                        {
                            if (flag == 2)
                            {
                                Session.Add("kullaniciAdi", kad);

                                Response.Redirect("Admin.aspx");
                            }
                            else if (flag == 1)
                            {
                                Session.Add("kullaniciAdi", kad);

                                Response.Redirect("Employee.aspx");
                            }
                        }
                    }
                    break;
                }
            }
            catch (SqlException se)
            {
                lblDurum.Text = "ERRORRRRR -> {0}" + se.ToString();
                
            }
            finally
            {
                cnn.Close();
            }

            if (flag == 0) lblDurum.Text = "Giriş Başarısız";

        }

        protected void txtAd_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSifre_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
    public static class MessageBox
    {
        public static void Show(this Page Page, String Message)
        {
            Page.ClientScript.RegisterStartupScript(
               Page.GetType(),
               "MessageBox",
               "<script language='javascript'>alert('" + Message + "');</script>"
            );
        }
    }

}
