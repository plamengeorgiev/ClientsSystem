<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ClientSystem.OrderDetails" %>

<asp:Content ID="ContentOrderDetails" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="no-print"><%: Title %></h1>
    <asp:FormView runat="server" ID="FormViewOrderDetails" ItemType="ClientSystem.Models.Order"
        SelectMethod="FormViewOrderDetails_GetItem"
        UpdateMethod="FormViewOrderDetails_UpdateItem">
        <ItemTemplate>
            <table class="table table-bordered table-condensed table-print">
                <tbody>
                    <tr>
                        <td class="col-md-4">Order Number:</td>
                        <td class="col-md-4"><%#: Item.Id %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Order Date:</td>
                        <td class="col-md-4"><%#: Item.Date %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Disc Name:</td>
                        <td class="col-md-4"><%#: Item.DiscName %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Firm Name:</td>
                        <td class="col-md-4"><%#: Item.FirmName %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Contact Name:</td>
                        <td class="col-md-4"><%#: Item.ContactName %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Mobile Phone One:</td>
                        <td class="col-md-4"><%#: Item.MobilePhoneOne %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Mobile Phone Two:</td>
                        <td class="col-md-4"><%#: Item.MobilePhoneTwo %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Number Of Copies:</td>
                        <td class="col-md-4"><%#: Item.NumberOfCopies %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Type:</td>
                        <td class="col-md-4"><%#: Item.Carrier %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Brand:</td>
                        <td class="col-md-4"><%#: Item.CarrierBrand!=null ? Item.CarrierBrand.Name : ""  %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Record:</td>
                        <td class="col-md-4"><%#:Item.CarrierRecord!=null ? Item.CarrierRecord.Name : "" %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Print:</td>
                        <td class="col-md-4"><%#: Item.CarrierPrint!=null ? Item.CarrierPrint.Name : "" %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Varnishing:</td>
                        <td class="col-md-4"></span><%#: Item.Varnishing!=false ? "Yes" : "No" %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Box:</td>
                        <td class="col-md-4"><%#: Item.CarrierBox!=null ? Item.CarrierBox.Name : ""  %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Cover:</td>
                        <td class="col-md-4"><%#: Item.CarrierCover!=null ? Item.CarrierCover.Name : ""  %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Accessory:</td>
                        <td class="col-md-4"><%#: Item.CarrierAccessory!=null ? Item.CarrierAccessory.Name : ""  %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Additional Information:</td>
                        <td class="col-md-4"><%#: Item.AdditionalInformation %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Delivery:</td>
                        <td class="col-md-4"><%#: Item.Delivery!=false ? "Yes" : "No"  %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Delivery Address:</td>
                        <td class="col-md-4"><%#: Item.DeliveryAddress %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Invoice Name:</td>
                        <td class="col-md-4"><%#: Item.InvoiceName %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Payment Type:</td>
                        <td class="col-md-4"><%#: Item.PaymentType %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Proforma:</td>
                        <td class="col-md-4"><%#: Item.Proforma!=false? "Yes" : "No" %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Advance:</td>
                        <td class="col-md-4"><%#: Item.Advance%></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Surcharge:</td>
                        <td class="col-md-4"><%#: Item.Surcharge%></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Single Disc Price:</td>
                        <td class="col-md-4"><%#: Item.SingleDiscPrice%></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Total Price:</td>
                        <td class="col-md-4"><%#: Item.TotalPrice%></td>
                        <td class="col-md-4"></td>
                    </tr>
                </tbody>
            </table>
            <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-default no-print" />
            <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default  no-print"/>
        </ItemTemplate>
        <EditItemTemplate>
            <table class="table table-bordered table-condensed table-print">
                <tbody>
                    <tr>
                        <td class="col-md-4">Order Number:</td>
                        <td class="col-md-4"><%#: Item.Id %></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Order Date:</td>
                        <td class="col-md-4"><%#: Item.Date %>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Disc Name:</td>
                        <td class="col-md-4">
                            <asp:TextBox ID="TextBoxDiscName" CssClass="form-control" runat="server" Text='<%# BindItem.DiscName %>' />
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Firm Name:</td>
                        <td class="col-md-4">
                            <asp:TextBox ID="TextBoxFirmName" CssClass="form-control" runat="server" Text='<%# BindItem.FirmName %>' />
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Contact Name:</td>
                        <td class="col-md-4">
                            <asp:TextBox ID="TextBoxContactName" CssClass="form-control" runat="server" Text='<%# BindItem.ContactName %>' />
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Mobile Phone One:</td>
                        <td class="col-md-4">
                            <asp:TextBox ID="TextBoxMobilePhoneOne" CssClass="form-control" runat="server" Text='<%# BindItem.MobilePhoneOne %>' />
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Mobile Phone Two:</td>
                        <td class="col-md-4">
                            <asp:TextBox ID="TextBoxMobilePhoneTwo" CssClass="form-control" runat="server" Text='<%# BindItem.MobilePhoneTwo %>' />
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Number Of Copies:</td>
                        <td class="col-md-4">
                            <asp:TextBox ID="TextBoxNumberOfCopies" CssClass="form-control" runat="server" Text='<%# BindItem.NumberOfCopies %>' />
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Type:</td>
                        <td class="col-md-4">
                            <asp:DropDownList runat="server" ID="DropDownCarrierType"
                                CssClass="form-control"
                                ItemType="ClientSystem.Models.Enumerations.CarrierType"
                                SelectedValue="<%#: BindItem.Carrier %>" SelectMethod="GetCarrierTypes">
                            </asp:DropDownList></td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Brand:</td>
                        <td class="col-md-4">
                            <asp:DropDownList runat="server" ID="DropDownListCarrierBrands" DataTextField="Name"
                                CssClass="form-control"
                                DataValueField="Id" ItemType="ClientSystem.Models.CarrierBrand"
                                SelectedValue="<%#: BindItem.CarrierBrandId %>" SelectMethod="GetCarrierBrands"
                                AppendDataBoundItems="true"
                                AutoPostBack="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Record:</td>
                        <td class="col-md-4">
                            <asp:DropDownList runat="server" ID="DropDownListCarrierRecords" DataTextField="Name"
                                CssClass="form-control"
                                DataValueField="Id" ItemType="ClientSystem.Models.CarrierRecord"
                                SelectedValue="<%#: BindItem.CarrierRecordId %>" SelectMethod="GetCarrierRecords"
                                AppendDataBoundItems="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Print:</td>
                        <td class="col-md-4">
                            <asp:DropDownList runat="server" ID="DropDownListCarrierPrints" DataTextField="Name"
                                CssClass="form-control"
                                DataValueField="Id" ItemType="ClientSystem.Models.CarrierPrint"
                                SelectedValue="<%#: BindItem.CarrierPrintId %>" SelectMethod="GetCarrierPrints"
                                AppendDataBoundItems="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Varnishing:</td>
                        <td class="col-md-4"></span>
                            <asp:CheckBox runat="server" ID="CheckboxVarnishing" Checked="<%# BindItem.Varnishing %>"></asp:CheckBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Box:</td>
                        <td class="col-md-4">
                            <asp:DropDownList runat="server" ID="DropDownListCarrierBoxes" DataTextField="Name"
                                CssClass="form-control"
                                DataValueField="Id" ItemType="ClientSystem.Models.CarrierBox"
                                SelectedValue="<%#: BindItem.CarrierBoxId %>" SelectMethod="GetCarrierBoxes"
                                AppendDataBoundItems="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Cover:</td>
                        <td class="col-md-4">
                            <asp:DropDownList runat="server" ID="DropDownListCarrierCovers" DataTextField="Name"
                                CssClass="form-control"
                                DataValueField="Id" ItemType="ClientSystem.Models.CarrierCover"
                                SelectedValue="<%#: BindItem.CarrierCoverId %>" SelectMethod="GetCarrierCovers"
                                AppendDataBoundItems="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Carrier Accessory:</td>
                        <td class="col-md-4">
                            <asp:DropDownList runat="server" ID="DropDownListCarrierAccessories" DataTextField="Name"
                                CssClass="form-control"
                                DataValueField="Id" ItemType="ClientSystem.Models.CarrierAccessory"
                                SelectedValue="<%#: BindItem.CarrierAccessoryId %>" SelectMethod="GetCarrierAccessories"
                                AppendDataBoundItems="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Additional Information:</td>
                        <td class="col-md-4">
                            <asp:TextBox runat="server" ID="TextBoxAdditionalInfo"
                                CssClass="form-control" Text=" <%#: BindItem.AdditionalInformation %>">                           
                            </asp:TextBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Delivery:</td>
                        <td class="col-md-4">
                            <asp:CheckBox runat="server" ID="CheckBoxDelivery" Checked="<%# BindItem.Delivery %>"></asp:CheckBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Delivery Address:</td>
                        <td class="col-md-4">
                            <asp:TextBox runat="server" ID="TextBoxDeliveryAddress"
                                CssClass="form-control" Text=" <%#: BindItem.DeliveryAddress %>">                           
                            </asp:TextBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Invoice Name:</td>
                        <td class="col-md-4">
                            <asp:TextBox runat="server" ID="TextBoxInvoiceName"
                                CssClass="form-control" Text=" <%#: BindItem.InvoiceName %>">                           
                            </asp:TextBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Payment Type:</td>
                        <td class="col-md-4">
                            <asp:DropDownList runat="server" ID="DropDownPaymentType"
                                CssClass="form-control"
                                ItemType="ClientSystem.Models.Enumerations.PaymentType"
                                SelectedValue="<%#: BindItem.PaymentType %>" SelectMethod="GetPaymentTypes">
                            </asp:DropDownList>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Proforma:</td>
                        <td class="col-md-4">
                            <asp:CheckBox runat="server" ID="CheckBoxProforma" Checked="<%# BindItem.Proforma %>"></asp:CheckBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Advance:</td>
                        <td class="col-md-4">
                            <asp:TextBox runat="server" ID="TextBoxAdvance"
                                CssClass="form-control" Text=" <%#: BindItem.Advance %>">                           
                            </asp:TextBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Surcharge:</td>
                        <td class="col-md-4">
                            <asp:TextBox runat="server" ID="TextBoxSurcharge"
                                CssClass="form-control" Text=" <%#: BindItem.Surcharge %>">                           
                            </asp:TextBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Single Disc Price:</td>
                        <td class="col-md-4">
                            <asp:TextBox runat="server" ID="TextBoxSingleDiscPrice"
                                CssClass="form-control" Text=" <%#: BindItem.SingleDiscPrice %>">                           
                            </asp:TextBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                    <tr>
                        <td class="col-md-4">Total Price:</td>
                        <td class="col-md-4">
                            <asp:TextBox runat="server" ID="TextBoxTotalPrice"
                                CssClass="form-control" Text=" <%#: BindItem.TotalPrice %>">                           
                            </asp:TextBox>
                        </td>
                        <td class="col-md-4"></td>
                    </tr>
                </tbody>
            </table>
            <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-default" />
            <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
        </EditItemTemplate>
    </asp:FormView>
</asp:Content>