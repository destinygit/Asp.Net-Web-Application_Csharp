<%@ Page Title="" Language="C#" MasterPageFile="~/StaticStructure.Master" AutoEventWireup="true" CodeBehind="BookInventory.aspx.cs" Inherits="e_Library_mgmt.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container-fluid">
       <div class="row">

             <!-- BookDetails -->
           <div class="col-md-6">
               <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                    <a class="fa-3x" href="#">
                              <i class="fas fa-book" Id="imgview" ></i>
                                     </a>
                               </center>
                           </div>
                           </div>

                           <div class="row">
                           <div class="col">
                               <center>
                                    <h3>Member Details</h3>
                               </center>
                           </div>

                       </div>

                        <div class="row">
                           <div class="col">
                               <hr>
                           </div>

                       </div>
                       <div class="row">
                           <div class="col">
                               <div class="form-group">
                           <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                               </div>
                               </div>
                       </div>

                       <!-- Book search -->
                        <div class="row">

                                <div class="col-md-4 mx-auto">
                               <label>Book ID</label>
                               <div class="form-group">
                                    <div class="input-group">
                                   <asp:TextBox Class="form-control" ID="TextBox1" runat="server" 
                                       placeholder="ID">
                                   </asp:TextBox>
                                         <asp:Button class="btn btn-info" ID="Button1" runat="server" Text=">" OnClick="Button1_Click" />
                                   </div>
                                        </div>
                                 </div>

                            <div class="col-md-8">
                               <label>Book Name</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox2" runat="server" 
                                       placeholder="Name">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                         
                               </div>
                       <!-- Row with three colums(col-md-4) and two columns each?-->
                       <div class="row">
                           <div class="col-md-4 mx-auto">
                               <label>Language</label>
                               <div class="form-group">
                                   <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server">

                                       <asp:ListItem Text="select" Value="-----" />
                                       <asp:ListItem Text="English" Value="English" />
                                       <asp:ListItem Text="French" Value="French" />
                                       <asp:ListItem Text="German" Value="German" />
                                       <asp:ListItem Text="Chinese" Value="Chinese" />
                                       <asp:ListItem Text="Spanish" Value="Spanish" />
                                       <asp:ListItem Text="Russian" Value="Russian" />
                                       <asp:ListItem Text="Arabic" Value="Arabic" />
                                       <asp:ListItem Text="Japanese" Value="Japennese" />
                                        <asp:ListItem Text="Portuguese" Value="Portuguese" />
                                        <asp:ListItem Text="Italian" Value="Italian" />
                                         <asp:ListItem Text="Hindi" Value="Hindi" />
                                       </asp:DropDownList>
                                   </div>

                               
                                 <label>Publisher Name</label>
                               <div class="form-group">
                                 <asp:DropDownList Class="form-control" ID="DropDownList2" runat="server">

                                           <asp:ListItem Text="select" Value="-----" />
                                       <asp:ListItem Text="Brown Inc" Value="Brown Inc" />
                                       <asp:ListItem Text="JimmySons" Value="JimmySons" />
                                       <asp:ListItem Text="Robertsons" Value="Robertsons" />
                                     </asp:DropDownList>
                                   </div>
                                      </div>

                           <div class="col-md-4 mx-auto">
                               <label>Author Name</label>
                              <div class="form-group">
                                 <asp:DropDownList Class="form-control" ID="DropDownList3" runat="server">

                                           <asp:ListItem Text="select" Value="-----" />
                                       <asp:ListItem Text="Smith Brown" Value="Smith Brown" />
                                       <asp:ListItem Text="Jimmy Chu" Value="Jimmy Chu" />
                                       <asp:ListItem Text="Will Robertsons" Value="Will Robertsons" />
                                    </asp:DropDownList>
                                   </div>

                               <label>Published Date</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox3" runat="server" 
                                       placeholder="Published Date" TextMode="Date">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                           <div class="col-md-4 mx-auto">
                               <label>Genre</label>
                               <div class="form-group">
                                   <asp:ListBox ID="ListBox1" runat="server">

                                           <asp:ListItem Text="select" Value="-----" />
                                       <asp:ListItem Text="Action" Value="Action" />
                                       <asp:ListItem Text="Adventure" Value="Adventure" />
                                       <asp:ListItem Text="Comic" Value="Comics" />
                                       <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                       <asp:ListItem Text="Comedy" Value="Comedy" />
                                       <asp:ListItem Text="Romance" Value="Romance" />
                                       <asp:ListItem Text="Scifi" Value="Scifi" />
                                       <asp:ListItem Text="True Story" Value="True Story" />
                                        <asp:ListItem Text="Documentary" Value="Documentary" />
                                          <asp:ListItem Text="therapeutic" Value="therapeutic" />
                                       <asp:ListItem Text="Crime" Value="Crime" />
                                       <asp:ListItem Text="Motivation" Value="Motivation" />
                                       <asp:ListItem Text="Science Fiction" Value="Science Fiction " />
                                       <asp:ListItem Text="Health" Value="Health" />
                                       <asp:ListItem Text="History" Value="History" />
                                       <asp:ListItem Text="Travel" Value="Travel" />
                                       <asp:ListItem Text="Poetry" Value="Poetry" />
                                       <asp:ListItem Text="Horror" Value="Horror" />
                                       <asp:ListItem Text="Suspence" Value="Suspence" />
                                       <asp:ListItem Text="Entreprenuership" Value="Entreprenuership" />

                                   </asp:ListBox>
                                   </div>

                                      </div>
                                                                 </div>

                       <div class="row">
                             <div class="col-md-4">
                               <label>Edition</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox4" runat="server" 
                                       placeholder="Editions">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                             <div class="col-md-4">
                               <label>Book Cost(per Unit)</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox5" runat="server" 
                                       placeholder="Book Cost" TextMode="Number">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                           <div class="col-md-4">
                               <label>Pages</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox6" runat="server" 
                                       placeholder="Pages" TextMode="Number">
                                   </asp:TextBox>
                                   </div>
                                      </div>
                               </div>

                       
                              <div class="row">
                             <div class="col-md-4">
                               <label>Actual Stock</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox7" runat="server" 
                                       placeholder="Actual Stock" TextMode="Number">
                                   </asp:TextBox>
                                   </div>
                                      </div>
                         
                                  <div class="col-md-4">
                               <label>Current Stock</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox8" runat="server" 
                                       placeholder="Current Stock" TextMode="Number" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                                  <div class="col-md-4">
                               <label>Issued Books</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox9" runat="server" 
                                       placeholder="Issued Books" TextMode="Number" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>
                               </div>
                       <!-- Third ROW??-->
                        <div class="row">
                           <div class="col">
                               <label>Book Description</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox10" runat="server" 
                                       placeholder="Product Desription" TextMode="MultiLine">
                                   </asp:TextBox>
                                   </div>
                                      </div>
                            </div>

                         <!-- Buttons -->
                     <div class="row">
                           <div class="col-md-4 mx-auto">
                        <div class="form-group">
                            <center>
                                <asp:Button class="btn btn-success btn-block" ID="Button2"  runat="server" Text="Add" OnClick="Button2_Click" />
                                </center>
                               </div>
                           </div>
                           <div class="col-md-4 mx-auto">
                        <div class="form-group">
                            <center>
                                <asp:Button class="btn btn-info btn-block" ID="Button3"  runat="server" Text="Update" OnClick="Button3_Click" />
                                </center>
                               </div>
                           </div>
                           <div class="col-md-4 mx-auto">
                        <div class="form-group">
                            <center>
                                 <asp:Button class="btn btn-danger btn-block"  ID="Button4"   runat="server" Text="Delete" OnClick="Button4_Click" />
                                </center>
                               </div>
                           </div>
                       </div>
                       </div>
               </div>
       </div>
       
              


           <!-- Book Inventory List -->
           <div class="col-md-6">
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:des_eLibraryConnectionString %>' SelectCommand="SELECT * FROM [Book_Master_tbl]"></asp:SqlDataSource>
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
            </div>

       </div>
   </div>


</asp:Content>
