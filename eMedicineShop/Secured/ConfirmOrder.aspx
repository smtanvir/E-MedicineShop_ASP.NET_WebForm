<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmOrder.aspx.cs" Inherits="eMedicineShop.Secured.ConfirmOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Customer Info</h3>
    <asp:GridView ID="BillInfo" runat="server" SelectMethod="BillInfo_GetData" CssClass="form-control"></asp:GridView>
    <h3>Order Details</h3>
    <asp:GridView ID="DetailsInfo" runat="server" SelectMethod="DetailsInfo_GetData" CssClass="form-control"></asp:GridView>
    <div>
      
        <span class="pull-right">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Secured/ConfirmSubmit" CssClass="btn btn-success">Confirm Order</asp:HyperLink>
        </span>
    </div>
</asp:Content>
