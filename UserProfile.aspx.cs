using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Configuration;
using System.IO;

namespace e_Library_mgmt
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string Conx = ConfigurationManager.ConnectionStrings["cLibrary"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["role"]="User";
            GridView.DataBind();
            try
            {
               // Session["Username"] = "";
                //if (Session["Username"].Equals("")) This UserName code creates an endless loop between the 
                // userprofile and UserLogin
               // {
               //     Response.Redirect("userlogin.aspx");
               // }
              //  else 
               // {
             GetUserBookData();

             if (!Page.IsPostBack)
              {
                 GetUserPersonalDetails();
              }

                //}
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + "pageload" + ex.Message + "');</script>");

            }
           
        }
        //Update Button
        protected void Button2_Click(object sender, EventArgs e)
        {
           UpdateUserPersonalDetails();

        }

        void UpdateUserPersonalDetails()
        {
            string password = "";
            if (TextBox9.Text.Trim() == "") //if new password is blank, or didnt change password
            {
                password = TextBox8.Text.Trim(); // Set the password field equal to the old password
            }
            else
            {
                password = TextBox9.Text.Trim();
                //else if there is value, set the new value to the password field, then update
            }

            try
            {
                SqlConnection con = new SqlConnection(Conx);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update member_master_tbl set Full_Name=@Full_Name," +
                    " Date_of_Birth=@Date_of_Birth, Contact_no=@Contact_no, email=@email," +
                    " Province=@Province, city=@city, PinCode=@PinCode, full_address=@full_address," +
                    " password=@password, account_status=@account_status WHERE member_id='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Date_of_Birth", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Province", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details are Updated Successfully');</script>");
                    GetUserPersonalDetails();
                    GetUserBookData();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + "updateUserPersonalDetails" + ex.Message + "');</script>");
            }
        }

        void GetUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(Conx);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox1.Text = dt.Rows[0]["full_name"].ToString();
                TextBox2.Text = dt.Rows[0]["Date_of_Birth"].ToString();
                TextBox3.Text = dt.Rows[0]["contact_no"].ToString();
                TextBox4.Text = dt.Rows[0]["email"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["Province"].ToString().Trim();
                DropDownList2.SelectedValue = dt.Rows[0]["City"].ToString().Trim();
                TextBox5.Text = dt.Rows[0]["pincode"].ToString().Trim();
                TextBox6.Text = dt.Rows[0]["full_address"].ToString();
                TextBox7.Text = dt.Rows[0]["member_id"].ToString();
                TextBox8.Text = dt.Rows[0]["password"].ToString();

                Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-info");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + "getUserPersonalDetails" + ex.Message + "');</script>");

            }
        }

        void GetUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(Conx);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl where memberid='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView.DataSource = dt;
                GridView.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + "getUserBookData" + ex.Message + "');</script>");

            }
        }

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.Tomato;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + "DueDate" + ex.Message + "');</script>");
            }
        }
    }
}