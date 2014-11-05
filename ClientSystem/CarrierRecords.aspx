<%@ Page Title="Carrier Records" Language="C#" MasterPageFile="~/EditPrices.master" AutoEventWireup="true" CodeBehind="CarrierRecords.aspx.cs" Inherits="ClientSystem.CarrierRecords" %>
<asp:Content ID="ContentCarrierRecords" ContentPlaceHolderID="ChildContent" runat="server">
    <h1><%: Title %></h1>
    <asp:GridView runat="server" ID="CarrierRecordsGrid" CssClass="table table-hover"
        ItemType="ClientSystem.Models.CarrierRecord" DataKeyNames="Id"
        SelectMethod="CarrierRecordsGrid_GetData"
        AutoGenerateColumns="false"
        UpdateMethod="CarrierRecordsGrid_UpdateItem"
        DeleteMethod="CarrierRecordsGrid_DeleteItem"
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
    <asp:HyperLink NavigateUrl="~/AddPages/AddCarrierRecord" Text="Add Carrier Record" runat="server" class="btn btn-default" />
</asp:Content>
