<%@ Page Title="" Language="C#" MasterPageFile="~/StaticStructure.Master" AutoEventWireup="true" CodeBehind="AdminMembermgmt.aspx.cs" Inherits="e_Library_mgmt.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
       });
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
       <div class="row">

             <!-- MemberDetails -->
           <div class="col-md-5">
               <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                    <a class="fa-3x" href="#">
                              <i class="fas fa-user-circle" ></i>
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

                       <!-- Member & Acc Status -->
                        <div class="row">

                              <div class="col-md-3 mx-auto">
                               <label>Member ID</label>
                               <div class="form-group">
                                   <div class="input-group">
                                   <asp:TextBox Class="form-control" ID="TextBox1" runat="server" 
                                       placeholder="ID">
                                   </asp:TextBox>
                                   <asp:Button class="btn btn-secondary" ID="Button1" runat="server" Text=">" OnClick="Button1_Click" />
                                       </div>
                                   </div>
                                      </div>

                            <div class="col-md-4 mx-auto">
                               <label>Full Name</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox2" runat="server" 
                                       placeholder="Name" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                           <div class="col-md-5 mx-auto">
                               <label>Account Status</label>
                               <div class="form-group">
                                    <div class="input-group">
                                   <asp:TextBox Class="form-control" ID="TextBox3" runat="server" 
                                       placeholder="Account Status"  ReadOnly="true">
                                   </asp:TextBox>
                                         <asp:Button class="btn btn-success" ID="Button2" runat="server" Text="*" OnClick="Button2_Click" />
                                        <asp:Button class="btn btn-warning" ID="Button3" runat="server" Text="@" OnClick="Button3_Click" />
                                        <asp:Button class="btn btn-danger" ID="Button4" runat="server" Text="%" OnClick="Button4_Click" />
                                   </div>
                                        </div>
                                 </div>
                               </div>
                       <!-- Member Info-->
                       <div class="row">

                           <div class="col-md-3">
                               <label>Date of Birth</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox4" runat="server" 
                                       placeholder="" TextMode="Date" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                           <div class="col-md-3">
                               <label>Contact Number</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox5" runat="server" 
                                       placeholder="Contact No" TextMode="Number" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                            <div class="col-md-6">
                               <label>Email Adress</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox6" runat="server" 
                                       placeholder="Email ID" TextMode="Email" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                       </div>
                       <!-- Address -->
                      <div class="row">

                           <div class="col-md-6">
                               <label>Province</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox7" runat="server" 
                                       placeholder="Province" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                           <div class="col-md-3">
                               <label>City</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox8" runat="server" 
                                       placeholder="City" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                            <div class="col-md-3">
                               <label>Pin Code</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox9" runat="server" 
                                       placeholder="Pin Code" TextMode="Number" ReadOnly="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                       </div>
                                 
                       <div class="row">

                           <div class="col">
                               <label>Postal Address</label>
                               <div class="form-group">
                                   <asp:TextBox Class="form-control" ID="TextBox10" runat="server" 
                                       placeholder="Full Address" TextMode="MultiLine" ReadOnly ="true">
                                   </asp:TextBox>
                                   </div>
                                      </div>

                       </div>
                     
                         <!-- Buttons -->
                       <div class="row">
                           <div class="col">
                        <div class="form-group">    
                            <asp:Button class="btn btn-danger btn-block"  ID="Button5" runat="server" Text="Delete User" OnClick="Button5_Click" />
                               </div>
                           </div>
                       </div>
                       </div>
               </div>
       </div>
       
              


           <!-- Member Management Table List -->
           <div class="col-md-7 mx-auto">
               <div class="card">
                   <div class="card-body">

                       <!-- Icon -->
                       <div class="row">
                           <div class="col">
                               <center>
                                    <a class="fa-4x" href="#">
                              <i class="fas fa-user-circle" ></i>
                                     </a>
                               </center>
                           </div>
                           </div>

                       <!-- User info -->
                           <div class="row">
                           <div class="col">
                               <center>
                                    <h3>Member List</h3>
                                    
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryDatabaseConnectionString %>" SelectCommand="SELECT * FROM [Member_Master_tbl]"></asp:SqlDataSource>
                        <div class="col mx-auto">
                            <asp:GridView class="table table-striped table-bordered" 
                                ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Member_Id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="Member_Id" HeaderText="User ID" ReadOnly="True" SortExpression="Member_Id" />
                                    <asp:BoundField DataField="Full_Name" HeaderText="Full Name" SortExpression="Full_Name" />
                                    <asp:BoundField DataField="Account_Status" HeaderText="Account Status" SortExpression="Account_Status" />
                                    <asp:BoundField DataField="Contact_no" HeaderText="Contact No" SortExpression="Contact_no" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" />
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
