<%@ Page Title="" Language="C#" MasterPageFile="~/StaticStructure.Master" AutoEventWireup="true" CodeBehind="AuthorManagement.aspx.cs" Inherits="e_Library_mgmt.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
       });
   </script> 
                              
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
       <div class="row">

             <!-- AuthorEntry -->
           <div class="col-md-6">
               <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                    <a class="fa-3x" href="#">
                              <i class="fas fa-user-edit" ></i>
                                     </a>
                               </center>
                           </div>
                           </div>

                           <div class="row">
                           <div class="col">
                               <center>
                                    <h3>Author Details</h3>
                               </center>
                           </div>

                       </div>

                        <div class="row">
                           <div class="col">
                               <hr>
                           </div>

                       </div>

                       <!-- AuthorId &AuthorName -->
                        <div class="row">
                           <div class="col-md-4">
                               <label>Author ID</label>
                               <div class="form-group">
                                   <div class="input-group">
                                   <asp:TextBox Class="form-control" ID="TextBox1" runat="server" 
                                       placeholder="ID">
                                   </asp:TextBox>
                                   <asp:Button class="btn btn-secondary" ID="Button1" runat="server" Text=">" OnClick="Button1_Click" />
                                   </div>
                                 </div>
                                 </div>

                               <div class="col-md-8">
                               <label>Author Name</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox2" runat="server" 
                                       placeholder="Author Name">
                                   </asp:TextBox>
                                   </div>
                                      </div>
                           </div>

                                 </br>
                     
                         <!-- Buttons -->
                       <div class="row">
                           <div class="col-md-4 mx-auto">
                        <div class="form-group">
                            <center>
                                 <asp:Button class="btn btn-success btn-block"  ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" />
                                </center>
                               </div>
                           </div>
                           <div class="col-md-4 mx-auto">
                        <div class="form-group">
                            <center>
                                <asp:Button class="btn btn-info btn-block"  ID="Button3"  runat="server" Text="Update" OnClick="Button3_Click" />
                                </center>
                               </div>
                           </div>
                           <div class="col-md-4 mx-auto">
                        <div class="form-group">
                            <center>
                                <asp:Button class="btn btn-danger btn-block" ID="Button4"   runat="server" Text="Delete" OnClick="Button4_Click" />
                                </center>
                               </div>
                           </div>
                       </div>
                       </div>
                   

               </div>
                <Center>
              <a href="homepage.aspx">Back to Home Page</a>
            </Center>
        </div>

           
  
           <!-- Author Table List -->
           <div class="col-md-6 mx-auto">
               <div class="card">
                   <div class="card-body">

                       <!-- Icon -->
                       <div class="row">
                           <div class="col">
                               <center>
                                    <a class="fa-4x" href="#">
                              <i class="fas fa-address-book" ></i>
                                     </a>
                               </center>
                           </div>
                           </div>

                       <!-- User info -->
                           <div class="row">
                           <div class="col">
                               <center>
                                    <h3>Author List</h3>
                                    
                               </center>
                           </div>
                               </div>

                       <!-- Gid Table -->

                        <div class="row">
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="
                                <%$ ConnectionStrings:LibraryDatabaseConnectionString %>" SelectCommand="SELECT * FROM 
                                [Author_Master_tbl]"></asp:SqlDataSource>
                        <div class="col">
                            
                            <asp:GridView class="table table-striped table-bordered" 
                                ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AuthorId" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="AuthorId" HeaderText="Author Id" ReadOnly="True" SortExpression="AuthorId" />
                                    <asp:BoundField DataField="Author_Name" HeaderText="Author Name" SortExpression="Author_Name" />
                                </Columns>
                            </asp:GridView>

                        </div>
                                
                               </div>
                        </div>
                 </div>
            </div>

       </div>
   </div>

</asp:Content>
