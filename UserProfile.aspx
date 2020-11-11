<%@ Page Title="" Language="C#" MasterPageFile="~/StaticStructure.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="e_Library_mgmt.WebForm4" %>
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
           <div class="col-md-5">
               <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                    <a class="fa-5x" href="#">
                              <i class="fas fa-user-circle" ></i>
                                     </a>
                               </center>
                           </div>
                           </div>

                           <div class="row">
                           <div class="col">
                               <center>
                                    <h3>Your Profile</h3>
                                   <span>Account Status-</span>
                                        <asp:Label class="badge badge-pill badge-info" 
                                            ID="Label1" runat="server" Text="Your Status"></asp:Label>
                               </center>
                           </div>

                       </div>

                        <div class="row">
                           <div class="col">
                               <hr>
                           </div>

                       </div>
                       <!-- Full Name and DOB -->
                        <div class="row">
                           <div class="col-md-6">
                               <label>Full Name</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox1" runat="server" 
                                       placeholder="Name and Surname">
                                   </asp:TextBox>
                                   </div>
                                 </div>

                               <div class="col-md-6">
                               <label>Date of Birth</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox2" runat="server" 
                                       placeholder="dd-mm-yyyy" TextMode="Date">
                                   </asp:TextBox>
                                   </div>
                                      </div>
                                
                               </div>
                                 
                       <!-- Contact Number and Email -->
                           <div class="row">
                           <div class="col-md-6">
                               <label>Contact Number</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox3" runat="server" 
                                       placeholder="Contact number">
                                   </asp:TextBox>
                                   </div>
                                 </div>

                               <div class="col-md-6">
                               <label>Email Address</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox4" runat="server" 
                                       placeholder="Email" TextMode="Email">
                                   </asp:TextBox>
                                   </div>
                                      </div>
                                
                               </div>
                                 

                       <!-- State,city, pin -->
                           <div class="row">
                           <div class="col-md-4">
                               <label>Province</label>
                               <div class="form-group">
                                   <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server">

                                       <asp:ListItem Text="select" Value="-----" />
                                       <asp:ListItem Text="Eastern Cape" Value="Eastern Cape" />
                                       <asp:ListItem Text="Free State" Value="Free State" />
                                       <asp:ListItem Text="Gauteng" Value="Gauteng" />
                                       <asp:ListItem Text="Kwazulu-Natal" Value="Kwazulu-Natal" />
                                       <asp:ListItem Text="Limpopo" Value="Limpopo" />
                                       <asp:ListItem Text="Mpumalanga" Value="Mpumalanga" />
                                       <asp:ListItem Text="North West" Value="North West" />
                                       <asp:ListItem Text="Northern Cape" Value="Northern Cape" />
                                        <asp:ListItem Text="Western Cape" Value="Western Cape" />

                                   </asp:DropDownList>
                                   </div>
                                 </div>

                               <div class="col-md-4">
                               <label>City</label>
                               <div class="form-group">
                                   <asp:DropDownList Class="form-control" ID="DropDownList2" runat="server">

                                       <asp:ListItem Text="select" Value="-----" />
                                       <asp:ListItem Text="Bloemfontein" Value="Bloemfontein" />
                                       <asp:ListItem Text="Cape Town" Value="Cape Town" />
                                       <asp:ListItem Text="Durban" Value="Durban" />
                                       <asp:ListItem Text="Johannesburg" Value="Johannesburg" />
                                       <asp:ListItem Text="Kimberley" Value="Kimberley" />
                                       <asp:ListItem Text="Klerksdorp" Value="Klerksdorp" />
                                       <asp:ListItem Text="Mbombela" Value="Mbombela" />
                                       <asp:ListItem Text="Polokwane" Value="Polokwane" />
                                        <asp:ListItem Text="Port Elizabeth" Value="Port Elizabeth" />

                                   </asp:DropDownList>
                                   </div>
                                      </div>
                               <div class="col-md-4">
                               <label>Pin Code</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox5" runat="server" 
                                       placeholder="Code" TextMode="Number">
                                   </asp:TextBox>
                                   </div>
                                      </div>
                                
                               </div>
                                   
                       <!-- Address -->
                       <div class="row">
                           <div class="col">
                                  <label>Full Address</label> 
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox6" runat="server" 
                                       placeholder="Full Address" TextMode="MultiLine">
                                   </asp:TextBox>
                               </div>
                               </div>
                           </div>
                       <br />
                         <!-- Info pillbadge -->
                       <div class="row">
                           <div class="col">
                       <center>
                       <span class="badge badge-pill badge-info">Login Credentials</span>
                           </center>
                       </div>
                           </div>
                       <br />

                       <!-- UserID and Pword -->
                       <div class="row">
                           <div class="col-md-4">
                               <label>Member ID</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox7" runat="server" 
                                       placeholder="User ID" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                 </div>

                               <div class="col-md-4">
                               <label>Old Password</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox8" runat="server" 
                                       placeholder="Password" TextMode="Password" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                           <div class="col-md-4">
                               <label>New Password</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox9" runat="server" 
                                       placeholder="Password" TextMode="Password">
                                   </asp:TextBox>
                                   </div>
                                      </div>
                                
                               </div>

                       <div class="row">
                           <div class="col-8 mx-auto">
                        <div class="form-group">
                            <center>
                                <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button2"  runat="server" Text="Update" OnClick="Button2_Click" />
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
                                    <h3>Issued Books</h3>
                                     <asp:Label class="badge badge-pill badge-info" 
                                            ID="Label2" runat="server" Text="Your books info"></asp:Label>
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
                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered"
                                ID="GridView" runat="server"  OnRowDataBound="GridView_RowDataBound" >
                            </asp:GridView>

                        </div>
                                
                               </div>
                        </div>
                 </div>
            </div>
       </div>
   </div>
</asp:Content>
