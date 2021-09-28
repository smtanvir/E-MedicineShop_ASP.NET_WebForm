<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="CategoryWiseMedicines.aspx.cs" Inherits="eMedicineShop.Admin.CategoryWiseMedicines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-left" style="margin-bottom: 12px;">
                    <a href="/Admin/Categories.aspx" class="btn btn-primary">Back To Category List</a>
                </div>
                <asp:ListView ID="ListView1" runat="server" SelectMethod="ListView1_GetData">
                    <AlternatingItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("MedicineName")%>' />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("GenericGroup") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("MedicineType") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("UnitPrice") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("PackSize") %>' /><span runat="server">Pcs</span>
                            </td>
                            <td>
                                <asp:Image ImageUrl='<%# Eval("PictureFile", "~/Images/{0}") %>' runat="server" ID="PictureFileImage" Width="50px" />
                            </td>

                        </tr>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("MedicineName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("GenericGroup") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("MedicineType") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("UnitPrice") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("PackSize") %>' /><span runat="server">Pcs</span>
                            </td>
                            <td>
                                <asp:Image ImageUrl='<%# Eval("PictureFile", "~/Images/{0}") %>' runat="server" ID="PictureFile" Width="50px" />
                            </td>

                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-bordered">
                                        <tr runat="server" style="">
                                            <th runat="server">Medicine Name</th>
                                            <th runat="server">Generic Group</th>
                                            <th runat="server">Brand Name</th>
                                            <th runat="server">Medicine Type</th>
                                            <th runat="server">Unit Price</th>
                                            <th runat="server">Pack Size</th>
                                            <th runat="server">Picture File</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
