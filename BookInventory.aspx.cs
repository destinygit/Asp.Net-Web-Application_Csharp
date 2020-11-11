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
    public partial class WebForm9 : System.Web.UI.Page
    {
        string Conx = ConfigurationManager.ConnectionStrings["cLibrary"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillauthorpublishervalues();
            }

            Session["role"] = "admin";
            GridView1.DataBind();
        }
        //Search Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetBookID();
        }
        void GetBookID()
        {
            try
            {
                SqlConnection Connx = new SqlConnection(Conx);
                if (Connx.State == ConnectionState.Closed)
                {
                    Connx.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Book_Master_tbl where " +
                    "Book_Id = '" + TextBox1.Text.Trim() + "'", Connx);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >=1) //if dt datatable gets a row with the entered value
                {

                    TextBox2.Text = dt.Rows[0]["Book_name"].ToString();
                    TextBox3.Text = dt.Rows[0]["Published_Date"].ToString();
                    TextBox4.Text = dt.Rows[0]["Edition"].ToString();
                    TextBox5.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["No_of_Pages"].ToString().Trim();
                    TextBox7.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox8.Text = dt.Rows[0]["Current_Stock"].ToString().Trim();
                    TextBox10.Text = dt.Rows[0]["Book_Description"].ToString();
                    TextBox9.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["Language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["Publisher_Name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["Author_Name"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] Genre = dt.Rows[0]["Genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < Genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == Genre[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["Current_Stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["Book_img_Link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials');</script>");
                }


            }
            catch (Exception ex)
            {
                MessageBox.Show("GetBookID" + ex.Message);
            }
        }
        //Add Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExists())
            {
                Response.Write("<script>alert('Book ID Exists, Create another ID');</script>");
            }
            else
            {
                AddBooks();
            }
        }
        void AddBooks()
        {
            try
            {

                //Genre multi-Selection
                string Genre = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    Genre = Genre + ListBox1.Items[i] + ",";
                }
                //Genre=Adventure,Self Help,
                Genre = Genre.Remove(Genre.Length - 1);

                //File-Upload

                string filepath = "~/Book_Inventory/book-wallpaper-full-hd-1920x1080-128859.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Book_Inventory/" + filename));
                filepath = "~/Book_Inventory/" + filename;

                SqlConnection con = new SqlConnection(Conx);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Insert Into Book_Master_tbl(Book_Id,Book_Name,Genre,Author_Name,Publisher_Name,Published_Date,Language,Edition," +
                    "Book_Cost,No_of_Pages,Book_Description,Actual_Stock,Current_Stock,Book_img_Link) Values(@Book_Id,@Book_Name,@Genre,@Author_Name,@Publisher_Name,@Published_Date," +
                    "@Language,@Edition,@Book_Cost,@No_of_Pages,@Book_Description,@Actual_Stock,@Current_Stock," +
                    "@Book_img_Link)", con);

                cmd.Parameters.AddWithValue("@Book_Id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Genre", Genre);
                cmd.Parameters.AddWithValue("@Author_Name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Publisher_Name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Published_Date", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Edition", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Cost", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Actual_Stock", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@Current_Stock", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_img_Link", filepath);
                cmd.Parameters.AddWithValue("@No_of_Pages", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Description", TextBox10.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Added Successful');</script>");
                ClearForm();
                GridView1.DataBind();
                //Response.Redirect("homepage.aspx", false);
                //string message = "Sign Up was Successful";
                //MessageBox.Show(message);


            }
            catch (Exception ex)
            {
                MessageBox.Show("AddBooks" + ex.Message);
            }
        }
        //Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateBookByID();
        }
        void UpdateBookByID()
        {

            if (CheckIfBookExists())
            {
                try
                {

                    int actual_stock = Convert.ToInt32(TextBox7.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox8.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBox8.Text = "" + current_stock;
                        }
                    }

                    string Genre = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        Genre = Genre + ListBox1.Items[i] + ",";
                    }
                    Genre = Genre.Remove(Genre.Length - 1);

                    string filepath = "~/book_inventory/books1";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(Conx);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Book_Master_tbl set book_name=@book_name, Genre=@Genre," +
                        " author_name=@author_name, publisher_name=@publisher_name, Published_Date=@Published_Date," +
                        " language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages," +
                        " book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock," +
                        " book_img_link=@book_img_link where book_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Genre", Genre);
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@published_date", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Book Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + "UpdateBookByID" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }
        //Delete Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            DeleteBookByID();
        }
        void DeleteBookByID()
        {
            if (CheckIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(Conx);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Deleted Successfully');</script>");
                    ClearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + "DeleteBookByID" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        void fillauthorpublishervalues()
        {
            try
            {
                SqlConnection Connx = new SqlConnection(Conx);
                if (Connx.State == ConnectionState.Closed)
                {
                    Connx.Open();
                }
                SqlCommand cmd = new SqlCommand("Select Author_Name from Author_Master_tbl;", Connx);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "Author_Name";
                DropDownList3.DataBind();

                SqlCommand cmdr = new SqlCommand("Select Publisher_Name from Publisher_Master_tbl;", Connx);
                SqlDataAdapter dar = new SqlDataAdapter(cmdr);
                DataTable dtr = new DataTable();
                dar.Fill(dtr);
                DropDownList2.DataSource = dtr;
                DropDownList2.DataValueField = "Publisher_Name";
                DropDownList2.DataBind();

            }
            catch (Exception ex)
            {
                MessageBox.Show("fillauthorpublishervalues" + ex.Message);
            }
        }
        bool CheckIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(Conx);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Book_Master_tbl where " +
                    "Book_Id='" + TextBox1.Text.Trim() + "';", con);
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
                MessageBox.Show("CheckIfBookExists" + ex.Message);
                return false;
            }
        }

        void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            ListBox1.ClearSelection();
            DropDownList3.ClearSelection();
            DropDownList2.ClearSelection();
            TextBox3.Text = "";
            DropDownList1.ClearSelection();
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox6.Text = "";
            TextBox10.Text ="";
        }

       
    }
}