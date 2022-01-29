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
    public partial class ProjectManagement : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                this.BindGrid();
                string connetionString = null;
                connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
                using (SqlConnection cnn = new SqlConnection(connetionString))
                {
                    SqlCommand cmd = new SqlCommand("Select id, projeAdi from projeEkle", cnn);
                    cnn.Open();

                    DropDownList1.DataSource = cmd.ExecuteReader();
                    DropDownList1.DataTextField = "projeAdi";
                    DropDownList1.DataValueField = "id";
                    DropDownList1.Items.Insert(0, new ListItem("Seçiniz", null));
                    DropDownList1.DataBind();
                }
                using (SqlConnection cnn2 = new SqlConnection(connetionString))
                {

                    SqlCommand cmd2 = new SqlCommand("Select id, adSoyad from Personel", cnn2);
                    cnn2.Open();

                    DropDownList2.DataSource = cmd2.ExecuteReader();
                    DropDownList2.DataTextField = "adSoyad";
                    DropDownList2.DataValueField = "id";
                    DropDownList2.Items.Insert(0, new ListItem("Seçiniz", null));
                    DropDownList2.DataBind();

                }
            }
        }
        private void BindGrid()
        {
            string connetionString = null;
            connetionString = "Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT projeEkle.projeAdi, Personel.adSoyad FROM projePersonelEkleme INNER JOIN projeEkle ON projePersonelEkleme.idProje = projeEkle.id INNER JOIN Personel ON projePersonelEkleme.idPersonel = Personel.id"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }
        protected void GridView1_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            int userId = 0;
            SqlConnection con = new SqlConnection("Data Source = DESKTOP-UI3GIO6\\SQLEXPRESS; Initial Catalog = stajDB; Trusted_Connection = True;");
            SqlCommand cmd = new SqlCommand("Insert into projePersonelEkleme values(@idProje, @idPersonel); SELECT CAST(scope_identity() AS int)", con);
            cmd.Parameters.AddWithValue("@idProje", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@idPersonel", DropDownList2.SelectedItem.Value);

            con.Open();
            userId = (int)cmd.ExecuteScalar();
            Thread.Sleep(1_000);
            MessageBox.Show(this.Page, "Yeni Kayıt Başarılı");

            con.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }
}