<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eMedicineShop._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>


        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="Slider_img/1.jpeg" alt="...">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            <div class="item">
                <img src="Slider_img/2.jpeg" alt="...">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            <div class="item">
                <img src="Slider_img/3.jpeg" alt="...">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            ...
        </div>


        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 text-center" style="padding-top: 20px;">
                <img src="Slider_img/w2.jpg" class="img-square" alt="Cinque Terre" width="250" height="150">
            </div>
            <div class="col-md-3 text-center" style="padding-top: 20px;">
                <img src="Slider_img/w1.jpg" class="img-square" alt="Cinque Terre" width="250" height="150">
            </div>
            <div class="col-md-3 text-center" style="padding-top: 20px;">
                <img src="Slider_img/w3.jpg" class="img-square" alt="Cinque Terre" width="250" height="150">
            </div>
        </div>
    </div>

</asp:Content>
