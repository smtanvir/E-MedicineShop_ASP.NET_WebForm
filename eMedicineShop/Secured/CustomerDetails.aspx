<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="eMedicineShop.Secured.CustomerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="alert alert-warning alert-dismissible" role="alert" id="msg" runat="server">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Warning!</strong> Some data are missing in your profile. Please fill up data and then continue.
    </div>

    <div>
        <div class="form-group">
            <asp:Label ID="Label1" CssClass="control-label col-md-4" runat="server" Text="Label">CustomerName:</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="CustomerNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustomerName") %>' />
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="Label2" CssClass="control-label col-md-4" runat="server" Text="Label">Address:</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="AddressTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Address") %>' />
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="Label3" CssClass="control-label col-md-4" runat="server" Text="Label">Credit Card Number:</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="CCNumberTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CreditCardNumber") %>' />
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="Label4" CssClass="control-label col-md-4" runat="server" Text="Label">Credit Card Expire Date:</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="CCExpireTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CreditCardExpireDate") %>' />
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save and Continue" OnClick="UpdateButton_Click" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </div>
    </div>
</asp:Content>
