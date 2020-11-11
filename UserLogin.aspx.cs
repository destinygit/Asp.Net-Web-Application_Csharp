using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace e_Library_mgmt
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string Conx = ConfigurationManager.ConnectionStrings["cLibrary"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = "";

        }
        //Login Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection Connx = new SqlConnection(Conx);
            try
            {

                if (Connx.State == ConnectionState.Closed)
                {
                    Connx.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Member_Master_tbl where " +
                    "Member_Id = '" + Texbox1.Text.Trim() + "' And Password='" + TextBox2.Text.Trim() + "';", Connx);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successful' '" + dr.GetValue(8).ToString() + "');</script>");


                        Session["Username"] = dr.GetValue(8).ToString();
                        Session["Full_Name"] = dr.GetValue(0).ToString();
                        Session["Status"] = dr.GetValue(10).ToString();
                        Session["role"] = "User";

                        Response.Redirect("homepage.aspx", false);


                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials');</script>");
                }


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                Connx.Close();
            }
        }
    }
}