<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MedicineList.aspx.cs" Inherits="eMedicineShop.MedicineList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Repeater ID="productRepeater" runat="server" ItemType="eMedicineShop.Models.Medicine" SelectMethod="productRepeater_GetData">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>

            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading"><%# Eval("MedicineName") %></div>
                    <div class="panel-body">
                        <div>
                            <asp:Image ID="productIamge" runat="server" ImageUrl='<%# Eval("PictureFile", "~/Images/{0}") %>' Width="80" Height="60" CssClass="img-rounded" />
                            <span class="pull-right label label-primary"><%# Eval("UnitPrice", "{0:0.00 BDT}") %></span>
                        </div>
                        <div>
                            <%-- <%# Eval("Description") %>--%>
                        </div>
                        <br />
                        <div class="text-right">
                            <asp:HyperLink ID="hlBuy" runat="server" NavigateUrl='<%# Eval("MedicineId", "~/Secured/Cart.aspx?id={0}") %>' CssClass="btn btn-success"><span class="glyphicon glyphicon-shopping-cart text-right"></span> Add to Cart</asp:HyperLink>
                        </div>
                    </div>

                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
