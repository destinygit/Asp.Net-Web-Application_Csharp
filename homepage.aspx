<%@ Page Title="" Language="C#" MasterPageFile="~/StaticStructure.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="e_Library_mgmt.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <img src="Images/croppedlib.png" class="img-fluid"/>
    </section>

    <!-- Our Feature Section -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Features</h2>
                        <p><br />Three Primary Features</p>
                    </center>
                </div>
            </div>

             <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="Images/digitInventory.png" />
                        <h4>Digital Book Inventory</h4>
                        <p class="text-justify"><br />A digital library, digital repository, or digital collection, 
                            is an online database of digital objects that can include text, still images,
                            audio, video, digital documents, or other digital media formats. 
                            Objects can consist of digitized content like print or photographs, 
                            as well as originally produced digital content like word processor files 
                            or social media posts. In addition to storing content, digital libraries 
                            provide means for organizing, searching, and retrieving the content contained 
                            in the collection.</p>
                    </center>
                </div>
             
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="Images/search.jpg" />
                        <h4>Search Books</h4>
                        <p class="text-justify"><br />Search for any item, digital objects that can include text, still images,
                            audio, video, digital documents, or other digital media formats 
                            in a library arranged according to a recognized order and containing specific items.</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img width="150px" src="Images/defaulterlist.png" />
                        <h4>Defualter List</h4>
                        <p class="text-justify"><br />List of users and items that hasnt been properly administered.</p>
                    </center>
                </div>
                    </div>
            

        </div>
    </section>

     <section>
         <img src="Images/Knowlegepower2.png" class="img-fluid"/>
      </section>

     <!-- Our Process Section -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Process</h2>
                        <p><br />Three Step Process</p>
                    </center>
                </div>
            </div>

             <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="Images/signup.png" />
                        <h4>Sign Up</h4>
                        <p class="text-justify"><br />If your not yet a member sign up for our book club, and get your personal
                            Personal assistant at your side all the time, recommending your favorite catalog, and books relevent to your taste of books.</p>
                    </center>
                </div>
             
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="Images/search.jpg" />
                        <h4>Search Books</h4>
                        <p class="text-justify"><br />Once a member you can search for any item specific to your favorite catelog, digital objects that can include text, still images,
                            audio, video, digital documents, or other digital media formats 
                            in a library arranged according to a recognized order and containing specific items.</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img width="150px" src="Images/images.png" />
                        <h4>Visit Us</h4>
                        <p class="text-justify"><br />Visit our get you Smarter page And get your personal assistent at your disposal.</p>
                    </center>
                </div>
                    </div>
            

        </div>
    </section>

</asp:Content>
