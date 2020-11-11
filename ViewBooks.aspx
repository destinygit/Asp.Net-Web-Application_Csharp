<%@ Page Title="" Language="C#" MasterPageFile="~/StaticStructure.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="e_Library_mgmt.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
       <div class="row">
           <div class="col">
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
                                    <h3>Book Inventory List</h3>
                                    
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryDatabaseConnectionString %>" SelectCommand="SELECT * FROM [Book_Master_tbl]"></asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered" 
                                ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_Id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="Book_Id" HeaderText="ID" ReadOnly="True" SortExpression="Book_Id" >
                                    
                                    <ItemStyle Font-Bold="True" />
                                    </asp:BoundField>
                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-10">
                                                        <div class ="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Book_Name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class ="row">
                                                            <div class="col-12">

                                                                Author ~ <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Author_Name") %>'></asp:Label>
                                                                &nbsp;| Genre ~ <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Genre") %>'></asp:Label>
                                                                &nbsp;| Language ~ <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Language") %>'></asp:Label>

                                                            </div>
                                                        </div>
                                                        <div class ="row">
                                                            <div class="col-12">

                                                                Publisher ~ <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Publisher_Name") %>'></asp:Label>
                                                                &nbsp;| Published Date ~ <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("Published_Date") %>'></asp:Label>
                                                                &nbsp;| Pages ~ <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("No_of_Pages") %>'></asp:Label>

                                                            </div>
                                                        </div>
                                                        <div class ="row">
                                                            <div class="col-12">

                                                                Cost ~ <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Book_Cost") %>'></asp:Label>
                                                                &nbsp;| Actual Stock ~ <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("Actual_Stock") %>'></asp:Label>
                                                                &nbsp;| Available ~ <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Current_Stock") %>'></asp:Label>

                                                            </div>
                                                        </div>
                                                        <div class ="row">
                                                            <div class="col-12">

                                                                Description ~ <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("Book_Description") %>' Font-Italic="True"></asp:Label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <asp:Image class="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("Book_img_Link") %>' />
                                                    </div>

                                                </div>

                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                            </asp:GridView>

                        </div>
                                
                               </div>
                        </div>
                 </div>
                <center>
          <a href="homepage.aspx">Back to Home Page</a>
                   </center>
            </div>

       </div>
   </div>


</asp:Content>
