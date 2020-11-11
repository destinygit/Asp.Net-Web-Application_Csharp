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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string Conx = ConfigurationManager.ConnectionStrings["cLibrary"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection Connx = new SqlConnection(Conx);
            try
            {
                //Conx stores the name of the server, the database we want to connect to, the username and password to connct to, provide that informatio to the "SqlConnection(Conx)" object, intergrated security means i am using the windows authentication
                if (Connx.State == ConnectionState.Closed)
                {
                    Connx.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Admin_Login_tbl where " +
                    "Admin_Id = '" + Texbox1.Text.Trim() + "' And Password='" + TextBox2.Text.Trim() + "';", Connx);
                //Execute this command that selects all records from the table, where the adminid and password has to be equal to the entry
                SqlDataReader dr = cmd.ExecuteReader(); // Execute the command, using the con object and return or retrieve the data
                if (dr.HasRows) //Returns the data returned, if it has rows
                {
                    while (dr.Read()) //and while it reads and retrive the row with the relevant data, respond 'login Successful, then redirect to homepage
                    {
                        Response.Write("<script>alert('Login Successful' '"+ dr.GetValue(0).ToString()+"');</script>");

                        Session["Admin_Id"] = dr.GetValue(0).ToString(); //Sessin Variable, global to the entire project, store these values and active within 20 min of being idle
                        Session["Full_Name"] = dr.GetValue(2).ToString();
                        Session["role"] = "admin";

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
               // MessageBox.Show(ex.Message);
                Console.WriteLine("Error on ButtonClick " + ex.Message);
            }
            finally
            {
                Connx.Close();
            }
        }
    }
}