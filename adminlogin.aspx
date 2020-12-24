<%@ Page Title="Digital Library" Language="C#" MasterPageFile="~/StaticStructure.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="e_Library_mgmt.WebForm1" %>
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
                                    <a class="fa-5x" href="#">
                              <i class="fas fa-user-edit" ></i>
                                     </a>
                               </center>
                           </div>
                           </div>

                           <div class="row">
                           <div class="col">
                               <center>
                                    <h3>Admin Login</h3>
                               </center>
                           </div>

                       </div>

                        <div class="row">
                           <div class="col">
                               <hr>
                           </div>

                       </div>

                       <!-- Admin loin Id and pword -->
                        <div class="row">
                           <div class="col">
                               <label>Admin ID</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="Texbox1" runat="server" 
                                       placeholder="ID">
                                   </asp:TextBox>
                                   <br />
                                     </div>
                                   
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox2" runat="server" 
                                       placeholder="Password" TextMode="Password">
                                   </asp:TextBox>
                               </div>
                                 
                                   <div class="form-group">
                                       <asp:Button class="btn btn-success btn-block" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                               </div>
                       </div>
               </div>
           </div>
       </div>
   </div>
           </div>
       </div>
</asp:Content>


