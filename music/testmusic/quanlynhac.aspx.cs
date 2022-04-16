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
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dataload();
        }
        void dataload()
        {

            string strConnString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = " SELECT *FROM tblAccount";
                    cmd.Connection = con;
                    con.Open();
                    rpp.DataSource = cmd.ExecuteReader();
                    rpp.DataBind();
                    con.Close();
                }
            }

        }

    }
}