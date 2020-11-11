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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string Conx = ConfigurationManager.ConnectionStrings["cLibrary"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            Session["role"] = "admin";
        }
        //Add Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckIfPublisherExists())
            {
                Response.Write("<script>alert('ID Already Exists!!! Create Another ID');</script>");
            }
            else
            {
                AddPublisher();
            }
           
            }
        //Author Check
        bool CheckIfPublisherExists()
        {
            SqlConnection con = new SqlConnection(Conx);
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Publisher_Master_tbl where " +
                    "PublisherId='" + TextBox1.Text.Trim() + "';", con);
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

        void AddPublisher()
        {
            SqlConnection con = new SqlConnection(Conx);
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Insert Into Publisher_Master_tbl (PublisherId, Publisher_Name) Values(@PublisherId," +
                    " @Publisher_Name)", con);
                cmd.Parameters.AddWithValue("@PublisherId", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Publisher_Name", TextBox2.Text.Trim());


                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Publisher added Successfully');</script>");
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
            if (CheckIfPublisherExists())
            {
                UpdatePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher doesnt Exists!!');</script>");
               
            }
        }
        void UpdatePublisher()
        {
            SqlConnection con = new SqlConnection(Conx);
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Update Publisher_Master_tbl Set Publisher_Name = @Publisher_Name" +
                    " Where PublisherId = '" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@Publisher_Name", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
              
                Response.Write("<script>alert('Publisher Updated Successfully');</script>");
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
            if (CheckIfPublisherExists())
            {
                DeletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher doesnt Exists!!');</script>");

            }
        }
        void DeletePublisher()
        {
            SqlConnection con = new SqlConnection(Conx);
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Delete from Publisher_Master_tbl " +
                    "Where PublisherId= '" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Publisher Deleted Successfully');</script>");
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
        //Search Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetPublisherByID();
        }
        void GetPublisherByID()
        {
            try
            {
                SqlConnection Connx = new SqlConnection(Conx);
                if (Connx.State == ConnectionState.Closed)
                {
                    Connx.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Publisher_Master_tbl where " +
                    "PublisherId = '" + TextBox1.Text.Trim() + "'", Connx);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows) //if dr gets any rows
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(1).ToString();
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