<%@ Page Title="Carrier Accessories" Language="C#" MasterPageFile="~/EditPrices.master" AutoEventWireup="true" CodeBehind="CarrierAccessories.aspx.cs" Inherits="ClientSystem.CarrierAccessories" %>
<asp:Content ID="ContentCarrierAccessories" ContentPlaceHolderID="ChildContent" runat="server">
     <h1><%: Title %></h1>
    <asp:GridView runat="server" ID="CarrierAccessoriesGrid" CssClass="table table-hover"
        ItemType="ClientSystem.Models.CarrierAccessory" DataKeyNames="Id"
        SelectMethod="CarrierAccessoriesGrid_GetData"
        AutoGenerateColumns="false"
        UpdateMethod="CarrierAccessoriesGrid_UpdateItem"
        DeleteMethod="CarrierAccessoriesGrid_DeleteItem"
        AutoGenerateEditButton="true"
        AllowSorting="true"
        AllowPaging="true" PageSize="10">
        <Columns>
            <asp:DynamicField DataField="Name" />
            <asp:DynamicField DataField="PriceCategory1" HeaderText="PriceCat1" />
            <asp:DynamicField DataField="PriceCategory2" HeaderText="PriceCat2" />
            <asp:DynamicField DataField="PriceCategory3" HeaderText="PriceCat3" />
            <asp:DynamicField DataField="PriceCategory4" HeaderText="PriceCat4" />
            <asp:DynamicField DataField="PriceCategory5" HeaderText="PriceCat5" />
            <asp:DynamicField DataField="PriceCategory6" HeaderText="PriceCat6" />
            <asp:DynamicField DataField="PriceCategory7" HeaderText="PriceCat7" />
        </Columns>
    </asp:GridView>
    <asp:HyperLink NavigateUrl="~/AddPages/AddCarrierAccessory" Text="Add Carrier Accessory" runat="server" class="btn btn-default" />
</asp:Content>
