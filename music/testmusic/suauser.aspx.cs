using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testmusic
{
    public partial class suauser : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string iduser = Request.QueryString["id"];
            lb1.Text += iduser.ToString();
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT *FROM tblAccount where IDacount= '" + lb1.Text + "' ";


                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if(reader.HasRows)
                    {
                        while(reader.Read())
                        {
                            //txtNgaysinh.Text = String.Format("{0:MM/dd/yyyy}",reader["ngaysinh"]);
                            txtNgaysinh.Text = (Convert.ToDateTime(reader["ngaysinh"]).ToString("yyyy-MM-dd"));
                            txtName.Text = reader["name"].ToString();
                            txtGioitinh.Text = reader["gioitinh"].ToString();
                            txtEmail.Text = reader["email"].ToString();
                            
                        }
                    }
                    con.Close();
                }
            }
        }

        

        protected void btnSua_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "updateuser";
                    cmd.Parameters.AddWithValue("@id", lb1.Text);
                    cmd.Parameters.AddWithValue("@name", txtName.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@ngaysinh", Convert.ToDateTime(txtNgaysinh.Text));
                    cmd.Parameters.AddWithValue("@gioitinh", txtGioitinh.SelectedItem.ToString());
                   
                    int i = cmd.ExecuteNonQuery();
                    {
                        if (i > 0)
                        {
                            Label1.Text = "Thay Đổi Thành Công";



                        }
                        else
                        {
                            Label1.Text = "*Thay Đổi  Không Thành Công";

                        }
                    }

                }
            }
        }
    

        
    }
}