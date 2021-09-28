<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="eMedicineShop.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3> Contact page</h3>
    <address>
        Green Road, Dhaka
    </address>
    <address>
        <strong>Support:</strong>   <a href="EmailSend.aspx">e-mail us</a><br />
    </address>
</asp:Content>
