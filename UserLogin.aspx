<%@ Page Title="" Language="C#" MasterPageFile="~/StaticStructure.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="e_Library_mgmt.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="container">
       <div class="row">
           <div class="col-md-6 mx-auto">
               <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                    <a class="fa-7x" href="#">
                              <i class="fas fa-user-circle" ></i>
                                     </a>
                               </center>
                           </div>
                           </div>

                           <div class="row">
                           <div class="col">
                               <center>
                                    <h3>Memebr Login</h3>
                               </center>
                           </div>

                       </div>

                        <div class="row">
                           <div class="col">
                               <hr>
                           </div>

                       </div>

                        <!-- Member ID -->
                        <div class="row">
                           <div class="col">
                               <label>Member ID</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="Texbox1" runat="server" 
                                       placeholder="Member ID">
                                   </asp:TextBox>
                                    </div>
                                   <br />

                                   
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox2" runat="server" 
                                       placeholder="Password" TextMode="Password">
                                   </asp:TextBox>
                               </div>

                                   <div class="form-group">
                                       <asp:Button class="btn btn-success btn-block" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                               </div>

                                      <div class="form-group">
                                          <a href="NewUserSignUp.aspx"><input class="btn btn-info btn-block" id="Button2" 
                                              type="button" value="Sign Up" /></a>
                               </div>
                          

                       </div>
                   

               </div>
           </div>
       </div>
   </div>
           </div>
       </div>

    <Center>
         <a href="homepage.aspx">Back to Home Page</a>
    </Center>
   

       


</asp:Content>
