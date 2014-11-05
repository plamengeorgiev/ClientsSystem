﻿<%@ Page Title="Carrier Covers" Language="C#" MasterPageFile="~/EditPrices.master" AutoEventWireup="true" CodeBehind="CarrierCovers.aspx.cs" Inherits="ClientSystem.CarrierCovers" %>
<asp:Content ID="ContentCarrierCovers" ContentPlaceHolderID="ChildContent" runat="server">
     <h1><%: Title %></h1>
    <asp:GridView runat="server" ID="CarrierCoversGrid" CssClass="table table-hover"
        ItemType="ClientSystem.Models.CarrierCover" DataKeyNames="Id"
        SelectMethod="CarrierCoversGrid_GetData"
        AutoGenerateColumns="false"
        UpdateMethod="CarrierCoversGrid_UpdateItem"
        DeleteMethod="CarrierCoversGrid_DeleteItem"
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
    <asp:HyperLink NavigateUrl="~/AddPages/AddCarrierCover" Text="Add Carrier Cover" runat="server" class="btn btn-default" />
</asp:Content>
