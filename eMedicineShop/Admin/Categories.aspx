<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="eMedicineShop.Admin.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <h2 class="text-center">Category List</h2>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1" InsertItemPosition="LastItem" DataKeyNames="CategoryId">

                    <EditItemTemplate>
                        <tr style="background-color: #FFCC66; color: #000080;">

                            <td>
                                <asp:Label ID="traineeIdLabel1" runat="server" Text='<%# Eval("CategoryId") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="txtCtgName" CssClass="form-control" runat="server" Text='<%# Bind("CategoryName") %>' ValidationGroup="edit" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>

                                <asp:LinkButton ID="UpdateButton" CssClass="btn btn-sm btn-success" runat="server" CommandName="Update" Text="Update" ValidationGroup="edit">
                        <i class="fa fa-save"></i>
                                </asp:LinkButton>

                                &nbsp; &nbsp; &nbsp;
                    
                    <asp:LinkButton ID="CancelButton" CssClass="btn btn-sm btn-dark" runat="server" CommandName="Update" Text="Update">
                        <i class="fa fa-backward"></i>
                    </asp:LinkButton>
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table class="table" runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:TextBox ID="txtCtgId" CssClass="form-control" runat="server" Text='<%# Bind("CategoryId") %>' ValidationGroup="insert" Enabled="false" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtCtgName" CssClass="form-control" runat="server" Text='<%# Bind("CategoryName") %>' ValidationGroup="insert" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Write Medicine Category Name" ControlToValidate="txtCtgName" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                            </td>
                             <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" ValidationGroup="insert">
                       <i class="fa fa-pencil"></i>
                                </asp:LinkButton>
                                &nbsp; &nbsp; &nbsp;
                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-dark btn-sm">
                        <i class="fa fa-backward"></i>
                        </asp:LinkButton>
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #DCDCDC; color: #000000;">

                            <td>
                                <asp:Label ID="txtCtgId" runat="server" Text='<%# Eval("CategoryId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="txtCtgName" runat="server" Text='<%# Eval("CategoryName") %>' />
                            </td>
                            <td>
                            <asp:HyperLink runat="server" ID="hlproducts" NavigateUrl='<%# Eval("CategoryId", "~/Admin/CategoryWiseMedicines.aspx?c={0}") %>'>View Medicines</asp:HyperLink>
                        </td>
                            <td>
                                <asp:LinkButton runat="server" CssClass="btn btn-sm btn-info" CommandName="Edit" ID="EditButton">
                        <i class='fa fa-pencil-square-o'></i>
                                </asp:LinkButton>
                                &nbsp; &nbsp; &nbsp;
                    <asp:LinkButton runat="server" CssClass="btn btn-sm btn-danger" CommandName="Delete" ID="DeleteButton">
                        <i class='fa fa-trash-o'></i>
                    </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    
                    <LayoutTemplate>
                        <table runat="server" class="table table-bordered table-hover ">
                            <tr runat="server">
                                <td runat="server">
                                    <table class="table table-bordered table-hover table-responsive" id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr class="thead-dark" runat="server" style="background-color: #DCDCDC; color: #000000;">

                                            <th runat="server">Category ID</th>
                                            <th runat="server">Category Name</th>
                                            <th runat="server">View</th>
                                            <th runat="server" class="text-center">Action</th>
                                        </tr>
                                        <tr id="itemplaceHolder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">

                            <td>
                                <asp:Label ID="lblCtgId" runat="server" Text='<%# Eval("CategoryId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblCtgName" runat="server" Text='<%# Eval("CategoryName") %>' />
                            </td>
                            <td>
                            <asp:HyperLink runat="server" ID="hlproducts" NavigateUrl='<%# Eval("CategoryId", "~/Admin/CategoryWiseMedicines.aspx?c={0}") %>'>View Medicines</asp:HyperLink>
                        </td>
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                &nbsp; &nbsp; &nbsp; 
                      <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>

                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="eMedicineShop.Models.Category" DeleteMethod="DeleteCategory" InsertMethod="InsertCategory" SelectMethod="GetCategories" TypeName="eMedicineShop.Models.CategroyObj" UpdateMethod="UpdateCategory"></asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
