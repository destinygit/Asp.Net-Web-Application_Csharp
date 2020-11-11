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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string Conx = ConfigurationManager.ConnectionStrings["cLibrary"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = "admin";
            GridView1.DataBind();
        }
        //Search Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetMemberByID();
        }
        void GetMemberByID()
        {
            SqlConnection Connx = new SqlConnection(Conx);
            try
            {
                
                if (Connx.State == ConnectionState.Closed)
                {
                    Connx.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Member_Master_tbl where " +
                    "Member_Id = '" + TextBox1.Text.Trim() + "'", Connx);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows) //if dr gets any rows with memeberid=entry
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString(); 
                        //get the value from the dr object, retrieve the first placeholder value, and store it in the textbox
                        TextBox3.Text = dr.GetValue(10).ToString();
                        TextBox4.Text = dr.GetValue(1).ToString();
                        TextBox5.Text = dr.GetValue(2).ToString();
                        TextBox6.Text = dr.GetValue(3).ToString();
                        TextBox7.Text = dr.GetValue(4).ToString();
                        TextBox8.Text = dr.GetValue(5).ToString();
                        TextBox9.Text = dr.GetValue(6).ToString();
                        TextBox10.Text = dr.GetValue(7).ToString();

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
    
        //Active
        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusbyID("active");
        }
        //Pending
        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusbyID("pending");
        }
        //Deactivate
        protected void Button4_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusbyID("deactive");
        }

        void UpdateMemberStatusbyID(string status)
        {

            SqlConnection Connx = new SqlConnection(Conx);
            try
            {
                if (Connx.State == ConnectionState.Closed)
                {
                    Connx.Open();
                }
                SqlCommand cmd = new SqlCommand("Update Member_Master_tbl Set Account_Status='"+status+"'" +
                    " where Member_Id = '" + TextBox1.Text.Trim() + "'", Connx);
                //Update Acc stautus with the set parameter, where memberid=entry
                cmd.ExecuteNonQuery(); //execute statement against connx
                GridView1.DataBind();
                Response.Write("<script>alert('Member Status Updated');</script>");


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
        //DeleteUser
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (CheckIfMemberExists())
            {
                DeleteUser();
            }
            else
            {
                Response.Write("<script>alert('Member doesn't Exists!!');</script>");

            }
        }
      
        void DeleteUser()
        {
            SqlConnection con = new SqlConnection(Conx);
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Delete from Member_Master_tbl " +
                    "Where Member_Id= '" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery(); 
                Response.Write("<script>alert('Member Deleted Successfully');</script>");
                ClearForm();
                GridView1.DataBind(); //Bind Datasource to the gridview
                //Response.Redirect("homepage.aspx", false);
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
        bool CheckIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(Conx);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Member_Master_tbl where " +
                    "Member_Id='" + TextBox1.Text.Trim() + "';", con); //Tsqlcmmd to execute against the sql database
                SqlDataAdapter da = new SqlDataAdapter(cmd); //Disconnected connection model, open and closes the connection
                DataTable dt = new DataTable(); //Create Datatable object to temporarily store the executed cmd
                da.Fill(dt); //

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }

        void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
        }
    }
}