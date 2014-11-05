<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="ClientSystem.OrdersList" %>

<asp:Content ID="ContentOrders" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %></h1>
    <asp:GridView runat="server" ID="OrdersGrid" ItemType="ClientSystem.Models.Order" DataKeyNames="Id"
        CssClass="table table-hover"
        SelectMethod="OrdersGrid_GetData"
        AutoGenerateColumns="false"
        AutoGenerateEditButton="true"
        UpdateMethod="OrdersGrid_UpdateItem"
        AllowSorting="true"
        AllowPaging="true" PageSize="10">
        <Columns>
            <asp:DynamicField DataField="Id" ReadOnly="true" />
            <asp:DynamicField DataField="Date" ReadOnly="true" />
            <asp:DynamicField DataField="NumberOfCopies" ReadOnly="true" />
            <asp:DynamicField DataField="Carrier" ReadOnly="true" />
            <asp:DynamicField DataField="AdditionalInformation" />
            <asp:DynamicField DataField="FirmName" ReadOnly="true" />
            <asp:DynamicField DataField="ContactName" ReadOnly="true" />
            <asp:DynamicField DataField="MobilePhoneOne" ReadOnly="true" />

            <asp:TemplateField HeaderText="Order Details">
                <ItemTemplate>
                    <asp:HyperLink NavigateUrl='<%# string.Format("~/OrderDetails.aspx?id={0}", Item.Id) %>' runat="server" Text="Details" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div class="row">
        <asp:HyperLink NavigateUrl="~/AddPages/AddOrder" Text="Add New Order" runat="server" class="btn btn-default" />
    </div>
</asp:Content>
