using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication8
{
    public partial class Admin : System.Web.UI.Page
    {
        
        public DataTable dt3 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connetionString = null;
                SqlConnection cnn;
                connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
                cnn = new SqlConnection(connetionString);

                SqlDataAdapter sda = new SqlDataAdapter("select izinForm.id, Personel.adSoyad , izinForm.izinBaslangicTarihi,izinForm.izinBitisTarihi from izinForm inner join Personel on izinForm.idPersonel=Personel.id where izinForm.onayRetDurumu is NULL ", cnn);
                DataTable dt3 = new DataTable();
                cnn.Open();

                sda.Fill(dt3);
                GridView1.DataSource = dt3;
                GridView1.DataBind();

                SqlDataAdapter sda1 = new SqlDataAdapter("select izinForm.onayRetDurumu,Personel.adSoyad , izinForm.izinBaslangicTarihi,izinForm.izinBitisTarihi from izinForm inner join Personel on izinForm.idPersonel=Personel.id where izinForm.onayRetDurumu = 1 ", cnn);
                DataTable dt4 = new DataTable();
                sda1.Fill(dt4);
                GridView2.DataSource = dt4;
                GridView2.DataBind();

                SqlDataAdapter sda2 = new SqlDataAdapter("select izinForm.onayRetDurumu, Personel.adSoyad , izinForm.izinBaslangicTarihi,izinForm.izinBitisTarihi from izinForm inner join Personel on izinForm.idPersonel=Personel.id where izinForm.onayRetDurumu = 0", cnn);
                DataTable dt5 = new DataTable();
                sda2.Fill(dt5);
                GridView3.DataSource = dt5;
                GridView3.DataBind();

                cnn.Close();
            }
        }
        protected void projeEkle_Click(object sender, EventArgs e)
        {            
            Response.Redirect("ProjectManagement.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "onayla")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string id = row.Cells[0].Text;
                
                string connectionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
                using (SqlConnection connection = new SqlConnection(connectionString))               
                using (SqlCommand command = connection.CreateCommand())
                {

                    command.CommandText = "UPDATE izinForm SET onayRetDurumu = 1 WHERE id=@id";
                    command.Parameters.AddWithValue("@id", id);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    command.CommandText = "UPDATE Personel SET kalanIzinSuresi = (select kalanYillikIzinSuresi from izinForm where id=@id)  where (select idPersonel from izinForm  where id=@id)=id";

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();


                    Thread.Sleep(1_000);
                    MessageBox.Show(this.Page, "İzin Talebi Başırılı Bir Şekilde Onaylandı");
                    
                }

            }
            if(e.CommandName == "reddet")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string id = row.Cells[0].Text;

                string connectionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "UPDATE izinForm SET onayRetDurumu = 0 WHERE id=@id";
                    command.Parameters.AddWithValue("@id", id);
                    connection.Open();
                    command.ExecuteNonQuery();                    
                    connection.Close();

                    Thread.Sleep(1_000);
                    MessageBox.Show(this.Page, "İzin Talebi Başırılı Bir Şekilde Reddedildi");
                }
                
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {          
        }

        protected void cikis_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}