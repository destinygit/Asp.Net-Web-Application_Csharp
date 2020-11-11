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
    public partial class WebForm5 : System.Web.UI.Page
    {
        string Conx = ConfigurationManager.ConnectionStrings["cLibrary"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            GridView1.DataBind();
            //GridView1.UseAccessibleHeader = true;
            //GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            Session["role"] = "admin";
            
        }
        //Add Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckIfAuthorExists())
            {
                Response.Write("<script>alert('ID Already Exists!!! Create Another ID');</script>");
            }
            else
            {
                AddAuthor();
            }
        }

        //Author Check
        bool CheckIfAuthorExists()
        {
            SqlConnection con = new SqlConnection(Conx);
            try
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Author_Master_tbl where " +
                    "AuthorId='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

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

        void AddAuthor()
        {
            SqlConnection con = new SqlConnection(Conx);
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Insert Into Author_Master_tbl (AuthorId,Author_Name) Values(@AuthorId," +
                    " @Author_name)", con);

                cmd.Parameters.AddWithValue("@AuthorId", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Author_name", TextBox2.Text.Trim());


                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Author added Successfully');</script>");
                ClearForm();
                GridView1.DataBind();
                //GridView1.UseAccessibleHeader = true;
                //GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
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

        //Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckIfAuthorExists())
            {
                UpdateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author doesnt Exists!!');</script>");
               
            }
        }

        void UpdateAuthor()
        {
            SqlConnection con = new SqlConnection(Conx);
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Update Author_Master_tbl Set Author_Name = @Author_Name" +
                    " Where AuthorId= '"+TextBox1.Text.Trim()+"'", con); //Cant update primary key, but update it through the key specifications

                cmd.Parameters.AddWithValue("@Author_Name", TextBox2.Text.Trim());


                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Author Updated Successfully');</script>");
                ClearForm();
                GridView1.DataBind();
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
        //Delete Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckIfAuthorExists())
            {
                DeleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author doesnt Exists!!');</script>");

            }
        }
        void DeleteAuthor()
        {
            SqlConnection con = new SqlConnection(Conx);
            try
            { 
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Delete from Author_Master_tbl " +
                    "Where AuthorId= '" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Author Deleted Successfully');</script>");
                ClearForm();
                GridView1.DataBind();
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

        void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
        //Search button
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetAuthorByID();
        }
        void GetAuthorByID()
        {
            try
            {
                SqlConnection Connx = new SqlConnection(Conx);
                if (Connx.State == ConnectionState.Closed)
                {
                    Connx.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Author_Master_tbl where " +
                    "AuthorId = '" + TextBox1.Text.Trim() + "'", Connx);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows) //if dr gets any rows
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(1).ToString(); 
                        //Get the seconf colum value with authorid=entry and set it inside the textbox
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
        }
        }
}