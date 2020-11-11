using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace e_Library_mgmt
{
    public partial class StaticStructure : System.Web.UI.MasterPage
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            

            try
            {

                if (Session["role"].Equals(""))
                {

                    LinkButton2.Visible = true;  //User Login
                    LinkButton3.Visible = true;  //SignUp

                    LinkButton1.Visible = true;  //View Books



                    LinkButton4.Visible = false;  //Logout
                    LinkButton5.Visible = false;  //Hi User

                    LinkButton6.Visible = true;  //Admin Login

                    LinkButton7.Visible = false;  //Author Management
                    LinkButton8.Visible = false;  //Publisher Management
                    LinkButton9.Visible = false;  //Book Inventory
                    LinkButton10.Visible = false;  //Book Issuing
                    LinkButton11.Visible = false;  //Member Management

                }
                else if (Session["role"].Equals("User"))
                {
                    LinkButton1.Visible = true;  //View Books

                    LinkButton2.Visible = false;  //User Login
                    LinkButton3.Visible = false;  //SignUp

                    LinkButton4.Visible = true;  //Logout
                    LinkButton5.Visible = true;  //Hi User
                    //LinkButton5.Text = "Hi User";
                    LinkButton5.Text = "Hi " + Session["Username"].ToString();

                    LinkButton6.Visible = true;  //Admin Login

                    LinkButton7.Visible = false;  //Author Management
                    LinkButton8.Visible = false;  //Publisher Management
                    LinkButton9.Visible = false;  //Book Inventory
                    LinkButton10.Visible = false;  //Book Issuing
                    LinkButton11.Visible = false;  //Member Management
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = true;  //View Books

                    LinkButton2.Visible = false;  //User Login
                    LinkButton3.Visible = false;  //SignUp

                    LinkButton4.Visible = true;  //Logout
                    LinkButton5.Visible = true;  //Hi User
                    LinkButton5.Text = "Hello " + Session["Admin_Id"].ToString();
                    //LinkButton5.Text = "Hello admin";

                    LinkButton6.Visible = false;  //Admin Login

                    LinkButton7.Visible = true;  //Author Management
                    LinkButton8.Visible = true;  //Publisher Management
                    LinkButton9.Visible = true;  //Book Inventory
                    LinkButton10.Visible = true;  //Book Issuing
                    LinkButton11.Visible = true;  //Member Management
                }

            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuthorManagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("PublisherManagement.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookInventory.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookIssue.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMembermgmt.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewUserSignUp.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBooks.aspx");
        }

        protected void LinkButton4_Click1(object sender, EventArgs e)
        {
            Session["role"] = "";
            Session["Username"] ="";
            Session["Full_Name"] = "";
            Session["Status"] = "";


            LinkButton2.Visible = true;  //User Login
            LinkButton3.Visible = true;  //SignUp

            LinkButton1.Visible = true;  //View Books



            LinkButton4.Visible = false;  //Logout
            LinkButton5.Visible = false;  //Hi User

            LinkButton6.Visible = true;  //Admin Login

            LinkButton7.Visible = false;  //Author Management
            LinkButton8.Visible = false;  //Publisher Management
            LinkButton9.Visible = false;  //Book Inventory
            LinkButton10.Visible = false;  //Book Issuing
            LinkButton11.Visible = false;  //Member Management

            Response.Redirect("homepage.aspx", false);
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }
    }
}