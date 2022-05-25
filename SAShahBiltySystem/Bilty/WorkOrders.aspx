<%@ Page Title="" Language="C#" MasterPageFile="~/Bilty/MasterPage.Master" AutoEventWireup="true" CodeBehind="WorkOrders.aspx.cs" Inherits="SAShahBiltySystem.Bilty.WorkOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Work Orders</title>
    <style>
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style>
    <style>
        .pagination-ys {
            /*display: inline-block;*/
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }

            .pagination-ys table > tbody > tr > td {
                display: inline;
            }

                .pagination-ys table > tbody > tr > td > a,
                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    color: #dd4814;
                    background-color: #ffffff;
                    border: 1px solid #dddddd;
                    margin-left: -1px;
                }

                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    margin-left: -1px;
                    z-index: 2;
                    color: #aea79f;
                    background-color: #f5f5f5;
                    border-color: #dddddd;
                    cursor: default;
                }

                .pagination-ys table > tbody > tr > td:first-child > a,
                .pagination-ys table > tbody > tr > td:first-child > span {
                    margin-left: 0;
                    border-bottom-left-radius: 4px;
                    border-top-left-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td:last-child > a,
                .pagination-ys table > tbody > tr > td:last-child > span {
                    border-bottom-right-radius: 4px;
                    border-top-right-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td > a:hover,
                .pagination-ys table > tbody > tr > td > span:hover,
                .pagination-ys table > tbody > tr > td > a:focus,
                .pagination-ys table > tbody > tr > td > span:focus {
                    color: #97310e;
                    background-color: #eeeeee;
                    border-color: #dddddd;
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
                    <asp:LinkButton ID="lnkSearch" runat="server" OnClick="lnkSearch_Click" ToolTip="Click to Search"><i class="fas fa-search"></i></asp:LinkButton>

                    <asp:LinkButton ID="lnkAddNew" runat="server" OnClick="lnkAddNew_Click" ToolTip="Click to Create"><i class="fas fa-plus"></i></asp:LinkButton>

                    
                     <asp:LinkButton ID="lnkClear" runat="server" Visible="false" CssClass="btn btn-xs btn-primary" OnClick="lnkClear_Click"><i class="fas fa-close"></i></asp:LinkButton>
                    Work Order<br><small></small>
                </h1>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <ul class="breadcrumb breadcrumb-top">
            <li>Admin</li>
            <li><a href="javascript:;">Work Order</a></li>
        </ul>
        <!-- END Forms General Header -->
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                 <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
                 <div class="row">
            <%--<asp:Panel ID="pnlView" runat="server" CssClass="col-md-12" Visible="false">
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <!-- Basic Form Elements Block -->
                <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                        <div class="block-options pull-right">
                            <asp:LinkButton ID="lnkCloseView" runat="server" CssClass="btn btn-xs btn-danger pull-right" Style="margin-top: 10px; margin-right: 10px;" OnClick="lnkCloseView_Click"><i class="fas fa-times"></i></asp:LinkButton>
                        </div>
                        <h2><strong>Input</strong> Fields</h2>
                    </div>
                    <!-- END Form Elements Title -->

                    <!-- Basic Form Elements Content -->
                    <div class="form-horizontal form-bordered" onsubmit="return false;">
                        <div class="form-group">
                            
                            <div class="col-md-3">
                                <label>Code:</label>
                                <asp:Label ID="lblCode" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <label>Document:</label>
                                <asp:Label ID="lblName" runat="server"></asp:Label>
                            </div>
                           
                            <div class="col-md-3">
                                <label>Discription:</label>
                                <asp:Label ID="lblDescription" runat="server"></asp:Label>
                            </div>
                            
                        </div>
                    </div>
                    <!-- END Basic Form Elements Content -->
                </div>
                <!-- END Basic Form Elements Block -->
            </asp:Panel>
            <asp:Panel ID="pnlInput" runat="server" CssClass="col-md-12" DefaultButton="lnkSubmit" Visible="false">
                <asp:HiddenField ID="hfEditID" runat="server" />
                <!-- Basic Form Elements Block -->
                <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                        <div class="block-options pull-right">
                            <asp:LinkButton ID="lnkCloseInput" runat="server" CssClass="btn btn-xs btn-danger pull-right" Style="margin-top: 10px; margin-right: 10px;" OnClick="lnkCloseInput_Click"><i class="fas fa-times"></i></asp:LinkButton>
                        </div>
                        <h2><strong>Input</strong> Fields</h2>
                    </div>
                    <!-- END Form Elements Title -->

                    <!-- Basic Form Elements Content -->
                    <div class="form-horizontal form-bordered" onsubmit="return false;">
                        <div class="form-group">
                            <div class="col-md-3">
                                <label>Code</label>
                                <asp:TextBox ID="txtCode" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                           <div class="col-md-3">
                                <label>Document</label>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                          
                                <div class="col-md-6">
                                <label>Description</label>
                                <asp:TextBox ID="txtDescription" Rows="2" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                               
                            
                          
                            
                            <div class="col-md-12" style="margin-top: 30px;">
                                <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn-primary pull-right m-l-10" OnClick="lnkSubmit_Click"><i class="fa fa-save"></i> | Save</asp:LinkButton>
                              
                            </div>
                        
                    </div>
                    <!-- END Basic Form Elements Content -->
                </div>
                <!-- END Basic Form Elements Block -->
            </asp:Panel>--%>
                     <ajaxToolkit:ModalPopupExtender ID="modalSearch" runat="server" PopupControlID="pnlSearch" TargetControlID="btnOpenSearch"
                                CancelControlID="btnCloseSearch" BackgroundCssClass="modalBackground">
                            </ajaxToolkit:ModalPopupExtender>

                            <asp:Panel CssClass="col-xs-12" ID="pnlSearch" runat="server" TabIndex="-1" role="dialog" aria-hidden="true">
                                <asp:Button ID="btnOpenSearch" runat="server" Style="display: none" />
                                <asp:Button ID="btnCloseSearch" runat="server" Style="display: none" />
                                <%--<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Maroon" style="display: none;"></asp:LinkButton>--%>
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <asp:LinkButton ID="lnkCloseIcon" runat="server" CssClass="pull-right" OnClick="lnkClose_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                            <h4 class="modal-title">Search</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <asp:Label Text="Work Order #" runat="server" />
                                                        <asp:TextBox runat="server" ID="txtOrderNo" CssClass="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <asp:Label Text="Party" runat="server" />
                                                        <asp:DropDownList runat="server" ID="ddlPartyName" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <asp:Label Text="Delivery Date" runat="server" />
                                                        <asp:TextBox TextMode="Date" runat="server" ID="txtDeliveryDate" CssClass="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <asp:Label Text="Creation Date From" runat="server" />
                                                        <asp:TextBox TextMode="Date" runat="server" ID="txtCreateDateFrom" CssClass="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <asp:Label Text="Creation Date To" runat="server" />
                                                        <asp:TextBox TextMode="Date" runat="server" ID="txtCreateDateTo" CssClass="form-control" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:LinkButton ID="lnkClose" runat="server" CssClass="btn btn-info" OnClick="lnkClose_Click"><i class="fas fa-times"></i> | Close</asp:LinkButton>
                                            <asp:LinkButton ID="lnkSearchDetails" runat="server" CssClass="btn btn-danger" OnClick="lnkSearchDetails_Click"><i class="fas fa-trash"></i> | Search</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
        </div>

        <div class="row">
            <div class="col-md-12">
                    
                    <!-- Table Styles Block -->
                    <div class="block">
                        <!-- Table Styles Title -->
                        <div class="block-title">
                            <h2><strong>Result</strong></h2>
                            
                        </div>
                        <!-- END Table Styles Title -->
                        <div class="table-options clearfix">
                             
                              
                              
                            </div>
                        <!-- Table Styles Content -->
                        <!-- Changing classes functionality initialized in js/pages/tablesGeneral.js -->
                        <div class="table-responsive">
                            <!--
                            Available Table Classes:
                                'table'             - basic table
                                'table-bordered'    - table with full borders
                                'table-borderless'  - table with no borders
                                'table-striped'     - striped table
                                'table-condensed'   - table with smaller top and bottom cell padding
                                'table-hover'       - rows highlighted on mouse hover
                                'table-vcenter'     - middle align content vertically
                            -->
                            
                         
                              <asp:HiddenField ID="hfSelectedWO" runat="server" />
                                        <asp:GridView ID="gvResult" runat="server" EmptyDataText="No Work Order Found" AutoGenerateColumns="false" CssClass="table table-striped table-vcenter" Font-Size="12px"
                                            DataKeyNames="WorkOrderID" OnRowCommand="gvResult_RowCommand" OnRowDataBound="gvResult_RowDataBound" AllowPaging="true" AllowSorting="true" OnSorting="gvResult_Sorting"
                                            OnPageIndexChanging="gvResult_PageIndexChanging" PageSize="50" PagerSettings-Position="TopAndBottom" PagerStyle-HorizontalAlign="Center" PagerSettings-FirstPageText="<<" PagerSettings-LastPageText=">>">
                                            <Columns>
                                                <asp:BoundField DataField="WorkOrderNo" SortExpression="WorkOrderNo" HeaderText="Work Order#" />
                                                <asp:BoundField DataField="CompanyName" SortExpression="CompanyName" HeaderText="Party" />
                                                <asp:BoundField DataField="DeliveryDate" HeaderText="Delivery On" SortExpression="DeliveryDate"/>
                                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                                <asp:BoundField DataField="CreatedDate" HeaderText="Creation Date" SortExpression="CreatedDate" />
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="View"><i class="fas fa-eye"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="change"><i class="fas fa-edit"></i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="pagination-ys" />
                                        </asp:GridView>
                                
                        </div>
                        <!-- END Table Styles Content -->
                    </div>
               
                    <!-- END Table Styles Block -->
            </div>
        </div>  
            </ContentTemplate>
        </asp:UpdatePanel>
   
       
    </div>
    <!-- END Page Content -->
</asp:Content>
