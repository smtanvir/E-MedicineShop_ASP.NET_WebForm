<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmailSend.aspx.cs" Inherits="eMedicineShop.EmailSend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
            <div class="col-md-6 my-5">
                <div runat="server" class="alert" id="alert" visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-label="close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <p runat="server" id="msg"></p>
                </div>                
                <h2 class="display-5" style="color: #50D8AF;">Send us a message</h2>
                <div class="form-group">
                    <label class="control-label">To</label>
                    <asp:TextBox ID="txtTo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Message</label>
                    <asp:TextBox ID="txtMessage" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Text="Send" OnClick="btnSend_Click" />
                </div>

            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-4 my-5">
                <img src="Uploads/iStock_000020812563ContactUs.png" />
            </div>
        </div>
</asp:Content>
