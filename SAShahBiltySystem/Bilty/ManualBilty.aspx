<%@ Page Title="" Language="C#" MasterPageFile="~/Bilty/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManualBilty.aspx.cs" Inherits="SAShahBiltySystem.Bilty.ManualBilty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

    <script type="text/javascript">
        $(document).ready(function ()
        {
            $(function () {
                $('html').toggleClass('no-js js');
                $('.toggle-box .toggle').click(function (e) {
                    e.preventDefault();
                    $(this).next('.content').slideToggle();
                });
            });
        }  ,     

        function onListPopulated() {
            debugger;
            var completionList = $find("AutoCompleteExtender1").get_completionList();
            completionList.style.width = 'auto';
        }
    </script>
    <title>Manually Bilty</title>
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

               
            </ContentTemplate>
        </asp:UpdatePanel>
        
      
        <!-- END Forms General Header -->
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                 <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
                 <div class="row">
             <%--<asp:Panel ID="Panel2" runat="server"  CssClass="col-md-12">--%>
                <asp:HiddenField ID="hfEditID" runat="server" />
                <!-- Basic Form Elements Block -->
                <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                        <div class="block-options pull-right">
                            
                        </div>
                        <h2><strong>Manual</strong> Bilty</h2>
                    </div>
                    <!-- END Form Elements Title -->

                    <!-- Basic Form Elements Content -->
                    <div class="form-horizontal form-bordered" onsubmit="return false;">
                        <div class="form-group">
                            <div class="col-md-3">
                                <label>Bilty No</label>
                                <asp:TextBox ID="txtBiltyNo" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label>Bilty Date</label>
                                <asp:TextBox ID="txtBiltyDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label>Delivery Date</label>
                               <asp:TextBox ID="txtDeliveryDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                <ContentTemplate>
                                                    <asp:Label ID="lblPaidToPay" runat="server" class="form-label" Text="Paid"></asp:Label>
                                                    <div class="controls">
                                                        <asp:ImageButton ID="imgOnOff" runat="server" ImageUrl="~/assets/images/Off.png" CssClass="m-t-5"  Width="15%" />
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            
                                        </div>
                            </div>
                         
                           
                           
                        </div>
                    </div>
                    <!-- END Basic Form Elements Content -->
                </div>
                <!-- END Basic Form Elements Block -->
           <%-- </asp:Panel>
             <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkSearch" CssClass="col-md-12">--%>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <!-- Basic Form Elements Block -->
                <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                        <div class="block-options pull-right">
                            
                        </div>
                        <h2><strong>Customer</strong> Information</h2>
                    </div>
                      <div id="divCustomerInfoNotification" style="margin-top: 10px;" runat="server"></div>
                    <!-- END Form Elements Title -->

                    <!-- Basic Form Elements Content -->
                    <div class="form-horizontal form-bordered" onsubmit="return false;">
                        <div class="form-group">
                            <div class="col-md-4">
                               
                               <asp:TextBox ID="txtSearchSender" runat="server" class="form-control" placeholder="Search Consigner/Sender" OnTextChanged="txtSearchSender_TextChanged" AutoPostBack="true" ></asp:TextBox>
                                <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCompanies"
                                    MinimumPrefixLength="2"
                                    CompletionListCssClass="list"
                                    CompletionListItemCssClass="listitem"
                                    CompletionListHighlightedItemCssClass="listitem"
                                    CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="txtSearchSender"
                                    ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
                                </ajaxToolkit:AutoCompleteExtender>
                                                    
                            </div>
                            <div class="col-md-2">
                                
                            <asp:TextBox ID="txtSenderCompanyCode" runat="server" placeholder="Code" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                            <asp:TextBox ID="txtSenderGroup" runat="server" class="form-control" placeholder="Group"></asp:TextBox>                               
                            </div>
                            <div class="col-md-2">
                            <asp:TextBox ID="txtSenderCompany" runat="server" class="form-control" placeholder="Company"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtSenderDepartment" runat="server" class="form-control" placeholder="Department"></asp:TextBox>
                            </div>
                             <div class="col-md-4">
                               
                                <asp:TextBox ID="txtSearchReceiver" runat="server" class="form-control" placeholder="Search Consignee/Receiver" AutoPostBack="true" OnTextChanged="txtSearchReceiver_TextChanged" ></asp:TextBox>
                                <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCompanies"
                                    MinimumPrefixLength="2"
                                    CompletionListCssClass="list" 
	                                CompletionListItemCssClass="listitem" 
	                                CompletionListHighlightedItemCssClass="hoverlistitem"
                                    CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="txtSearchReceiver"
                                    ID="AutoCompleteExtender3" runat="server" FirstRowSelected="false">
                                </ajaxToolkit:AutoCompleteExtender>
                                                    
                            </div>
                            <div class="col-md-2">
                                
                            <asp:TextBox ID="txtReceiverCompanyCode" runat="server" class="form-control" placeholder="Code"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                            <asp:TextBox ID="txtReceiverGroup" runat="server" class="form-control" placeholder="Group"></asp:TextBox>                           
                            </div>
                            <div class="col-md-2">
                            <asp:TextBox ID="txtReceiverCompany" runat="server" class="form-control" placeholder="Company"></asp:TextBox>                            
                            </div>
                            <div class="col-md-2">
                            <asp:TextBox ID="txtReceiverDepartment" runat="server" class="form-control" placeholder="Department"></asp:TextBox>
                            </div>
                          <div class="col-md-4">
                                <asp:TextBox ID="txtSearchCustomer" runat="server" class="form-control" placeholder="Bill To/Customer" AutoPostBack="true" OnTextChanged="txtSearchCustomer_TextChanged"></asp:TextBox>
                                    <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCompanies"
                                        MinimumPrefixLength="2"
                                        CompletionListCssClass="list" 
	                                    CompletionListItemCssClass="listitem" 
	                                    CompletionListHighlightedItemCssClass="hoverlistitem"
                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                        TargetControlID="txtSearchCustomer"
                                        ID="AutoCompleteExtender4" runat="server" FirstRowSelected="false">
                                    </ajaxToolkit:AutoCompleteExtender>                     
                            </div>
                            <div class="col-md-2">
                                
                             <asp:TextBox ID="txtCustomerCode" runat="server" class="form-control" placeholder="Code"></asp:TextBox>                            

                            </div>
                            <div class="col-md-2">
                             <asp:TextBox ID="txtCustomerGroup" runat="server" class="form-control" placeholder="Group"></asp:TextBox>                           
                            </div>
                            <div class="col-md-2">
                             <asp:TextBox ID="txtCustomerCompany" runat="server" class="form-control" placeholder="Company"></asp:TextBox>                            
                            </div>
                            <div class="col-md-2">
                             <asp:TextBox ID="txtCustomerDepartment" runat="server" class="form-control" placeholder="Department"></asp:TextBox>                               
                            </div>
                           <div class="col-md-3">
                            <asp:DropDownList ID="ddlBillingType" runat="server" CssClass="form-control">
                                <asp:ListItem>- Select Payment Type -</asp:ListItem>
                                <asp:ListItem Selected="True">Vehicle Wise</asp:ListItem>
                            </asp:DropDownList>
                           </div>
                           
                        </div>
                    </div>
                    <!-- END Basic Form Elements Content -->
                </div>
                <!-- END Basic Form Elements Block -->
           <%-- </asp:Panel>
                      <asp:Panel ID="Panel3" runat="server"  CssClass="col-md-12">--%>
                <asp:HiddenField ID="HiddenField2" runat="server" />
                     <!-- new-->
                     <div class="block">
                            <!-- Grid Blocks Title -->
                            <div class="block-title"><h2><strong>Consignment</strong></h2></div>
                            <!-- END Grid Blocks Title -->

                            <!-- Grid Blocks Content -->
                            <div class="row">
                                <div class="col-sm-12">
                                    <!-- Block 1 -->
                                    <div class="block">
                                        <div class="block-title"><h4>Shipping Information</h4></div>
                                        <div class="row">
                                             <div id="divShippingInfoNotification" runat="server"></div>
                                             <div class="col-xs-12 col-sm-3">
                                                        <div class="form-group">
                                                            <label class="form-label">Shipping Type</label>
                                                            <div class="controls">
                                                                <asp:DropDownList ID="ddlShippingType" runat="server" CssClass="form-control">
                                                                    <asp:ListItem>Containerized (Import)</asp:ListItem>
                                                                    <asp:ListItem>Containerized (Export)</asp:ListItem>
                                                                    <asp:ListItem>Containerized (Partial)</asp:ListItem>
                                                                    <asp:ListItem>Loose Cargo (Full)</asp:ListItem>
                                                                    <asp:ListItem>Loose Cargo (Partial)</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <%--<input type="text" class="form-control" name="formfield1">--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-3">
                                                        <div class="form-group">
                                                            <label class="form-label">Loading Date</label>
                                                            <div class="controls">
                                                                <asp:TextBox ID="txtLoadingDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-3">
                                                        <div class="form-group">
                                                            <label class="form-label">Shipping Line</label>
                                                            <div class="controls">
                                                                <asp:DropDownList ID="ddlShippingLine" runat="server" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                        </div>
                                    </div>
                                    <!-- END Block 1 -->
                                </div>
                                </div>
                         <div class="row">
                             <div class="col-sm-6">
                                    <!-- Block 2 -->
                                    <div class="block">
                                        <div class="block-title"><h4>Vehicle Information</h4></div>
                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <div id="divVehicleInfoNotification" runat="server"></div>
                                                                <div class="col-xs-4">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Vehicle Type</label>
                                                                        <div class="controls">
                                                                            <asp:DropDownList ID="ddlVehicleType" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-4">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Vehicle Quantity</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtVehicleQuantity" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-4">
                                                                    <div class="form-group">
                                                                        <label class="form-label"></label>
                                                                        <div class="controls">
                                                                            <asp:LinkButton ID="lnkAddVehicleType" runat="server" CssClass="btn btn-success m-t-25" OnClick="lnkAddVehicleType_Click" ToolTip="Click to Add Vehicle Type"><i class="fas fa-plus"></i></asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12">
                                                                    <div class="form-group">
                                                                        <div class="controls">
                                                                            <asp:LinkButton ID="lnkAddVehicleInfo" runat="server" CssClass="btn btn-info m-t-25" OnClick="lnkAddVehicleInfo_Click" ToolTip="Add Vehicle Info"><i class="fas fa-info-circle"></i> | Add Vehicle info</asp:LinkButton>
                                                                            <asp:LinkButton ID="lnkViewVehicleInfo" runat="server" CssClass="btn btn-info pull-right m-t-25" OnClick="lnkViewVehicleInfo_Click" ToolTip="View/Edit Vehicle Info"><i class="fas fa-eye"></i> | View Vehicle Info</asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12">
                                                                <asp:GridView ID="gvVehicleType" runat="server" Width="100%" CssClass="table table-hover" AutoGenerateColumns="false" OnRowCommand="gvVehicleType_RowCommand">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="VehicleType" HeaderText="Type" />
                                                                        <asp:BoundField DataField="VehicleQty" HeaderText="Quantity" />
                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Remove">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkDeleteVehicle" runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Wipe"><i class="fas fa-trash"></i></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                            <ajaxToolkit:ModalPopupExtender ID="modalVehicleInfo" runat="server" PopupControlID="pnlVehicleInfo" DropShadow="True" TargetControlID="btnOpenVehicleInfo" 
                                                                CancelControlID="lnkCloseVehicleInfo" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                                                            <asp:Panel ID="pnlVehicleInfo" runat="server" CssClass="row" style="background-color: white; padding: 20px; border: 1px solid black;" Width="1200px">
                                                                <asp:Button ID="btnOpenVehicleInfo" runat="server" style="display: none" />
                                                                <asp:LinkButton ID="lnkCloseVehicleInfo" runat="server" ForeColor="Maroon" CssClass="pull-right" style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                                                <h4>Vehicle Info</h4>                       
                                                                <div class="col-md-12">
                                                                    <div id="divVehicleInfoModalNotification" runat="server"></div>
                                                                    <asp:GridView ID="gvVehicleInfo" runat="server" OnRowDataBound="gvVehicleInfo_RowDataBound" Font-Size="10px" AutoGenerateColumns="false" DataKeyNames="VehicleSize">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText = "Serial" ItemStyle-Width="100">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="VehicleType">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblVehicleType" runat="server" Text='<%# Eval("VehicleType") %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="VehicleRegNo">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtVehicleNo" runat="server"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="VehicleContactNo">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtVehicleContactNo" runat="server"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Broker">
                                                                                <ItemTemplate>
                                                                                    <asp:DropDownList ID="ddlBroker" runat="server"></asp:DropDownList>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Driver">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtDriverName" runat="server"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="FatherName">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtFatherName" runat="server"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="DriverNIC">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtDriverNIC" runat="server"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="DriverLicence">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtDriverLicence" runat="server"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="DriverCellNo">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtDriveCellNo" runat="server"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Vehicle Freight">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtVehicleRate" runat="server"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                    <asp:LinkButton ID="lnkSaveVehicleInfo" runat="server" CssClass="btn btn-info m-t-10" OnClick="lnkSaveVehicleInfo_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkCancelSaveVehicleInfo" runat="server" CssClass="btn btn-danger m-t-10" OnClick="lnkCancelSaveVehicleInfo_Click"><i class="fas fa-ban"></i> | Cancel</asp:LinkButton>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                    </div>
                                    <!-- END Block 2 -->
                                </div>
                              <div class="col-sm-6">
                                 
                                    <!-- Block 2 -->
                                    <div class="block">
                                        <div class="block-title"><h4>Container Information</h4></div>

                                        <div class="row">
                                                            <div id="divConsignmentInfoNotification" runat="server"></div>
                                                            <div class="col-xs-6">
                                                                <div class="form-group">
                                                                    <label class="form-label">Clearing Agent</label>
                                                                    <div class="controls">
                                                                        <asp:DropDownList ID="ddlClearingAgent" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <div class="col-xs-6">
                                                                <div class="form-group">
                                                                    <div class="controls">
                                                                        <asp:LinkButton ID="lnkViewContainerInfo" runat="server" CssClass="btn btn-info m-t-25 m-l-10 pull-right" OnClick="lnkViewContainerInfo_Click" ToolTip="Click to View Container Info"><i class="fas fa-eye"></i> | Edit Info</asp:LinkButton>
                                                                            <asp:LinkButton ID="lnkContainerInfo" runat="server" CssClass="btn btn-info m-t-25 m-l-10 pull-right" OnClick="lnkContainerInfo_Click" ToolTip="Click to Add Container Info"><i class="fas fa-info"></i> | Add Info</asp:LinkButton>
                                                                        
                                                                        
                                                                            
                                                                        
                                                                        
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12">
                                                                <div class="col-xs-4">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Type</label>
                                                                        <div class="controls">
                                                                            <asp:DropDownList ID="ddlContainerType" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Qty</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtContainerQty" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Weight</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtTotalGrossWeight" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2">
                                                                    <div class="form-group">
                                                                        <label class="form-label"></label>
                                                                        <div class="controls">
                                                                            <asp:LinkButton ID="lnkAddContainerType" runat="server" CssClass="btn btn-success pull-right m-t-25" OnClick="lnkAddContainerType_Click" ToolTip="Click to Add Container Type"><i class="fas fa-plus"></i></asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                             <div id="divConsignmentInfoModalNotification" runat="server"></div>
                                                            <div class="col-xs-12">
                                                                <asp:GridView ID="gvConsignmentInfo" runat="server" Width="100%" CssClass="table table-hover" AutoGenerateColumns="false" OnRowCommand="gvConsignmentInfo_RowCommand" DataKeyNames="ContainerTypeID">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="ContainerType" HeaderText="Type" />
                                                                        <asp:BoundField DataField="ContainerQty" HeaderText="Quantity" />
                                                                        <asp:BoundField DataField="TotalWeight" HeaderText="Total Weight" />
                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Remove">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkDeleteContainer" runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Wipe"><i class="fas fa-trash"></i></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                
                                                        </div>
                                    </div>
                                    <!-- END Block 2 -->
                                       <ajaxToolkit:ModalPopupExtender ID="modalContainerInfo" runat="server" PopupControlID="pnlContainerInfo" DropShadow="True" TargetControlID="btnOpenContainerInfo" 
                                                        CancelControlID="lnkCloseContainerInfo" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                                                    <asp:Panel ID="pnlContainerInfo" runat="server" CssClass="row" style="background-color: white; padding: 20px; border: 1px solid black;" Width="1200px">
                                                        <asp:Button ID="btnOpenContainerInfo" runat="server" style="display: none" />
                                                        <asp:LinkButton ID="lnkCloseContainerInfo" runat="server" ForeColor="Maroon" CssClass="pull-right" style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                                        <h4>Container Info</h4>                       
                                                        <div class="col-md-12">
                                                            <div id="div2" runat="server"></div>
                                                            <asp:GridView ID="gvContainerInfo" runat="server" OnRowDataBound="gvContainerInfo_RowDataBound" Font-Size="10px" AutoGenerateColumns="false" DataKeyNames="ContainerTypeID, ContainerSize, ContainerRate, ContainerType">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText = "Serial" ItemStyle-Width="100">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ContainerType">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblContainerType" runat="server" Text='<%# Eval("ContainerType") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ContainerNo">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContainerNo" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Weight">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="EmptyContainerPickupExport">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="ddlPickUpLocation" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPickUpLocation_SelectedIndexChanged"></asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="EmptyContainerDropOff">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="ddlDropoffLocation" runat="server" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDropoffLocation_SelectedIndexChanged"></asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--<asp:TemplateField HeaderText="VesselName">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtVesselName" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField HeaderText="Bilty Freight">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContainerRate" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Vehicle">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="ddlVehicle" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlVehicle_SelectedIndexChanged"></asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:LinkButton ID="lnkSaveContainerInfo" runat="server" CssClass="btn btn-info m-t-10" OnClick="lnkSaveContainerInfo_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkCancelContainerInfo" runat="server" CssClass="btn btn-danger m-t-10" OnClick="lnkCancelContainerInfo_Click"><i class="fas fa-ban"></i> | Cancel</asp:LinkButton>
                                                        </div>
                                                    </asp:Panel>  
                                </div>
                              <div class="col-sm-12">
                                    <!-- Block 2 -->
                                    <div class="block">
                                        <div class="block-title"><h4>Product</h4></div>
                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <div id="divProductNotification" style="margin-top: 10px;" runat="server"></div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Search</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtSearchProduct" runat="server" CssClass="form-control" OnTextChanged="txtSearchProduct_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                            <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCustomers"
                                                                                MinimumPrefixLength="2"
                                                                                CompletionListCssClass="list" 
	                                                                            CompletionListItemCssClass="listitem" 
	                                                                            CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                                TargetControlID="txtSearchProduct"
                                                                                ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                                                                            </ajaxToolkit:AutoCompleteExtender>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Package Type</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtPackageType" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Item</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtItem" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Qty</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtProductQty" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtProductQty_TextChanged" TextMode="Number"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Total Weight</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtTotalProductWeight" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-1">
                                                                    <div class="form-group">
                                                                        <label class="form-label"></label>
                                                                        <div class="controls">
                                                                <asp:LinkButton ID="lnkAddProduct" runat="server" CssClass="btn btn-success m-t-25" OnClick="lnkAddProduct_Click" ToolTip="Click to Add Product"><i class="fas fa-plus"></i></asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12">
                                                                <asp:GridView ID="gvProducts" runat="server" Width="100%" CssClass="table table-hover" AutoGenerateColumns="false" OnRowCommand="gvProducts_RowCommand">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="Item" HeaderText="Item" />
                                                                        <asp:BoundField DataField="PackageType" HeaderText="Packaging" />
                                                                        <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                                                                        <asp:BoundField DataField="TotalWeight" HeaderText="Weight" />
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandName="Wipe" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-trash"></i></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                
                                                        </div>
                                    </div>
                             </div>
                         </div>
                        
                               <%-- <div class="col-sm-2">
                                    <!-- Block 2 -->
                                    <div class="block">
                                        <div class="block-title"><h4>1/6</h4></div>
                                        <p>...</p>
                                    </div>
                                    <!-- END Block 2 -->
                                </div>
                                <div class="col-sm-6">
                                    <!-- Block 3 -->
                                    <div class="block">
                                        <div class="block-title"><h4>1/2</h4></div>
                                        <p>...</p>
                                    </div>
                                    <!-- END Block 3 -->
                                </div>--%>
                            
                            <!-- END Grid Blocks -->
                        </div>
                     <!--new end-->
                <!-- Basic Form Elements Block -->
               <%-- <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                        <div class="block-options pull-right">
                            
                        </div>
                        <h2><strong>Consignment</strong></h2>
                        <div class="actions panel_actions pull-right">
                            <a class="box_toggle fa fa-chevron-up"></a>
                            
                            
                        </div>
                    </div>
                    <!-- END Form Elements Title -->

                    <!-- Basic Form Elements Content -->
                    <div class="form-horizontal form-bordered" onsubmit="return false;">
                        <div class="form-group">
                           <div class="row">
                                <div class="col-lg-12">
                                    <section class="box ">
                                        <header class="panel_header">
                                            <h2 class="title pull-left">Shipping Information</h2>
                                            <%--<div class="actions panel_actions pull-right">
                                                <a class="box_toggle fa fa-chevron-down"></a>
                                                
                                                
                                            </div>
                                        </header>
                                        <div class="content-body">
                                            <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                <div class="row">

                                                   
                                                  
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>

                                <%--<div class="col-lg-12">
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                        <ContentTemplate>
                                            <section class="box ">
                                                <header class="panel_header">
                                                    <h2 class="title pull-left">Location Information</h2>
                                                </header>
                                                <div class="content-body">
                                                    <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                        <div class="row">
                                                            <div class="col-xs-2">
                                                                <div class="form-group">
                                                                    <label class="form-label">Pick Location</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtSearchPickLocation" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtSearchPickLocation_TextChanged"></asp:TextBox>
                                                                        <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchPickDropLocations"
                                                                            MinimumPrefixLength="2"
                                                                            CompletionListCssClass="list" 
	                                                                        CompletionListItemCssClass="listitem" 
	                                                                        CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                            TargetControlID="txtSearchPickLocation"
                                                                            ID="AutoCompleteExtender5" runat="server" FirstRowSelected="false">
                                                                        </ajaxToolkit:AutoCompleteExtender>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-2">
                                                                <div class="form-group">
                                                                    <label class="form-label">City</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtPickCity" runat="server" class="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                
                                                            <div class="col-xs-2">
                                                                <div class="form-group">
                                                                    <label class="form-label">Region</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtPickRegion" runat="server" class="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-2">
                                                                <div class="form-group">
                                                                    <label class="form-label">Area</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtPickArea" runat="server" class="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-4">
                                                                <div class="form-group">
                                                                    <label class="form-label">Address</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtPickAddress" runat="server" class="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-2">
                                                                <div class="form-group">
                                                                    <label class="form-label">Drop Location</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtSearchDropLocation" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtSearchDropLocation_TextChanged"></asp:TextBox>
                                                                        <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchPickDropLocations"
                                                                            MinimumPrefixLength="2"
                                                                            CompletionListCssClass="list" 
	                                                                        CompletionListItemCssClass="listitem" 
	                                                                        CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                            TargetControlID="txtSearchDropLocation"
                                                                            ID="AutoCompleteExtender6" runat="server" FirstRowSelected="false">
                                                                        </ajaxToolkit:AutoCompleteExtender>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-2">
                                                                <div class="form-group">
                                                                    <label class="form-label">City</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtDropCity" runat="server" class="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                
                                                            <div class="col-xs-2">
                                                                <div class="form-group">
                                                                    <label class="form-label">Region</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtDropRegion" runat="server" class="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-2">
                                                                <div class="form-group">
                                                                    <label class="form-label">Area</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtDropArea" runat="server" class="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-4">
                                                                <div class="form-group">
                                                                    <label class="form-label">Address</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox ID="txtDropAddress" runat="server" class="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="col-lg-6 pull-left">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <section class="box ">
                                                <header class="panel_header">
                                                    <h2 class="title pull-left">Vehicle Information</h2>
                                                    <%--<div class="actions panel_actions pull-right">
                                                        <a class="box_toggle fa fa-chevron-down"></a>
                                                        
                                                        
                                                    </div>
                                                </header>
                                                <div class="content-body">
                                                    <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                        
                                                    </div>
                                                </div>
                                            </section>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>                
                                </div>

                                <div class="col-lg-6  pull-left">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <section class="box ">
                                                <header class="panel_header">
                                                    <h2 class="title pull-left">Container Information</h2>
                                                    <%--<div class="actions panel_actions pull-right">
                                                        <a class="box_toggle fa fa-chevron-down"></a>
                                                        
                                                        
                                                    </div>--
                                                </header>
                                                <div class="content-body">
                                                    <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                        
                                                    </div>

                                                    <ajaxToolkit:ModalPopupExtender ID="modalContainerInfo" runat="server" PopupControlID="pnlContainerInfo" DropShadow="True" TargetControlID="btnOpenContainerInfo" 
                                                        CancelControlID="lnkCloseContainerInfo" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                                                    <asp:Panel ID="pnlContainerInfo" runat="server" CssClass="row" style="background-color: white; padding: 20px; border: 1px solid black;" Width="1200px">
                                                        <asp:Button ID="btnOpenContainerInfo" runat="server" style="display: none" />
                                                        <asp:LinkButton ID="lnkCloseContainerInfo" runat="server" ForeColor="Maroon" CssClass="pull-right" style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                                        <h4>Container Info</h4>                       
                                                        <div class="col-md-12">
                                                            <div id="divConsignmentInfoModalNotification" runat="server"></div>
                                                            <asp:GridView ID="gvContainerInfo" runat="server" OnRowDataBound="gvContainerInfo_RowDataBound" Font-Size="10px" AutoGenerateColumns="false" DataKeyNames="ContainerTypeID, ContainerSize, ContainerRate, ContainerType">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText = "Serial" ItemStyle-Width="100">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ContainerType">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblContainerType" runat="server" Text='<%# Eval("ContainerType") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ContainerNo">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContainerNo" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Weight">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="EmptyContainerPickupExport">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="ddlPickUpLocation" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPickUpLocation_SelectedIndexChanged"></asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="EmptyContainerDropOff">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="ddlDropoffLocation" runat="server" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDropoffLocation_SelectedIndexChanged"></asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--<asp:TemplateField HeaderText="VesselName">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtVesselName" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--
                                                                    <asp:TemplateField HeaderText="Bilty Freight">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtContainerRate" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Vehicle">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="ddlVehicle" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlVehicle_SelectedIndexChanged"></asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:LinkButton ID="lnkSaveContainerInfo" runat="server" CssClass="btn btn-info m-t-10" OnClick="lnkSaveContainerInfo_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkCancelContainerInfo" runat="server" CssClass="btn btn-danger m-t-10" OnClick="lnkCancelContainerInfo_Click"><i class="fas fa-ban"></i> | Cancel</asp:LinkButton>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </section>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="col-lg-12">
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>                    
                                            <section class="box ">
                                                <header class="panel_header">
                                                    <h2 class="title pull-left">Product</h2>
                                                    <div class="actions panel_actions pull-right">
                                                        <%--<a class="box_toggle fa fa-chevron-down"></a>--
                                    
                                    
                                                    </div>
                                                </header>
                                                <div class="content-body">
                                                    <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                        
                                                    </div>
                                                </div>
                                            </section>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                           
                           
                        </div>
                    </div>
                    <!-- END Basic Form Elements Content -->
                </div>--%>
                <!-- END Basic Form Elements Block -->
           <%-- </asp:Panel>--%>

                   <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                        <div class="block-options pull-right">
                            
                        </div>
                        <h2><strong>FREIGHT </strong> INFORMATION</h2>
                        
                    </div>
                       <a id="toggleIconFreightInfo" runat="server"></a>
                    <!-- END Form Elements Title -->

                    <!-- Basic Form Elements Content -->
                    <div class="form-horizontal form-bordered" onsubmit="return false;">
                        <div class="content-body"  id="divFreightInfo" runat="server">
                        <div class="form-group">
                             <section class="box ">
                                                
                                                <div class="content-body">
                                                    <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                       <div class="row">
                                                            <div class="col-xs-12">
                                                                <div id="divBiltyFreightNotification" runat="server"></div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Bilty Freight</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtBiltyFreight" runat="server" CssClass="form-control" TextMode="Number" OnTextChanged="txtBiltyFreight_TextChanged" AutoPostBack="true" Enabled="true"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Vehicle Freight</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtFreight" runat="server" CssClass="form-control" TextMode="Number" OnTextChanged="txtFreight_TextChanged" AutoPostBack="true" Enabled="true"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Company Commision</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtPartyCommission" runat="server" CssClass="form-control" Enabled="true"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                            
                           
                        </div>
                    </div>
                    <!-- END Basic Form Elements Content -->
                      
                </div>
                    
        </div>
          <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                        <div class="block-options pull-right">
                            
                        </div>
                        
                    </div>
                    <!-- END Form Elements Title -->

                    <!-- Basic Form Elements Content -->
                    <div class="form-horizontal form-bordered" onsubmit="return false;">
                        <div class="form-group">
                            <div class="col-md-3">
                              <asp:LinkButton ID="lnkSave" runat="server" CssClass="btn btn-success m-t-25" ToolTip="Click to Save" OnClick="lnkSave_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                            </div>
                           
                        </div>
                    </div>
                    <!-- END Basic Form Elements Content -->
                </div>    
<%--Start Hide--%>
                     <div id="divAdvanceInfoNotification" runat="server"></div>
                     <div class="content-body" style="display:none;">
                        <div id="general_validate" action="javascript:;" novalidate="novalidate">
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                        <ContentTemplate>
                                            <section class="box ">
                                                <header class="panel_header">
                                                    <h2 class="title pull-left">Basic Info</h2>
                                                    <%--<div class="actions panel_actions pull-right">
                                                        <a class="box_toggle fa fa-chevron-down"></a>
                                                        
                                                        
                                                    </div>--%>
                                                </header>
                                                <div class="content-body">
                                                    <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <div id="divReceivingInfoNotification" runat="server"></div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">ReceivedBy</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtReceivedBy" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Receiving Date</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtReceivingDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Receiving Time</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtReceivingTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <div class="controls">
                                                                            <asp:LinkButton ID="lnkAddVehicleTiming" runat="server" CssClass="btn btn-info m-t-25 pull-right" OnClick="lnkAddVehicleTiming_Click" ToolTip="Add Vehicle Timings"><i class="fas fa-clock-o"></i></asp:LinkButton>
                                                                            <asp:LinkButton ID="lnkAddReceiving" runat="server" CssClass="btn btn-success m-t-25 pull-right m-r-10" OnClick="lnkAddReceiving_Click" ToolTip="Add Receiving"><i class="fas fa-plus"></i></asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12">
                                                                <asp:GridView ID="gvReceiving" runat="server" Width="100%" CssClass="table table-hover" AutoGenerateColumns="false">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="ReceivedBy" HeaderText="Received By" />
                                                                        <asp:BoundField DataField="ReceivedDateTime" HeaderText="Received On" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                
                                                            <ajaxToolkit:ModalPopupExtender ID="modalVehicleTiming" runat="server" PopupControlID="pnlVehicleTiming" DropShadow="True" TargetControlID="btnOpenVehicleTiming" 
                                                                CancelControlID="lnkCloseVehicleTiming" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                                                            <asp:Panel ID="pnlVehicleTiming" runat="server" CssClass="row" style="background-color: white; padding: 20px; border: 1px solid black;" Width="1100px">
                                                                <asp:Button ID="btnOpenVehicleTiming" runat="server" style="display: none" />
                                                                <asp:LinkButton ID="lnkCloseVehicleTiming" runat="server" ForeColor="Maroon" CssClass="pull-right" style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                                                <h4>Vehicle Timings</h4>                       
                                                                <div class="col-md-12">
                                                                    <asp:GridView ID="gvVehicleTimings" runat="server" OnRowDataBound="gvVehicleTimings_RowDataBound" Font-Size="10px" HeaderStyle-HorizontalAlign="Center">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="VehicleType" HeaderText="Type" ItemStyle-HorizontalAlign="Center" />
                                                                            <asp:BoundField DataField="VehicleRegNo" HeaderText="Reg. No." ItemStyle-HorizontalAlign="Center" />
                                                                            <asp:TemplateField HeaderText="Vechile Reporting" ItemStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtVRDate" runat="server" TextMode="Date"></asp:TextBox> <asp:TextBox ID="txtVRTime" runat="server" TextMode="Time"></asp:TextBox> 
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Vechile In" ItemStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtVIDate" runat="server" TextMode="Date"></asp:TextBox> <asp:TextBox ID="txtVITime" runat="server" TextMode="Time"></asp:TextBox> 
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Vechile Out" ItemStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtVODate" runat="server" TextMode="Date"></asp:TextBox> <asp:TextBox ID="txtVOTime" runat="server" TextMode="Time"></asp:TextBox> 
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                    <asp:LinkButton ID="lnkSaveVehicleTiming" runat="server" CssClass="btn btn-info m-t-10" OnClick="lnkSaveVehicleTiming_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkCancelSaveVehicleTiming" runat="server" CssClass="btn btn-danger m-t-10" OnClick="lnkCancelSaveVehicleTiming_Click"><i class="fas fa-ban"></i> | Cancel</asp:LinkButton>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="col-lg-12">
                                    <section class="box ">
                                        <header class="panel_header">
                                            <h2 class="title pull-left">Receiving Document Detail</h2>
                                            <%--<div class="actions panel_actions pull-right">
                                                <a class="box_toggle fa fa-chevron-down"></a>
                                                
                                                
                                            </div>--%>
                                        </header>
                                        <div class="content-body">
                                            <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div id="divReceivingDocInfoNotification" runat="server"></div>
                                                        <div class="col-xs-3">
                                                            <div class="form-group">
                                                                <label class="form-label">Document Type</label>
                                                                <div class="controls">
                                                                    <asp:DropDownList ID="ddlReceivingDocumentType" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <div class="form-group">
                                                                <label class="form-label">Document No.</label>
                                                                <div class="controls">
                                                                    <asp:TextBox ID="txtReceivingDocumentNo" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>                                    
                                                        <div class="col-xs-3">
                                                            <div class="form-group">
                                                                <label class="form-label">Upload Document</label>
                                                                <div class="controls">
                                                                    <asp:FileUpload ID="fuReceivingDoc" runat="server" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <div class="form-group">
                                                                <%--<label class="form-label">Total Gross Weight</label>--%>
                                                                <div class="controls">
                                                                    <asp:LinkButton ID="lnkAddReceivingDocument" runat="server" CssClass="btn btn-success m-t-25 pull-right" OnClick="lnkAddReceivingDocument_Click" ToolTip="Click to Add Document"><i class="fas fa-plus"></i></asp:LinkButton>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12">
                                                        <asp:GridView ID="gvReceivingDocument" runat="server" Width="100%" CssClass="table table-hover" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:BoundField DataField="DocumentType" HeaderText="Type" />
                                                                <asp:BoundField DataField="DocumentNo" HeaderText="No." />
                                                                <asp:BoundField DataField="DocumentName" HeaderText="Name" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>

                                <div class="col-lg-12">
                                    <section class="box ">
                                        <header class="panel_header">
                                            <h2 class="title pull-left">Damage Detail</h2>
                                            <%--<div class="actions panel_actions pull-right">
                                                <a class="box_toggle fa fa-chevron-down"></a>
                                                
                                                
                                            </div>--%>
                                        </header>
                                        <div class="content-body">
                                            <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div id="divDamageInfoNotification" runat="server"></div>
                                                        <div class="col-xs-2">
                                                            <div class="form-group">
                                                                <label class="form-label">Item</label>
                                                                <div class="controls">
                                                                    <asp:DropDownList ID="ddlDamageItem" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-2">
                                                            <div class="form-group">
                                                                <label class="form-label">Damage Type</label>
                                                                <div class="controls">
                                                                    <asp:DropDownList ID="ddlDamageType" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>                                    
                                                        <div class="col-xs-2">
                                                            <div class="form-group">
                                                                <label class="form-label">Damage Cost</label>
                                                                <div class="controls">
                                                                    <asp:TextBox ID="txtDamageCost" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-2">
                                                            <div class="form-group">
                                                                <label class="form-label">Damage Cause</label>
                                                                <div class="controls">
                                                                    <asp:TextBox ID="txtDamageCause" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>                               
                                                        <div class="col-xs-2">
                                                            <div class="form-group">
                                                                <label class="form-label">Upload Document</label>
                                                                <div class="controls">
                                                                    <asp:FileUpload ID="fuDamageDoc" runat="server" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-2">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <asp:LinkButton ID="lnkDamageCostSharing" runat="server" CssClass="btn btn-success btn-xs col-xs-6" OnClick="lnkDamageCostSharing_Click" ToolTip="Click to add Damage cost sharing"><i class="fas fa-money"></i></asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkAddDamage" runat="server" CssClass="btn btn-info btn-xs col-xs-6" OnClick="lnkAddDamage_Click" ToolTip="Click to add Damage"><i class="fas fa-plus"></i></asp:LinkButton>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12">
                                                        <asp:GridView ID="gvDamage" runat="server" Width="100%" CssClass="table table-hover" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:BoundField DataField="Item" HeaderText="Item" />
                                                                <asp:BoundField DataField="DamageType" HeaderText="Damage Type" />
                                                                <asp:BoundField DataField="Cost" HeaderText="Cost" />
                                                                <asp:BoundField DataField="Cause" HeaderText="Cause" />
                                                                <asp:BoundField DataField="Document" HeaderText="Document" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                      <div class="col-lg-12" style="display: none;">
                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                        <ContentTemplate>
                                            <section class="box ">
                                                <header class="panel_header">
                                                    <h2 class="title pull-left">Advance Information</h2>
                                                    <%--<div class="actions panel_actions pull-right">
                                                        <a class="box_toggle fa fa-chevron-down"></a>
                                                        
                                                        
                                                    </div>--%>
                                                </header>
                                                <div class="content-body">
                                                    <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <div id="div1" runat="server"></div>
                                                                <div class="col-xs-2">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Advance Freight</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtAdvanceFreight" runat="server" CssClass="form-control" TextMode="Number" OnTextChanged="txtAdvanceFreight_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Factory Advance</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtFactoryAdvance" runat="server" CssClass="form-control" TextMode="Number" OnTextChanged="txtAdvanceFreight_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Diesel</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtDieselAdvance" runat="server" CssClass="form-control" TextMode="Number" OnTextChanged="txtAdvanceFreight_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2" id="divAdvanceVehicle" runat="server">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Adv. Amount</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtVehicleAdvanceAmount" runat="server" CssClass="form-control" TextMode="Number" OnTextChanged="txtAdvanceFreight_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2" style="display: none;">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Adv. Vehicle?</label>
                                                                        <div class="controls">
                                                                            <asp:CheckBox ID="cbAdvVehicle" runat="server" OnCheckedChanged="cbAdvVehicle_CheckedChanged" AutoPostBack="true" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                            
                                                                <div class="col-xs-2 pull-right">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Total Advance</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtTotalAdvance" runat="server" Text="0" CssClass="form-control" Enabled="false" AutoPostBack="true" OnTextChanged="txtTotalAdvance_TextChanged"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-10">
                                                                    <div class="col-xs-2 pull-right">
                                                                        <div class="form-group">
                                                                            <label class="form-label">Additional Weight</label>
                                                                            <div class="controls">
                                                                                <asp:TextBox ID="txtAdditionalWeight" runat="server" CssClass="form-control"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-2 pull-right">
                                                                        <div class="form-group">
                                                                            <label class="form-label">Actual Weight</label>
                                                                            <div class="controls">
                                                                                <asp:TextBox ID="txtActualWeight" runat="server" CssClass="form-control"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-2 pull-right">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Balance Freight</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtBalanceFreight" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                     <div class="col-lg-12" style="display: none;">
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                        <ContentTemplate>
                                            <section class="box ">
                                                <header class="panel_header">
                                                    <h2 class="title pull-left">Vehicle Advance</h2>
                                                    <%--<div class="actions panel_actions pull-right">
                                                        <a class="box_toggle fa fa-chevron-down"></a>
                                                        
                                                        
                                                    </div>--%>
                                                </header>
                                                <div class="content-body">
                                                    <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Bilty</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtVehicleBiltyAdvance" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Freight</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtVehilceFreightAdvance" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Advance</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtVehicleAdvance" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Balance Commission</label>
                                                                        <div class="controls">
                                                                            <asp:TextBox ID="txtBalanceCommission" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                     <%--End Hide--%>
        
            </ContentTemplate>
        </asp:UpdatePanel>
   
       
    </div>
    <!-- END Page Content -->
</asp:Content>
