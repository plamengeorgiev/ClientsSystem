<%@ Page Title="Add New Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddOrder.aspx.cs" Inherits="ClientSystem.AddOrder" %>

<asp:Content ID="ContentAddOrder" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ValidationSummary runat="server" ShowModelStateErrors="true" />

    <asp:RequiredFieldValidator runat="server" ControlToValidate="FirmNameTextBox"
        ErrorMessage="Please enter Client Firm Name" Display="None" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="NumberOfCopiesTextBox"
        ErrorMessage="Please enter number of copies" Display="None"/>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="SingleDiscPrice"
        ErrorMessage="Please enter Single Disc Price" Display="None"/>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="TotalPrice"
        ErrorMessage="Please enter Total Price" Display="None"/>  

    <hr />
    <div class="container">
        <div class="row">
            <span class="col-sm-2 control-label">Client Firm:</span>
            <asp:TextBox ID="FirmNameTextBox" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
        </div>

        <div class="row">
            <span class="col-sm-2 control-label">Client Name:</span>
            <asp:TextBox ID="ContactName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="row">
            <span class="col-sm-2 control-label">Mobile Phone One:</span>
            <asp:TextBox ID="MobilePhoneOne" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="row">
            <span class="col-sm-2 control-label">Mobile Phone Two:</span>
            <asp:TextBox ID="MobilePhoneTwo" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="row">
            <span class="col-sm-2 control-label">Email:</span>
            <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="row">
            <span class="col-sm-2 control-label">Delivery Address</span>
            <asp:TextBox runat="server" ID="TextBoxDeliverAddress"
                CssClass="form-control">                           
            </asp:TextBox>
        </div>

        <div class="row">
            <span class="col-sm-2 control-label">Invoice Name:</span>
            <asp:TextBox runat="server" ID="TextBoxInvoiceName"
                CssClass="form-control">                           
            </asp:TextBox>
        </div>
        <br />

        <asp:UpdatePanel ID="UpdatePanelDiscInfo" UpdateMode="Conditional"
            runat="server" class="panel">
            <ContentTemplate>
                <div class="row ">
                    <div class="col-sm-2 control-label">Number Of Copies</div>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="NumberOfCopiesTextBox" CssClass="form-control" TextMode="Number"
                            AutoPostBack="true"
                            OnTextChanged="CalculatePrices">                           
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row ">
                    <div class="col-sm-2 control-label">Carrier Type:</div>
                    <div class="col-md-3">
                        <asp:DropDownList runat="server" ID="DropDownListCarrierType"
                            CssClass="form-control"
                            ItemType="ClientSystem.Models.Enumerations.CarrierType"
                            SelectMethod="GetCarrierTypes"
                            AppendDataBoundItems="true"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="CalculatePrices">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row ">
                    <div class="col-sm-2 control-label">Carrier Brand:</div>
                    <div class="col-md-3">
                        <asp:DropDownList runat="server" ID="DropDownListCarrierBrands" DataTextField="Name" CssClass="form-control"
                            DataValueField="Id" ItemType="ClientSystem.Models.CarrierBrand" SelectMethod="GetCarrierBrands"
                            AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="CalculatePrices">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:TextBox ID="TextBoxCarrierBrand" CssClass="form-control" runat="server" Visible="false"
                            OnTextChanged="CalculateSingleDiscPrice" AutoPostBack="true"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2 control-label">Carrier Record:</div>
                    <div class="col-md-3">
                        <asp:DropDownList runat="server" ID="DropDownListCarrierRecords" DataTextField="Name"
                            CssClass="form-control"
                            DataValueField="Id" ItemType="ClientSystem.Models.CarrierRecord"
                            SelectMethod="GetCarrierRecords"
                            AppendDataBoundItems="true"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="CalculatePrices">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:TextBox ID="TextBoxCarrierRecord" CssClass="form-control" runat="server" Visible="false"
                            OnTextChanged="CalculateSingleDiscPrice" AutoPostBack="true"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2 control-label">Carrier Print:</div>
                    <div class="col-md-3">
                        <asp:DropDownList runat="server" ID="DropDownListCarrierPrints" DataTextField="Name"
                            CssClass="form-control"
                            DataValueField="Id" ItemType="ClientSystem.Models.CarrierPrint"
                            SelectMethod="GetCarrierPrints"
                            AppendDataBoundItems="true"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="CalculatePrices">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:TextBox ID="TextBoxCarrierPrint" CssClass="form-control" runat="server" Visible="false"
                            OnTextChanged="CalculateSingleDiscPrice" AutoPostBack="true"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2 control-label">Carrier Box:</div>
                    <div class="col-md-3">
                        <asp:DropDownList runat="server" ID="DropDownListCarrierBoxes" DataTextField="Name"
                            CssClass="form-control"
                            DataValueField="Id" ItemType="ClientSystem.Models.CarrierBox"
                            SelectMethod="GetCarrierBoxes"
                            AppendDataBoundItems="true"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="CalculatePrices">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:TextBox ID="TextBoxCarrierBox" CssClass="form-control" runat="server" Visible="false"
                            OnTextChanged="CalculateSingleDiscPrice" AutoPostBack="true"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2 control-label">Carrier Cover:</div>
                    <div class="col-md-3">
                        <asp:DropDownList runat="server" ID="DropDownListCarrierCovers" DataTextField="Name"
                            CssClass="form-control"
                            DataValueField="Id" ItemType="ClientSystem.Models.CarrierCover"
                            SelectMethod="GetCarrierCovers"
                            AppendDataBoundItems="true"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="CalculatePrices">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:TextBox ID="TextBoxCarrierCover" CssClass="form-control" runat="server" Visible="false"
                            OnTextChanged="CalculateSingleDiscPrice" AutoPostBack="true"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2 control-label">Carrier Accessory:</div>
                    <div class="col-md-3">
                        <asp:DropDownList runat="server" ID="DropDownListCarrierAccessories" DataTextField="Name"
                            CssClass="form-control"
                            DataValueField="Id" ItemType="ClientSystem.Models.CarrierAccessory"
                            SelectMethod="GetCarrierAccessories"
                            AppendDataBoundItems="true"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="CalculatePrices">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:TextBox ID="TextBoxCarrierAccessory" CssClass="form-control" runat="server" Visible="false"
                            OnTextChanged="CalculateSingleDiscPrice" AutoPostBack="true"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2 control-label">Single Disc Price</div>
                    <div class="col-md-3">
                        <asp:TextBox ID="SingleDiscPrice" CssClass="form-control" runat="server"
                            OnTextChanged="CalculateTotalPrice" AutoPostBack="true"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2 control-label">Total Price</div>
                    <div class="col-md-3">
                        <asp:TextBox ID="TotalPrice" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:FormView runat="server" ID="addOrderForm"
            ItemType="ClientSystem.Models.Order"
            InsertMethod="addOrderForm_InsertItem" DefaultMode="Insert"
            RenderOuterTable="false" OnItemInserted="addOrderForm_ItemInserted">
            <InsertItemTemplate>
                <div class="row">
                    <span class="col-sm-2 control-label">Disc Name:</span>
                    <asp:TextBox runat="server" ID="DiscNameTextBox" Text=" <%#: BindItem.DiscName %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <div class="row">
                    <span class="col-sm-2 control-label">Varnishing:</span>
                    <asp:CheckBox runat="server" ID="CheckboxVarnishing" Checked="<%# BindItem.Varnishing %>"></asp:CheckBox>
                </div>

                <div class="row">
                    <span class="col-sm-2 control-label">Additional Info:</span>
                    <asp:TextBox runat="server" ID="TextBoxAdditionalInfo"
                        CssClass="form-control" Text=" <%#: BindItem.AdditionalInformation %>">                           
                    </asp:TextBox>
                </div>

                <div class="row">
                    <span class="col-sm-2 control-label">Delivery:</span>
                    <asp:CheckBox runat="server" ID="CheckBoxDelivery" Checked="<%# BindItem.Delivery %>"></asp:CheckBox>
                </div>

                <div class="row">
                    <span class="col-sm-2 control-label">Payment Type:</span>
                    <asp:DropDownList runat="server" ID="DropDownPaymentType"
                        CssClass="form-control"
                        ItemType="ClientSystem.Models.Enumerations.PaymentType"
                        SelectedValue="<%#: BindItem.PaymentType %>" SelectMethod="GetPaymentTypes">
                    </asp:DropDownList>
                </div>

                <div class="row">
                    <span class="col-sm-2 control-label">Proforma:</span>
                    <asp:CheckBox runat="server" ID="CheckBoxProforma" Checked="<%# BindItem.Proforma %>"></asp:CheckBox>
                </div>

                <div class="row">
                    <span class="col-sm-2 control-label">Advance</span>
                    <asp:TextBox runat="server" ID="TextBoxAdvance"
                        CssClass="form-control" Text=" <%#: BindItem.Advance %>">                           
                    </asp:TextBox>
                </div>

                <div class="row">
                    <span class="col-sm-2 control-label">Surcharge</span>
                    <asp:TextBox runat="server" ID="TextBoxSurcharge"
                        CssClass="form-control" Text=" <%#: BindItem.Surcharge %>">                           
                    </asp:TextBox>
                </div>

                <asp:Button runat="server" Text="Insert" CommandName="Insert" CssClass="btn btn-default" />
                <asp:Button runat="server" Text="Cancel" CausesValidation="false" OnClick="CancelButton_Click" CssClass="btn btn-default" />
            </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
