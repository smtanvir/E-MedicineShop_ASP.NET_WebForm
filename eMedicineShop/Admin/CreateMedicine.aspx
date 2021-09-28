<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="CreateMedicine.aspx.cs" Inherits="eMedicineShop.Admin.CreateMedicine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <asp:FormView ID="MedicineInsertView" runat="server" DataKeyNames="MedicineId" DefaultMode="Insert" ItemType="eMedicineShop.Models.Medicine" InsertMethod="MedicineInsertView_InsertItem" OnItemInserting="MedicineInsertView_ItemInserting">
                <EditItemTemplate>
                    ProductId:
                    <asp:Label ID="ProductIdLabel1" runat="server" Text='<%# Eval("MedicineId") %>' />
                    <br />
                    ProductName:
                    <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("MedicineName") %>' />
                    <br />
                    UnitPrice:
                    <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("UnitDescription") %>' />
                    <br />
                    PictureFile:
                    <asp:TextBox ID="PictureFileTextBox" runat="server" Text='<%# Bind("PictureFile") %>' />
                    <br />
                    CategoryId:
                    <asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Product Name:
                    <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("MedicineName") %>' CssClass="form-control" />
                    <br />
                    Unit Price:
                    <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' CssClass="form-control" />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("UnitDescription") %>' CssClass="form-control" />
                    <br />
                    Picture File:
                    <asp:HiddenField ID="PictureFileHidden" runat="server" Value='<%# Bind("PictureFile") %>' />
                    <asp:FileUpload ID="PictureFileUpload" runat="server" CssClass="form-control" />
                    <br />
                    Category Name:
                   <%-- <asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' CssClass="form-control" />--%>
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryId">
                        <asp:ListItem Selected="True">Select One</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-primary btn-sm"></asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger btn-sm"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    ProductId:
                    <asp:Label ID="ProductIdLabel" runat="server" Text='<%# Eval("MedicineId") %>' />
                    <br />
                    ProductName:
                    <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("MedicineName") %>' />
                    <br />
                    UnitPrice:
                    <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Bind("UnitPrice") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("UnitDescription") %>' />
                    <br />
                    PictureFile:
                    <asp:Label ID="PictureFileLabel" runat="server" Text='<%# Bind("PictureFile") %>' />
                    <br />
                    CategoryId:
                    <asp:Label ID="CategoryIdLabel" runat="server" Text='<%# Bind("CategoryId") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
             <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryId">
                        <asp:ListItem Selected="True">Select One</asp:ListItem>
              </asp:DropDownList>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eMedicineShopCon %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
</asp:Content>
