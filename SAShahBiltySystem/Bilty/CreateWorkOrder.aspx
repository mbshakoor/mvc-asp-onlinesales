<%@ Page Title="" Language="C#" MasterPageFile="~/Bilty/MasterPage.Master" AutoEventWireup="true" CodeBehind="CreateWorkOrder.aspx.cs" Inherits="SAShahBiltySystem.Bilty.CreateWorkOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Work Orders</title>
    <style>
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .list {
            list-style-type: none;
            background-color: #FFF;
            font-size: 10px;
            padding: 2px 5px;
            width: 100%;
        }

        .hoverlistitem {
            background-color: #d3d3d3;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!-- Page content -->
    <div id="page-content">
        <!-- Forms General Header -->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    <div class="modalBackground" style="position: fixed; top:100%; left: 0; width: 100%; height: 100%; z-index: 1;">
                        <img src="assets/images/loader.gif" style="position: fixed; top: 40%; left: 45%; margin-top: -50px; margin-left: -100px;">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

                <div class="content-header">
            <div class="header-section">
                <h1>
                    
                    <%--<asp:LinkButton ID="lnkAddNew" runat="server" OnClick="lnkAddNew_Click" ToolTip="Click to Add new Document Type"><i class="fas fa-plus"></i></asp:LinkButton>--%>
                    Create Work Order<br><small></small>
                </h1>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <ul class="breadcrumb breadcrumb-top">
            <li>Admin</li>
            <li><a href="javascript:;">Create Work Order</a></li>
        </ul>
        <!-- END Forms General Header -->
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                 <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
                               <!-- Basic Form Elements Block -->
                <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                 <div class="row">
                     <div class="col-md-12"> 
                       <div class="col-lg-12">
                                    <div class="col-md-3 pull-right">
                                        <label>Date</label>
                                        <asp:Label ID="lblCurrentDate" runat="server" Font-Bold="true"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="col-md-3">
                                        <label>Sender</label><asp:LinkButton ID="lnkSaveSender" runat="server" CssClass="fas fa-save pull-right" OnClick="lnkSaveSender_Click"></asp:LinkButton>
                                        <%--<asp:DropDownList ID="ddlCompanies" runat="server" ClientIDMode="Static"></asp:DropDownList>--%>
                                        <asp:TextBox ID="txtSearchSender" list="dlSenderCompany" runat="server" class="form-control" placeholder="Search Consigner/Sender" OnTextChanged="txtSearchSender_TextChanged"></asp:TextBox>
                                        <datalist id="dlSenderCompany">
                                        </datalist>

                                        <%--<ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCompanies"
                                            MinimumPrefixLength="1"
                                            CompletionListCssClass="list" 
	                                        CompletionListItemCssClass="listitem" 
	                                        CompletionListHighlightedItemCssClass="hoverlistitem"
                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                            TargetControlID="txtSearchSender"
                                            ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
                                        </ajaxToolkit:AutoCompleteExtender>--%>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Receiver</label><asp:LinkButton ID="lnkSaveNewParty" runat="server" CssClass="fas fa-save pull-right" OnClick="lnkSaveNewParty_Click"></asp:LinkButton>
                                        <%--<asp:DropDownList ID="ddlCompanies" runat="server" ClientIDMode="Static"></asp:DropDownList>--%>
                                        <%--<asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Search Consigner/Sender" AutoPostBack="true" OnTextChanged="txtSearchSender_TextChanged"></asp:TextBox>--%>

                                        <asp:TextBox ID="txtPartyNameAddress" list="dlSenderCompany" runat="server" CssClass="form-control" placeholder="Search Consignere/Receiver"></asp:TextBox>
                                        <%--<ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCompanies"
                                            MinimumPrefixLength="1"
                                            CompletionListCssClass="list" 
	                                        CompletionListItemCssClass="listitem" 
	                                        CompletionListHighlightedItemCssClass="hoverlistitem"
                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                            TargetControlID="txtPartyNameAddress"
                                            ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                                        </ajaxToolkit:AutoCompleteExtender>--%>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Bill To</label><asp:LinkButton ID="lnkAddBillTo" runat="server" CssClass="fas fa-save pull-right" OnClick="lnkAddBillTo_Click"></asp:LinkButton>
                                        <%--<asp:DropDownList ID="ddlCompanies" runat="server" ClientIDMode="Static"></asp:DropDownList>--%>
                                        <%--<asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Search Consigner/Sender" AutoPostBack="true" OnTextChanged="txtSearchSender_TextChanged"></asp:TextBox>--%>

                                        <asp:TextBox ID="txtSearchBillto" list="dlBillTo" autocomplete="off" runat="server" CssClass="form-control" placeholder="Search Consignere/Receiver"></asp:TextBox>
                                        <datalist id="dlBillTo"></datalist>

                                        <%-- <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCompanies"
                                            MinimumPrefixLength="1"
                                            CompletionListCssClass="list" 
	                                        CompletionListItemCssClass="listitem" 
	                                        CompletionListHighlightedItemCssClass="hoverlistitem"
                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                            TargetControlID="txtSearchBillto"
                                            ID="AutoCompleteExtender5" runat="server" FirstRowSelected="false">
                                        </ajaxToolkit:AutoCompleteExtender>--%>
                                    </div>
                                    <div class="col-md-3 pull-right">
                                        <label>Delivery Date </label>
                                        <asp:Label ID="lblDeliveryDate" runat="server" Style="font-weight: lighter;">(12-Dec-2019)</asp:Label>
                                        <asp:TextBox ID="txtDeliveryDate" runat="server" CssClass="form-control" TextMode="Date" placeholder="dd/mm/yyyy"></asp:TextBox>
                                    </div>
                                </div>
            <asp:HiddenField ID="hfSelectedWO" runat="server" />
                  <asp:Panel ID="pnlInput" runat="server" DefaultButton="lnkSaveRow">
                                            <table class="table table-striped dt-responsive display">
                                                <thead>
                                                    <tr>
                                                        <th>Bags</th>
                                                        <th>Package
                                                            <asp:LinkButton ID="lnkSavePackageType" runat="server" CssClass="fas fa-save pull-right" OnClick="lnkSavePackageType_Click"></asp:LinkButton></th>
                                                        <th>Product
                                                            <asp:LinkButton ID="lnkSaveProduct" runat="server" CssClass="fas fa-save pull-right" OnClick="lnkSaveProduct_Click"></asp:LinkButton></th>
                                                        <th>Weight
                                                            <asp:LinkButton ID="lnkRecalculate" runat="server" CssClass="fas fa-refresh pull-right"></asp:LinkButton></th>
                                                        <th>Account</th>
                                                        <th>Freight</th>
                                                        <th>Truck
                                                            <asp:LinkButton ID="lnkVehicle" runat="server" CssClass="fas fa-save pull-right" OnClick="lnkVehicle_Click"></asp:LinkButton></th>
                                                        <th>Advance</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <asp:HiddenField ID="hfEditID" runat="server" />
                                                <tbody>
                                                    <tr>
                                                        <td width="7%">
                                                            <asp:TextBox ID="txtQty" runat="server" autocomplete="off" CssClass="form-control" OnTextChanged="txtQty_TextChanged"></asp:TextBox></td>
                                                        <td width="10%">
                                                            <asp:TextBox ID="txtPackageType" list="dlPackageType" runat="server" CssClass="form-control"></asp:TextBox>
                                                            <datalist id="dlPackageType"></datalist>
                                                            <%--<ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchPackagetypes"
                                                                MinimumPrefixLength="1"
                                                                CompletionListCssClass="list" 
	                                                            CompletionListItemCssClass="listitem" 
	                                                            CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                TargetControlID="txtPackageType"
                                                                ID="AutoCompleteExtender3" runat="server" FirstRowSelected="false">
                                                            </ajaxToolkit:AutoCompleteExtender>--%>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox autocomplete="off" ID="txtProduct" list="dlProducts" runat="server" CssClass="form-control" OnTextChanged="txtProduct_TextChanged"></asp:TextBox>
                                                            <datalist id="dlProducts"></datalist>
                                                            <%--<ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchProducts"
                                                                MinimumPrefixLength="1"
                                                                CompletionListCssClass="list" 
	                                                            CompletionListItemCssClass="listitem" 
	                                                            CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                TargetControlID="txtProduct"
                                                                ID="AutoCompleteExtender4" runat="server" FirstRowSelected="false"
                                                                >
                                                            </ajaxToolkit:AutoCompleteExtender>--%>
                                                        </td>
                                                        <td width="10%">
                                                            <asp:TextBox ID="txtProductWeight" autocomplete="off" runat="server" CssClass="form-control"></asp:TextBox>
                                                        </td>
                                                        <td width="10%">
                                                            <asp:TextBox ID="txtAccount" autocomplete="off" runat="server" CssClass="form-control"></asp:TextBox></td>
                                                        <td width="10%">
                                                            <asp:TextBox ID="txtFreight" autocomplete="off" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox></td>
                                                        <td width="10%">
                                                            <asp:TextBox ID="txtVehicleRegNo" autocomplete="off" list="dlVehicleRegNo" runat="server" CssClass="form-control"></asp:TextBox>
                                                            <datalist id="dlVehicleRegNo"></datalist>
                                                            <%--<ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchVehicle"
                                                                MinimumPrefixLength="1"
                                                                CompletionListCssClass="list" 
	                                                            CompletionListItemCssClass="listitem" 
	                                                            CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                TargetControlID="txtVehicleRegNo"
                                                                ID="AutoCompleteExtender6" runat="server" FirstRowSelected="false">
                                                            </ajaxToolkit:AutoCompleteExtender>--%>
                                                        </td>
                                                        <td width="10%">
                                                            <asp:TextBox ID="txtAdvance" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox></td>
                                                        <td width="10%">
                                                            <asp:LinkButton ID="lnkSaveRow" runat="server" ClientIDMode="Static" CssClass="btn btn-primary" OnClick="lnkSaveRow_Click"><i class="fas fa-save"></i></asp:LinkButton></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </asp:Panel>
                      <asp:GridView ID="gvResult" runat="server" ClientIDMode="Static" EmptyDataText="No Work Order Found" AutoGenerateColumns="false" CssClass="table table-striped dt-responsive display" Font-Size="10px"
                                            DataKeyNames="WorkOrderID, BiltyID, WorkOrderDetailsID" OnDataBound="gvResult_DataBound" OnRowDataBound="gvResult_RowDataBound" OnRowCommand="gvResult_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Serial" ItemStyle-Width="3%">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Bags" ItemStyle-Width="7%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBags" runat="server" Text='<%# Eval("ProductQty") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Package" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPackageType" runat="server" Text='<%# Eval("PackageTypeString") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Party" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPartyAddress" runat="server" Text='<%# Eval("ReceiverCompany") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Product" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblProduct" runat="server" Text='<%# Eval("Product") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Weight" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblWeight" runat="server" Text='<%# Eval("Weight") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAccount" runat="server" Text='<%# Eval("Account") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Freight" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFreight" runat="server" Text='<%# Eval("Freight") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Truck" ItemStyle-Width="10%" SortExpression="VehicleRegNo" ItemStyle-VerticalAlign="Middle">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTruck" runat="server" Text='<%# Eval("VehicleRegNo") %>'></asp:Label>
                                                        <asp:LinkButton ID="lnkMakeSingleVehicleBilty" Visible="false" runat="server" CssClass="btn btn-xs btn-success" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="SingleVehicleBilty" ToolTip="Click to make Single Vehicle Bilty"><i class="fas fa-box-open"></i> | Make Bilty</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Advane" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAdvance" runat="server" Text='<%# Eval("Advance") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-xs btn-secondary" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Change"><i class="fas fa-edit"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger"><i class="fas fa-trash"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="lnkMakePartialBilty" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="makePartialBilty" CssClass="btn btn-xs btn-primary"><i class="fas fa-boxes"></i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:GridView ID="gvTotalResult" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-striped dt-responsive display" Font-Size="10px">
                                            <Columns>
                                                <asp:BoundField DataField="Total" HeaderText=""/>
                                                <asp:BoundField DataField="Qty" HeaderText="Total Qty"/>
                                                <asp:BoundField DataField="Weight" HeaderText="Total Weight"/>
                                                <asp:BoundField DataField="Freight" HeaderText="Total Freight"/>
                                                <asp:BoundField DataField="Advance" HeaderText="Total Advance"/>
                                            </Columns>
                                        </asp:GridView>
                                        <div class="col-md-12">
                                            <label>Description</label>
                                            <asp:TextBox ID="txtWorkOrderDescription" runat="server" CssClass="form-control" Columns="12" Rows="2" TextMode="MultiLine"></asp:TextBox>
                                        </div>
        </div>
                      <div class="col-md-12 m-t-10">
                                        <asp:LinkButton ID="lnkSaveWorkOrder" runat="server" CssClass="btn btn-primary pull-right" OnClick="lnkSaveWorkOrder_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                        <asp:LinkButton ID="lnkBilty" Visible="false" runat="server" OnClick="lnkBilty_Click" CssClass="btn btn-success"><i class="fas fa-box-open"></i> | Make Bilty</asp:LinkButton>
                                    </div>
                     </div>
</div>
                    </div>
                
        <ajaxToolkit:ModalPopupExtender ID="modalPartialBilty" runat="server" PopupControlID="pnlMakePartialBilty" TargetControlID="btnOpenPartialBilty"
                        CancelControlID="btnClosePartianBilty" BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>

                    <asp:Panel CssClass="col-xs-12" ID="pnlMakePartialBilty" runat="server" TabIndex="-1" role="dialog" aria-hidden="true">
                        <asp:Button ID="btnOpenPartialBilty" runat="server" Style="display: none" />
                        <asp:Button ID="btnClosePartianBilty" runat="server" Style="display: none" />

                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="pull-right" OnClick="lnkPartialBiltyClose_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                    <h4 class="modal-title">Make Partial Bilty</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="divPartialBiltyNotification" style="margin-top: 10px;" runat="server"></div>
                                    <asp:LinkButton Text="Distribute" ID="lnkDistribute" OnClick="lnkDistribute_Click" CssClass="btn-xs btn-primary pull-right" runat="server" />
                                    <div class="row">
                                        <div class="col-md-12" style="overflow-y: scroll; overflow-x: scroll; height: 300px;">
                                            <asp:GridView ID="gvPartialBilty" runat="server" EmptyDataText="No Work Order Found"
                                                CssClass="table table-striped dt-responsive display" Font-Size="10px" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField DataField="Bags" HeaderText="Bags" />
                                                    <asp:BoundField DataField="Product" HeaderText="Product" />
                                                    <asp:BoundField DataField="Truck" HeaderText="Truck" />
                                                </Columns>
                                                <HeaderStyle ForeColor="White" BackColor="Green" />
                                            </asp:GridView>
                                        </div>
                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="lnkPartialBiltyClose" runat="server" CssClass="btn btn-info" OnClick="lnkPartialBiltyClose_Click"><i class="fas fa-times"></i> | Close</asp:LinkButton>
                                    <asp:LinkButton ID="lnkPartialBiltySave" runat="server" CssClass="btn btn-success" OnClick="lnkPartialBiltySave_Click"><i class="fas fa-box-open"></i> | Save</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>



                    <ajaxToolkit:ModalPopupExtender ID="modalDistribution" runat="server" PopupControlID="pnlDistribution" TargetControlID="btnOpenDistribution"
                        CancelControlID="btnCloseDistribution" BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>

                    <asp:Panel CssClass="col-xs-12" ID="pnlDistribution" runat="server" TabIndex="-1" role="dialog" aria-hidden="true">
                        <asp:Button ID="btnOpenDistribution" runat="server" Style="display: none" />
                        <asp:Button ID="btnCloseDistribution" runat="server" Style="display: none" />
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Maroon" style="display: none;"></asp:LinkButton>--%>
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="pull-right" OnClick="lnkDistributeClose_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                    <h4 class="modal-title">Distribute Product Quantity</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="divDistributeNotification" style="margin-top: 10px;" runat="server"></div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label Text="Qty" runat="server" />
                                            <asp:TextBox runat="server" ID="txtDistributeQty" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label Text="Vehicle" runat="server" />
                                            <asp:TextBox runat="server" ID="txtDistributeVehicle" CssClass="form-control" AutoPostBack="true" />
                                            <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchVehicle"
                                                MinimumPrefixLength="1"
                                                CompletionListCssClass="list"
                                                CompletionListItemCssClass="listitem"
                                                CompletionListHighlightedItemCssClass="hoverlistitem"
                                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                TargetControlID="txtDistributeVehicle"
                                                ID="AutoCompleteExtender7" runat="server" FirstRowSelected="false">
                                            </ajaxToolkit:AutoCompleteExtender>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="lnkDistributeClose" runat="server" CssClass="btn btn-info" OnClick="lnkDistributeClose_Click"><i class="fas fa-times"></i> | Close</asp:LinkButton>
                                    <asp:LinkButton ID="lnkDistributeSave" runat="server" CssClass="btn btn-success" OnClick="lnkDistributeSave_Click"><i class="fas fa-box-open"></i> | Save</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>


                    <ajaxToolkit:ModalPopupExtender ID="modalMakeBilty" runat="server" PopupControlID="pnlMakeSingleBilty" TargetControlID="btnOpenSingleBilty"
                        CancelControlID="btnCloseSingleBilty" BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>

                    <asp:Panel CssClass="col-xs-12" ID="pnlMakeSingleBilty" runat="server" TabIndex="-1" role="dialog" aria-hidden="true">
                        <asp:Button ID="btnOpenSingleBilty" runat="server" Style="display: none" />
                        <asp:Button ID="btnCloseSingleBilty" runat="server" Style="display: none" />
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="lnkCloseIcon" runat="server" CssClass="pull-right" OnClick="lnkClose_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                    <h4 class="modal-title">Confirm</h4>
                                </div>
                                <div class="modal-body">
                                    <h4>Are you sure you want to create these records bilties</h4>
                                    <div id="divModalNotification" style="margin-top: 10px;" runat="server"></div>
                                    <asp:Label Text="text" runat="server" ID="makeBiltyStatus" Visible="false" />
                                    <div class="col-md-6">
                                        <asp:Label Text="Select Paid Or To Pay" runat="server" />
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddlPaidToPay">
                                            <asp:ListItem Text="--Select--" />
                                            <asp:ListItem Text="Paid" />
                                            <asp:ListItem Text="ToPay" />
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-md-6">
                                        <asp:Label Text="Select Own Company" runat="server" />
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddlOwnCompany">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12" style="overflow-y: scroll; overflow-x: scroll; height: 250px;">
                                            <asp:GridView ID="gvMakeBilty" runat="server" Width="100%" EmptyDataText="No Record found" AutoGenerateColumns="false"
                                                CssClass="table table-hover" Font-Size="10px" DataKeyNames="WorkOrderDetailsID" Font-Names="Open Sans" BackColor="White">
                                                <Columns>
                                                    <asp:BoundField DataField="ProductQty" HeaderText="Bags"></asp:BoundField>
                                                    <asp:BoundField DataField="PackageTypeString" HeaderText="Packaging"></asp:BoundField>
                                                    <asp:BoundField DataField="ReceiverCompany" HeaderText="Party"></asp:BoundField>
                                                    <asp:BoundField DataField="Product" HeaderText="Product"></asp:BoundField>
                                                    <asp:BoundField DataField="TotalWeight" HeaderText="Weight"></asp:BoundField>
                                                    <asp:BoundField DataField="Account" HeaderText="Account"></asp:BoundField>
                                                    <asp:BoundField DataField="Freight" HeaderText="Freight"></asp:BoundField>
                                                    <asp:BoundField DataField="VehicleRegNo" HeaderText="Truck"></asp:BoundField>
                                                    <asp:BoundField DataField="Advance" HeaderText="Advance"></asp:BoundField>

                                                </Columns>
                                                <HeaderStyle BackColor="#1f5607" ForeColor="White" />
                                            </asp:GridView>
                                        </div>
                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="lnkClose" runat="server" CssClass="btn btn-info" OnClick="lnkClose_Click"><i class="fas fa-times"></i> | Close</asp:LinkButton>
                                    <asp:LinkButton ID="lnkCreateBilty" runat="server" CssClass="btn btn-warning" OnClick="lnkCreateBilty_Click"><i class="fas fa-box-open"></i> | Confirm</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>



                    <ajaxToolkit:ModalPopupExtender ID="modalConfirmSaveNewCompany" runat="server" PopupControlID="pnlConfirmSaveNewCompany" DropShadow="True" TargetControlID="btnOpenConfirmSaveNewCompany"
                        CancelControlID="lnkCloseConfirmSaveNewCompany" BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>
                    <asp:Panel ID="pnlConfirmSaveNewCompany" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="400px">
                        <asp:Button ID="btnOpenConfirmSaveNewCompany" runat="server" Style="display: none" />
                        <asp:LinkButton ID="lnkCloseConfirmSaveNewCompany" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                        <h4>
                            <asp:Label ID="lblModalTitle" runat="server"></asp:Label></h4>
                        <div class="col-md-12">
                            <asp:HiddenField ID="hfConfirmAction" runat="server" />
                            <asp:LinkButton ID="lnkConfirmSaveNewCompany" runat="server" ForeColor="Green" Font-Size="70px" OnClick="lnkConfirmSaveNewCompany_Click"><i class="fas fa-check pull-left"></i></asp:LinkButton>
                            <asp:LinkButton ID="lnkCancelConfirmSaveNewCompany" runat="server" ForeColor="Red" Font-Size="70px"><i class="fas fa-times-circle pull-right"></i></asp:LinkButton>
                        </div>
                    </asp:Panel> 
            </ContentTemplate>
        </asp:UpdatePanel>
   
       
    </div>
    <!-- END Page Content -->
    <script type="text/javascript">
        let DataListDataArr = [];
        $(document).ready(function () {
            PageMethods.SearchCompanies('', 0, OnSuccess, OnFaild);
            PageMethods.SearchBillTo(OnSuccessBillTo, OnFaildBillTo);
            PageMethods.SearchPackagetypes(OnSuccessGettingPackageTypes, OnFailedGettingPackageTypes);
            PageMethods.SearchProducts(OnSuccessGettingProduct, OnFailedGettingProduct);
            PageMethods.SearchVehicle(OnSuccessGettingVehicle, OnFailedGettingVehicle);
        });
        function OnSuccess(data) {
            for (var i = 0; i < data.length; i++) {

                $('#dlSenderCompany').append(`<option value="${data[i]}"></option>`);
            }
        }
        function OnFaild(data) {
            alert('Cannot fetch data of sender company');
        }
        function OnSuccessBillTo(data) {
            for (var i = 0; i < data.length; i++) {
                $('#dlBillTo').append(`<option value="${data[i]}"></option>`);
            }
        }
        function OnFaildBillTo(data) {
            console.log(data);
            alert('Cannot fetch data of bill to company');
        }
        function OnSuccessGettingPackageTypes(data) {
            for (var i = 0; i < data.length; i++) {
                $('#dlPackageType').append(`<option value="${data[i]}"></option>`);
            }
        }
        function OnFailedGettingPackageTypes() {
            alert('Cannot fetch data of package type');
        }
        function OnSuccessGettingProduct(data) {
            for (var i = 0; i < data.length; i++) {

                $('#dlProducts').append(`<option value="${data[i]}"></option>`);
            }
        }
        function OnFailedGettingProduct() {
            alert('Cannot fetch data of product');
        }
        function OnSuccessGettingVehicle(data) {
            for (var i = 0; i < data.length; i++) {

                $('#dlVehicleRegNo').append(`<option value="${data[i]}"></option>`);
            }
        }
        function OnFailedGettingVehicle() {
            alert('Cannot fetch data of vehicles');
        }
        function Notification(type, msg) {
            if (type == "Error") {
                $("#ContentPlaceHolder1_divNotification").html("<div class=\"alert alert-danger\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
            }
            else if (type == "Success") {
                $("#ContentPlaceHolder1_divNotification").html("<div class=\"alert alert-success\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
            }
            else if (type == "") {
                $("#ContentPlaceHolder1_divNotification").html("");
            }
        }
        $('#ContentPlaceHolder1_txtSearchSender').blur(function () {
            CheckValidation($('#ContentPlaceHolder1_txtSearchSender'));
        });
        $('#ContentPlaceHolder1_txtPartyNameAddress').blur(function () {
            CheckValidation($('#ContentPlaceHolder1_txtPartyNameAddress'));
        });
        $('#ContentPlaceHolder1_txtSearchBillto').blur(function () {
            CheckValidation($('#ContentPlaceHolder1_txtSearchBillto'));
        });
        $('#ContentPlaceHolder1_txtPackageType').blur(function () {
            CheckValidationOfPackageType($('#ContentPlaceHolder1_txtPackageType'));
        });
        $('#ContentPlaceHolder1_txtProduct').blur(function () {
            CheckValidationOfProduct($('#ContentPlaceHolder1_txtProduct'));
            TotalWeightCalculation();
        });
        $('#ContentPlaceHolder1_txtVehicleRegNo').blur(function () {
            CheckValidationOfVehicle($('#ContentPlaceHolder1_txtVehicleRegNo'));
        });
        function CheckValidation(TextBoxValue) {
            var value = TextBoxValue.val();
            if ($.trim(value) != '') {
                var isExist = false;

                $('#dlSenderCompany option').each(function (index, item) {
                    var option = item.value;
                    console.log(option);
                    if (option == value) {
                        isExist = true;
                    }
                });

                if (isExist == false) {
                    //alert("Please select valid company");
                    Notification('Error', 'Please select valid company');
                    TextBoxValue.focus();
                }
                else {
                    Notification('', '');
                }
            }
        }
        function CheckValidationOfPackageType(TextBoxValue) {
            var value = TextBoxValue.val();
            if ($.trim(value) != '') {
                var isExist = false;

                $('#dlPackageType option').each(function (index, item) {
                    var option = item.value;
                    console.log(option);
                    if (option == value) {
                        isExist = true;
                    }
                });

                if (isExist == false) {
                    Notification('Error', 'Please select valid package type');
                    //alert("Please select valid package type");
                    TextBoxValue.focus();
                }
                else {
                    Notification('', '');
                }
            }
        }
        function CheckValidationOfProduct(TextBoxValue) {
            var value = TextBoxValue.val();
            if ($.trim(value) != '') {
                var isExist = false;

                $('#dlProducts option').each(function (index, item) {
                    var option = item.value;
                    console.log(option);
                    if (option == value) {
                        isExist = true;
                    }
                });

                if (isExist == false) {
                    Notification('Error', 'Please select valid product');
                    //alert("Please select valid product");
                    TextBoxValue.focus();
                }
                else {
                    Notification('', '');
                }
            }
        }
        function CheckValidationOfVehicle(TextBoxValue) {
            var value = TextBoxValue.val();
            if ($.trim(value) != '') {
                var isExist = false;

                $('#dlVehicleRegNo option').each(function (index, item) {
                    var option = item.value;
                    console.log(option);
                    if (option == value) {
                        isExist = true;
                    }
                });

                if (isExist == false) {
                    Notification('Error', 'Please select valid vehicle');
                    //alert("Please select valid vehicle");                    
                    TextBoxValue.focus();
                }
                else {
                    Notification('', '');
                }
            }
        }
        $('#ContentPlaceHolder1_txtQty').blur(function () {
            TotalWeightCalculation();
        });
        $('#ContentPlaceHolder1_lnkRecalculate').click(function () {
            TotalWeightCalculation();
        });
        function TotalWeightCalculation() {
            var Qty = $('#ContentPlaceHolder1_txtQty').val();
            var weight = $('#ContentPlaceHolder1_txtProduct').val().split("|");
            if ($.trim(Qty) != '' && $.trim(weight) != '') {
                var TotalWeight = parseFloat(Qty) * parseFloat(weight[1])
                $('#ContentPlaceHolder1_txtProductWeight').val(TotalWeight);
            }
        }
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            $(document).ready(function () {
                PageMethods.SearchCompanies('', 0, OnSuccess, OnFaild);
                PageMethods.SearchBillTo(OnSuccessBillTo, OnFaildBillTo);
                PageMethods.SearchPackagetypes(OnSuccessGettingPackageTypes, OnFailedGettingPackageTypes);
                PageMethods.SearchProducts(OnSuccessGettingProduct, OnFailedGettingProduct);
                PageMethods.SearchVehicle(OnSuccessGettingVehicle, OnFailedGettingVehicle);
            });
            function OnSuccess(data) {
                for (var i = 0; i < data.length; i++) {

                    $('#dlSenderCompany').append(`<option value="${data[i]}"></option>`);
                }
            }
            function OnFaild(data) {
                alert('Cannot fetch data of sender company');
            }
            function OnSuccessBillTo(data) {
                for (var i = 0; i < data.length; i++) {
                    $('#dlBillTo').append(`<option value="${data[i]}"></option>`);
                }
            }
            function OnFaildBillTo(data) {
                alert('Cannot fetch data of bill to company');
            }
            function OnSuccessGettingPackageTypes(data) {
                for (var i = 0; i < data.length; i++) {
                    $('#dlPackageType').append(`<option value="${data[i]}"></option>`);
                }
            }
            function OnFailedGettingPackageTypes() {
                alert('Cannot fetch data of package type');
            }
            function OnSuccessGettingProduct(data) {
                for (var i = 0; i < data.length; i++) {

                    $('#dlProducts').append(`<option value="${data[i]}"></option>`);
                }
            }
            function OnFailedGettingProduct() {
                alert('Cannot fetch data of product');
            }
            function OnSuccessGettingVehicle(data) {
                for (var i = 0; i < data.length; i++) {

                    $('#dlVehicleRegNo').append(`<option value="${data[i]}"></option>`);
                }
            }
            function OnFailedGettingVehicle() {
                alert('Cannot fetch data of vehicles');
            }
            function Notification(type, msg) {
                if (type == "Error") {
                    $("#ContentPlaceHolder1_divNotification").html("<div class=\"alert alert-danger\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
                }
                else if (type == "Success") {
                    $("#ContentPlaceHolder1_divNotification").html("<div class=\"alert alert-success\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
                }
                else if (type == "") {
                    $("#ContentPlaceHolder1_divNotification").html("");
                }
            }
            $('#ContentPlaceHolder1_txtSearchSender').blur(function () {
                CheckValidation($('#ContentPlaceHolder1_txtSearchSender'));
            });
            $('#ContentPlaceHolder1_txtPartyNameAddress').blur(function () {
                CheckValidation($('#ContentPlaceHolder1_txtPartyNameAddress'));
            });
            $('#ContentPlaceHolder1_txtSearchBillto').blur(function () {
                CheckValidation($('#ContentPlaceHolder1_txtSearchBillto'));
            });
            $('#ContentPlaceHolder1_txtPackageType').blur(function () {
                CheckValidationOfPackageType($('#ContentPlaceHolder1_txtPackageType'));
            });
            $('#ContentPlaceHolder1_txtProduct').blur(function () {
                CheckValidationOfProduct($('#ContentPlaceHolder1_txtProduct'));
                TotalWeightCalculation();
            });
            $('#ContentPlaceHolder1_txtVehicleRegNo').blur(function () {
                CheckValidationOfVehicle($('#ContentPlaceHolder1_txtVehicleRegNo'));
            });
            function CheckValidation(TextBoxValue) {
                var value = TextBoxValue.val();
                if ($.trim(value) != '') {
                    var isExist = false;

                    $('#dlSenderCompany option').each(function (index, item) {
                        var option = item.value;
                        console.log(option);
                        if (option == value) {
                            isExist = true;
                        }
                    });

                    if (isExist == false) {
                        //alert("Please select valid company");
                        Notification('Error', 'Please select valid company');
                        TextBoxValue.focus();
                    }
                    else {
                        Notification('', '');
                    }
                }
            }
            function CheckValidationOfPackageType(TextBoxValue) {
                var value = TextBoxValue.val();
                if ($.trim(value) != '') {
                    var isExist = false;

                    $('#dlPackageType option').each(function (index, item) {
                        var option = item.value;
                        console.log(option);
                        if (option == value) {
                            isExist = true;
                        }
                    });

                    if (isExist == false) {
                        Notification('Error', 'Please select valid package type');
                        //alert("Please select valid package type");
                        TextBoxValue.focus();
                    }
                    else {
                        Notification('', '');
                    }
                }
            }
            function CheckValidationOfProduct(TextBoxValue) {
                var value = TextBoxValue.val();
                if ($.trim(value) != '') {
                    var isExist = false;

                    $('#dlProducts option').each(function (index, item) {
                        var option = item.value;
                        console.log(option);
                        if (option == value) {
                            isExist = true;
                        }
                    });

                    if (isExist == false) {
                        Notification('Error', 'Please select valid product');
                        //alert("Please select valid product");
                        TextBoxValue.focus();
                    }
                    else {
                        Notification('', '');
                    }
                }
            }
            function CheckValidationOfVehicle(TextBoxValue) {
                var value = TextBoxValue.val();
                if ($.trim(value) != '') {
                    var isExist = false;

                    $('#dlVehicleRegNo option').each(function (index, item) {
                        var option = item.value;
                        console.log(option);
                        if (option == value) {
                            isExist = true;
                        }
                    });

                    if (isExist == false) {
                        Notification('Error', 'Please select valid vehicle');
                        //alert("Please select valid vehicle");                    
                        TextBoxValue.focus();
                    }
                    else {
                        Notification('', '');
                    }
                }
            }
            $('#ContentPlaceHolder1_txtQty').blur(function () {
                TotalWeightCalculation();
            });
            $('#ContentPlaceHolder1_lnkRecalculate').click(function () {
                TotalWeightCalculation();
            });
            function TotalWeightCalculation() {
                var Qty = $('#ContentPlaceHolder1_txtQty').val();
                var weight = $('#ContentPlaceHolder1_txtProduct').val().split("|");
                if ($.trim(Qty) != '' && $.trim(weight) != '') {
                    var TotalWeight = parseFloat(Qty) * parseFloat(weight[1])
                    $('#ContentPlaceHolder1_txtProductWeight').val(TotalWeight);
                }
            }
        });

    </script>
</asp:Content>
