<%@ Page Title="Add Carrier Print" Language="C#" MasterPageFile="~/EditPrices.master" AutoEventWireup="true" CodeBehind="AddCarrierPrint.aspx.cs" Inherits="ClientSystem.AddCarrierPrint" %>
<asp:Content ID="ContentAddCarrierPrint" ContentPlaceHolderID="ChildContent" runat="server">
    <h2><%: Title %></h2>
    <asp:FormView runat="server" ID="addCarrierPrint"
        ItemType="ClientSystem.Models.CarrierPrint"
        InsertMethod="addCarrierPrint_InsertItem" DefaultMode="Insert"
        RenderOuterTable="false" OnItemInserted="addCarrierPrint_ItemInserted">
        <InsertItemTemplate>
            <fieldset>
                 <div>
                    <span class="col-sm-2 control-label">Carrier Print Name:</span>
                    <asp:TextBox runat="server" ID="CarrierPrintNameTextBox" Text=" <%#: BindItem.Name %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <div>
                    <span class="col-sm-2 control-label">Price Category 1:</span>
                    <asp:TextBox runat="server" ID="PriceCat1TextBox" Text=" <%#: BindItem.PriceCategory1 %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

               <div>
                    <span class="col-sm-2 control-label">Price Category 2:</span>
                    <asp:TextBox runat="server" ID="PriceCat2TextBox" Text=" <%#: BindItem.PriceCategory2 %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>
                <div>
                    <span class="col-sm-2 control-label">Price Category 3:</span>
                    <asp:TextBox runat="server" ID="PriceCat3TextBox" Text=" <%#: BindItem.PriceCategory3 %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>
                <div>
                    <span class="col-sm-2 control-label">Price Category 4:</span>
                    <asp:TextBox runat="server" ID="PriceCat4TextBox" Text=" <%#: BindItem.PriceCategory4 %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>
                <div>
                    <span class="col-sm-2 control-label">Price Category 5:</span>
                    <asp:TextBox runat="server" ID="PriceCat5TextBox" Text=" <%#: BindItem.PriceCategory5 %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>
                <div>
                    <span class="col-sm-2 control-label">Price Category 6:</span>
                    <asp:TextBox runat="server" ID="PriceCat6TextBox" Text=" <%#: BindItem.PriceCategory6 %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>
                <div>
                    <span class="col-sm-2 control-label">Price Category 7:</span>
                    <asp:TextBox runat="server" ID="PriceCat7TextBox" Text=" <%#: BindItem.PriceCategory7 %>" CssClass="form-control">                           
                    </asp:TextBox>
                </div>

                <asp:Button runat="server" Text="Insert" CommandName="Insert" CssClass="btn btn-default"/>
                <asp:Button runat="server" Text="Cancel" CausesValidation="false" OnClick="CancelButton_Click" CssClass="btn btn-default"/>
            </fieldset>
        </InsertItemTemplate>
    </asp:FormView>
</asp:Content>
