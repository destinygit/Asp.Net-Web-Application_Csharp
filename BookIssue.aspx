<%@ Page Title="" Language="C#" MasterPageFile="~/StaticStructure.Master" AutoEventWireup="true" CodeBehind="BookIssue.aspx.cs" Inherits="e_Library_mgmt.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
 
 
     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
       <div class="row">

             <!-- BooksIssue -->
           <div class="col-md-5">
               <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                    <a class="fa-3x" href="#">
                              <i class="fas fa-book-open" ></i>
                                     </a>
                               </center>
                           </div>
                           </div>

                           <div class="row">
                           <div class="col">
                               <center>
                                    <h3>Book Issuing</h3>
                               </center>
                           </div>

                       </div>

                        <div class="row">
                           <div class="col">
                               <hr>
                           </div>

                       </div>

                       <!-- Member & Book ID -->
                        <div class="row">

                              <div class="col-md-6">
                               <label>Member ID</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox1" runat="server" 
                                       placeholder="Member ID">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                           <div class="col-md-6 mx-auto">
                               <label>Book ID</label>
                               <div class="form-group">
                                    <div class="input-group">
                                   <asp:TextBox Class="form-control" ID="TextBox2" runat="server" 
                                       placeholder="Book ID">
                                   </asp:TextBox>
                                         <asp:Button class="btn btn-secondary" ID="Button1" runat="server" Text=">" OnClick="Button1_Click" />
                                   </div>
                                        </div>
                                 </div>
                               </div>
                       <!-- Member & Book Name-->
                       <div class="row">

                           <div class="col-md-6">
                               <label>Full Name</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox3" runat="server" 
                                       placeholder="Name" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                           <div class="col-md-6">
                               <label>Book Name</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox4" runat="server" 
                                       placeholder="Book Name" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                       </div>
                       <!-- Start & End Date -->
                       <div class="row">

                           <div class="col-md-6">
                               <label>Start Date</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox5" runat="server" 
                                       placeholder="" TextMode="Date">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                           <div class="col-md-6">
                               <label>End Date</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox6" runat="server" 
                                       placeholder="" TextMode="Date">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                       </div>
                                 </br>
                     
                         <!-- Buttons -->
                       <div class="row">
                           <div class="col-md-6 mx-auto">
                        <div class="form-group">
                            <center>
                                <asp:Button class="btn btn-primary btn-block" ID="Button2" runat="server" Text="Issue" OnClick="Button2_Click" />
                                </center>
                               </div>
                           </div>
                           <div class="col-md-6 mx-auto">
                        <div class="form-group">
                            <center>
                                <asp:Button class="btn btn-info btn-block" ID="Button3" runat="server" Text="Return" OnClick="Button3_Click" />
                                </center>
                               </div>
                           </div>
                       </div>
                       </div>
                   

               </div>
                <center>
          <a href="homepage.aspx">Back to Home Page</a>
                   </center>
       </div>
       
              


           <!-- Issued Books Table List -->
           <div class="col-md-7">
               <div class="card">
                   <div class="card-body">

                       <!-- Icon -->
                       <div class="row">
                           <div class="col">
                               <center>
                                    <a class="fa-4x" href="#">
                              <i class="fas fa-book-reader" ></i>
                                     </a>
                               </center>
                           </div>
                           </div>

                       <!-- User info -->
                           <div class="row">
                           <div class="col">
                               <center>
                                    <h3>Issued Book List</h3>
                                    
                               </center>
                           </div>

                       </div>

                        <div class="row">
                           <div class="col">
                               <hr>
                           </div>

                       </div>

                       <!-- Gid Table -->

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:des_eLibraryConnectionString %>' SelectCommand="SELECT * FROM [Book_Issue_tbl]"></asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered"
                                ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId" />
                                    <asp:BoundField DataField="Member_Name" HeaderText="Member_Name" SortExpression="Member_Name" />
                                    <asp:BoundField DataField="Book_Id" HeaderText="Book_Id" SortExpression="Book_Id" />
                                    <asp:BoundField DataField="Book_Name" HeaderText="Book_Name" SortExpression="Book_Name" />
                                    <asp:BoundField DataField="Issue_Date" HeaderText="Issue_Date" SortExpression="Issue_Date" />
                                    <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" SortExpression="Due_Date" />
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
