<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="eMedicineShop.Secured.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: User.Identity.Name %>'s Cart</h3>
    <asp:GridView ID="cartGrid" runat="server" CssClass="table table-bordered"  ItemType="eMedicineShop.Models.CartItemViewModel" DataKeyNames="CartItemId"
        SelectMethod="cartGrid_GetData" UpdateMethod="cartGrid_UpdateItem" DeleteMethod="cartGrid_DeleteItem" AutoGenerateColumns="False" OnRowDataBound="cartGrid_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-default"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-default"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
          
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MedicineName") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MedicineName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Unit Price">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("UnitPrice", "{0:0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("UnitPrice", "{0:0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount">
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount", "{0:0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Amount", "{0:0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div>
        <span class="pull-left">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn btn-primary">Continue Shopping</asp:HyperLink>
        </span>
        <span class="pull-right">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Secured/CustomerDetails.aspx" CssClass="btn btn-success">Checkout</asp:HyperLink>
        </span>
    </div>

</asp:Content>
