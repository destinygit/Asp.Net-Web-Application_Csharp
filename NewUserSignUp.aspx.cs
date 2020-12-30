using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace e_Library_mgmt
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string conx = ConfigurationManager.ConnectionStrings["cLibrary"].ConnectionString; 
        //ConfigurationManager framework is Creating the communication between the sql and the app, and storing the connectio inside of the Conx variable
        //Using Configurarion manager with connection string stored inside configuration file like web.config or app.config
        //It helps to use configuration structure to manage the connections of my applications,in the instance where the application changes the connection Dbase
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //Sign Up button OnClick event
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckIfMemberExists())
            {
                Response.Write("<script>alert('ID Already Exists!!!, create another ID');</script>");
            }
            else
            {
                SignUpNewUser();
            }
            
        }

        bool CheckIfMemberExists()
        {
            SqlConnection con = new SqlConnection(conx);
            try
            {
                //Create the connection object(con), connects to the (conx) variable string, test if the connection is opens
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Member_Master_tbl where " +
                    "Member_Id='" + TextBox5.Text.Trim() + "';", con); //selects all records where the memberid equals the entry
                //Create sql cmd query, which executes the query through the conection(con) sring created
                SqlDataAdapter da = new SqlDataAdapter(cmd);//Create the da object which reads the command
                DataTable dt = new DataTable();//create a temporary datatable
                da.Fill(dt); //whatever the datareader retrieves, it stores it inside the datatable

                if(dt.Rows.Count >=1) // if the data retrieved in the row is >=1, then return true(meaning there is the record entry)
                {
                    return true; //return an error
                }
                else
                {
                    return false; // SignUp the memeber(signup method)
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }

           
        }

        //User Defined

        void SignUpNewUser()
        {
            SqlConnection con = new SqlConnection(conx);
            try
            { 
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Insert Into Member_Master_tbl(Full_Name,Date_of_Birth,Contact_no,Email,Province,City,PinCode,Full_Address," +
                    "Member_Id,Password,Account_Status) Values(@Full_Name,@Date_of_Birth,@Contact_no,@Email,@Province,@City,@PinCode,@Full_Address,@Member_Id," +
                    "@Password,@Account_Status)", con);
                cmd.Parameters.AddWithValue("@Full_Name", TextBox1.Text.Trim());  //Insert whatever entry from the textbox into the column placeholder
                cmd.Parameters.AddWithValue("@Date_of_Birth", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_no", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Province", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@City", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PinCode", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Full_Address", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Member_Id", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Account_Status", "Pending");

                cmd.ExecuteNonQuery();
               
                Response.Write("<script>alert('Sign Up was Successful');</script>");
                Response.Redirect("UserLogin.aspx",false);
                //string message = "Sign Up was Successful";
                //MessageBox.Show(message);


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}