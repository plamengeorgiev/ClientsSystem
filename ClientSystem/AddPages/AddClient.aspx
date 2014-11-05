<%@ Page Title="Add New Client" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddClient.aspx.cs" Inherits="ClientSystem.AddClient" %>

<asp:Content ID="ContentAddClient" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ValidationSummary runat="server" ShowModelStateErrors="true" />
    <h1><%: Title %></h1>
    <asp:FormView runat="server" ID="addOClientForm"
        ItemType="ClientSystem.Models.Client"
        InsertMethod="addClientForm_InsertItem" DefaultMode="Insert"
        RenderOuterTable="false" OnItemInserted="addClientForm_ItemInserted">
        <InsertItemTemplate>
            <fieldset>
                 <div>
                    <span class="col-sm-2 control-label">Firm Name:</span>
                    <asp:TextBox runat="server" ID="FirmNameTextBox" Text=" <%#: BindItem.FirmName %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <div>
                    <span class="col-sm-2 control-label">Contact Name:</span>
                    <asp:TextBox runat="server" ID="ContactNameTextBox" Text=" <%#: BindItem.ContactName %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <div>
                    <span class="col-sm-2 control-label">Mobile Phone One:</span>
                    <asp:TextBox runat="server" ID="MobilePhoneOneTextBox" Text=" <%#: BindItem.MobilePhoneOne %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <div>
                    <span class="col-sm-2 control-label">Mobile Phone Two:</span>
                    <asp:TextBox runat="server" ID="MobilePhoneTwoTextBox" Text=" <%#: BindItem.MobilePhoneTwo %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <div>
                    <span class="col-sm-2 control-label">Email:</span>
                    <asp:TextBox runat="server" ID="EmailTextBox" Text=" <%#: BindItem.Email %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <div>
                    <span class="col-sm-2 control-label">Invoice Name:</span>
                    <asp:TextBox runat="server" ID="InvoiceNameTextBox" Text=" <%#: BindItem.InvoiceName %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <div>
                    <span class="col-sm-2 control-label">Delivery Address:</span>
                    <asp:TextBox runat="server" ID="DeliveryAddressTextBox" Text=" <%#: BindItem.DeliveryAddress%>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <asp:Button runat="server" Text="Insert" CommandName="Insert" CssClass="btn btn-default"/>
                <asp:Button runat="server" Text="Cancel" CausesValidation="false" OnClick="CancelButton_Click" CssClass="btn btn-default"/>
            </fieldset>
        </InsertItemTemplate>
    </asp:FormView>
</asp:Content>
