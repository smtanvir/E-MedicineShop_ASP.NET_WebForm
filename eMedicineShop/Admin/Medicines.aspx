<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Medicines.aspx.cs" Inherits="eMedicineShop.Admin.Medicines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
             <div class="text-right" style="margin-bottom: 12px;">
                <a href="/Admin/CreateMedicine.aspx" class="btn btn-primary">Create New</a>
            </div>
            <asp:ListView ID="MedicineView" runat="server" DataKeyNames="MedicineId" ItemType="eMedicineShop.Models.Medicine" SelectMethod="MedicineView_GetData" DeleteMethod="MedicineView_DeleteItem" UpdateMethod="MedicineView_UpdateItem">

                <EditItemTemplate>
                    <tr style="">
                       
                        <td>
                            <asp:Label ID="lblMedcineName" runat="server" Text='<%# Eval("MedicineName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("UnitDescription") %>' />
                        </td>
                        <td>
                            <asp:Image ImageUrl='<%# Eval("PictureFile", "~/Images/{0}") %>' runat="server" ID="PictureFileImage" Width="50px" />
                        </td>
                          <td>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                            <asp:LinkButton ID="DeleteItem" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">
                         <td>
                            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("MedicineName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("UnitDescription") %>' />
                        </td>
                        <td>
                            <asp:Image ImageUrl='<%# Eval("PictureFile", "~/Images/{0}") %>' runat="server" ID="PictureFileImage" Width="50px" />
                        </td>
                          <td>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                            <asp:LinkButton ID="DeleteItem" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
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
                                        <th runat="server">Unit Price</th>
                                        <th runat="server">Description</th>
                                        <th runat="server">Picture File</th>
                                         <th runat="server">Action </th>
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
                <SelectedItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("MedicineName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("UnitDescription") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PictureFileLabel" runat="server" Text='<%# Eval("PictureFile") %>' />
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                            <asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
    </div>

</asp:Content>