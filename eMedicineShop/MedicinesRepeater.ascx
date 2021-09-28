<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MedicinesRepeater.ascx.cs" Inherits="eMedicineShop.MedicinesRepeater" %>

<div class="col-md-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Categories</h3>
        </div>
        <div class="panel-body">
            <asp:Repeater ID="categoriesRepeater" runat="server" SelectMethod="categoriesRepeater_GetData" OnItemDataBound="categoriesRepeater_ItemDataBound">
                <HeaderTemplate>
                    <div class="list-group">
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:HyperLink CssClass="list-group-item" ID="hlCategory" runat="server" NavigateUrl='<%# Eval("CategoryId", "MedicineList.aspx?id={0}") %>'>
                                    <%# Eval("CategoryName") %>
                                    <span class="badge"><%# Eval("Count") %></span>
                    </asp:HyperLink>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>
