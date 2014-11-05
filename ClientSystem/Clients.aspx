<%@ Page Title="Clients" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Clients.aspx.cs" Inherits="ClientSystem.ClientsList" %>

<asp:Content ID="ContentClients" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <h1><%: Title %></h1>
        <div class="row">
            <asp:TextBox runat="server" ID="TextBoxSearchParam" name="q" class="col-md-6 form-control" placeholder="Search by Name / Firm"></asp:TextBox>
        </div>
        <br />
        <div class="row">
            <asp:LinkButton runat="server" ID="LinkButtonSearch" OnClick="LinkButtonSearch_Click" class="btn btn-default" Text="Search"></asp:LinkButton>
        </div>
        <br />
        <div class="row">
            <asp:GridView runat="server" ID="clientsGrid" CssClass="table table-hover"
                ItemType="ClientSystem.Models.Client" DataKeyNames="Id"
                SelectMethod="clientsGrid_GetData"
                AutoGenerateColumns="false"
                UpdateMethod="clientsGrid_UpdateItem"
                AutoGenerateEditButton="true"
                AllowSorting="true"
                AllowPaging="true" PageSize="10">
                <Columns>
                    <asp:DynamicField DataField="FirmName" />
                    <asp:DynamicField DataField="ContactName" />
                    <asp:DynamicField DataField="MobilePhoneOne" />
                    <asp:DynamicField DataField="MobilePhoneTwo" />
                    <asp:DynamicField DataField="Email" />
                    <asp:DynamicField DataField="InvoiceName" />
                    <asp:DynamicField DataField="DeliveryAddress" />
                    <asp:HyperLinkField Text="Orders" DataNavigateUrlFormatString="~/Orders.aspx?firm={0}"
                        DataNavigateUrlFields="FirmName" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="row">
            <asp:HyperLink NavigateUrl="~/AddPages/AddClient" Text="Add New Client" runat="server" class="btn btn-default" />
        </div>
    </div>
</asp:Content>
