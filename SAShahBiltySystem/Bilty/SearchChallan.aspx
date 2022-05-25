<%@ Page Title="" Language="C#" MasterPageFile="~/Bilty/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchChallan.aspx.cs" Inherits="SAShahBiltySystem.Bilty.SearchChallan" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <title>Challan</title>    
    <style>        
            
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
        .fa-filter-slash:before { content: "\fef7"; }
    </style>
    <script type="text/javascript">
        var styles = "";
        function readTextFile(file) {
            var rawFile = new XMLHttpRequest();
            rawFile.open("GET", file, false);
            rawFile.onreadystatechange = function () {
                if (rawFile.readyState === 4) {
                    if (rawFile.status === 200 || rawFile.status == 0) {
                        var allText = rawFile.responseText;
                        alert(allText);
                        styles = allText;
                    }
                }
            }
            rawFile.send(null);
        }

        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            alert(1);
        }
        //lblClearingAgent
        function PrintOLD() {
            debugger;
            //readTextFile("assets/css/style.css");
            
            var InvoiceHTML = "";
            InvoiceHTML += "<div style=\"width: 100%; \">";
                InvoiceHTML += "<div style=\"width: 100%\">";
                    InvoiceHTML += "<div style=\"width: 45%; float: left;\">";
                        InvoiceHTML += "<img alt=\"\" src=\"assets/images/MZBLogo.png\" style=\"width: 45%;\" class=\"img-reponsive\">";
                    InvoiceHTML += "</div>";
                    InvoiceHTML += "<div style=\"width: 45%; float: right;\">";
                        InvoiceHTML += "<img alt=\"\" src=\"assets/images/MZBLogo2.png\" style=\"padding-top: 5%; float: right; width: 85%;\" class=\"img-reponsive\">";
                    InvoiceHTML += "</div>";
                InvoiceHTML += "</div>";
                InvoiceHTML += "<br><br><br>";
                InvoiceHTML += "<div style=\"width: 100%;\">";
                    InvoiceHTML += "<br><br><br>";
                    InvoiceHTML += "<table style=\"width: 100%;\">";
                        InvoiceHTML += "<tr>";
                            InvoiceHTML += "<td style=\"padding: 10px;\"><span>Invoice#</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblOrderNo').innerText +"</strong></div></td>";
                            InvoiceHTML += "<td style=\"padding: 10px;\"><span>Bill To</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblBilltoCustomer').innerText + "</strong></td>";
                        InvoiceHTML += "<tr>";
                        InvoiceHTML += "</tr>";
                            InvoiceHTML += "<td style=\"padding: 10px;\">Sender</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblSenderCompanyName').innerText +"</strong></td>";
                            InvoiceHTML += "<td style=\"padding: 10px;\">Receiver</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblReceiverCompanyName').innerText +"</strong></td>";
                        InvoiceHTML += "</tr>";
                    InvoiceHTML += "</table>";
                InvoiceHTML += "</div>";
                InvoiceHTML += "<br><br><br>";
                InvoiceHTML += "<div style=\"width: 100%;\">";
                    InvoiceHTML += "<table style=\"width: 100%;\" border=\"1\">";
                        InvoiceHTML += "<thead>";
                            InvoiceHTML += "<tr style=\"background-color: #CCC; color: Black; font-size: 20px;\">";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Nos.</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Description</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Rate</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Amount</th>";
                            InvoiceHTML += "</tr>";
                        InvoiceHTML += "</thead>";
                        InvoiceHTML += "<tbody>";
                            InvoiceHTML += "<tr>";
                                InvoiceHTML += "<td style=\"text-align: center; padding: 10px;\">" + document.getElementById('ContentPlaceHolder1_lblTotalInvoiceContainers').innerText + "</td>";
                                InvoiceHTML += "<td style=\"text-align: left; padding: 10px;\">" + document.getElementById('ContentPlaceHolder1_lblInvoiceDescription').innerText + "</td>";
                                InvoiceHTML += "<td style=\"text-align: center; padding: 10px;\">" + numberWithCommas(document.getElementById('ContentPlaceHolder1_lblInvoiceContainerRate').innerText) + "/-</td>";
                                InvoiceHTML += "<td style=\"text-align: center; padding: 10px;\">" + document.getElementById('ContentPlaceHolder1_lblInvoicecontainerTotal').innerText + "/-</td>";
                            InvoiceHTML += "</tr>";
                            var tableExpenses = document.getElementById("ContentPlaceHolder1_tblContainerExpense");
                            var rowLength = tableExpenses.rows.length;
                            for (i = 0; i < rowLength; i++) {
                                
                                var expenseCells = tableExpenses.rows.item(i).cells;
                                var cellLength = expenseCells.length;
                                var ExpenseAmount = expenseCells.item(3).innerHTML;
                                InvoiceHTML += "<tr>";
                                    InvoiceHTML += "<td style=\"text-align: center;\">" + expenseCells.item(0).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: left;\">" + expenseCells.item(1).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center;\">" + expenseCells.item(2).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center;\">" + expenseCells.item(3).innerHTML + "</td>";
                                InvoiceHTML += "</tr>";
                                Total = (+Total + +ExpenseAmount);                                
                            }
                            var tableWeighment = document.getElementById("ContentPlaceHolder1_tblCotainerWeighment");
                            var WeighmentLength = tableWeighment.rows.length;
                            for (i = 0; i < WeighmentLength; i++) {
                                
                                var weighmentCells = tableWeighment.rows.item(i).cells;
                                var cellLength = weighmentCells.length;
                                var WeighmentAmount = weighmentCells.item(3).innerHTML;
                                InvoiceHTML += "<tr>";
                                    InvoiceHTML += "<td>" + weighmentCells.item(0).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: left;\">" + weighmentCells.item(1).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center;\">" + weighmentCells.item(2).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center;\">" + weighmentCells.item(3).innerHTML + "</td>";
                                InvoiceHTML += "</tr>";
                                Total = (+Total + +WeighmentAmount);                                
                            }
                            InvoiceHTML += "<tr>";
                                InvoiceHTML += "<td></td>";
                                InvoiceHTML += "<td colspan=\"3\" style=\"padding: 10px;\">";
                                    InvoiceHTML += "<div style=\"width: 100%;\">";
                                        InvoiceHTML += "<h3>Containers Summary</h3>";
                                        InvoiceHTML += "<table style=\"width: 100%\">";
                                            InvoiceHTML += "<thead>";
                                                InvoiceHTML += "<tr style=\"background-color: #ccc; color: black; padding: 10px;\">";
                                                    InvoiceHTML += "<th style=\"padding: 10px;\">Date</th>";
                                                    InvoiceHTML += "<th style=\"padding: 10px;\">Vehicle #</th>";
                                                    InvoiceHTML += "<th style=\"padding: 10px;\">Container #</th>";
                                                InvoiceHTML += "</tr>";
                                            InvoiceHTML += "</thead>";
                                            InvoiceHTML += "<tbody>";
                                            var tableContainers = document.getElementById("tblContainersHTML");
                                            var rowLength = tableContainers.rows.length;
                                            var Total = 0;

                                            //loops through rows    
                                            for (i = 0; i < rowLength; i++) {
                                                if (i > 0) {
                                                    var oCells = tableContainers.rows.item(i).cells;
                                                    var cellLength = oCells.length;
                                                    //var rate = oCells.item(4).innerHTML;
                                                    InvoiceHTML += "<tr>";
                                                        InvoiceHTML += "<td style=\"text-align: center;\">" + oCells.item(0).innerHTML + "</td>";
                                                        InvoiceHTML += "<td style=\"text-align: center;\">" + oCells.item(1).innerHTML + "</td>";
                                                        InvoiceHTML += "<td style=\"text-align: center;\">" + oCells.item(2).innerHTML + "</td>";
                                                    InvoiceHTML += "</tr>";
                                                    //Total = (+Total + +rate);
                                                }
                                            }
                                            InvoiceHTML += "</tbody>";
                                        InvoiceHTML += "</table>";
                                    InvoiceHTML += "</div>";
                                InvoiceHTML += "</td>";
                            InvoiceHTML += "</tr>";
            InvoiceHTML += "<tr>";
            InvoiceHTML += "<td>&nbsp;</td>";
                                InvoiceHTML += "<td colspan=\"2\" style=\"\"><h4>Total</h4></td>";
                                //InvoiceHTML += "<td>" + Total + "</td>";
                                InvoiceHTML += "<td><h4>" + document.getElementById('ContentPlaceHolder1_lblInvoiceGrandTotal').innerText + "</h4></td>";
                            InvoiceHTML += "</tr>";
                        InvoiceHTML += "</tbody>";
                    InvoiceHTML += "</table>";
                InvoiceHTML += "</div>";
            InvoiceHTML += "</div>";
            InvoiceHTML += "<br />";

            var prntData = document.getElementById('ContentPlaceHolder1_pnlInvoices');
            var prntWindow = window.open("", "Print", "width=400,height=400,left=0,top=0,toolbar=0,scrollbar=1,status=0");
            var style = "";
            prntWindow.document.write(InvoiceHTML);
            prntWindow.document.close();
            prntWindow.focus();
            prntWindow.print();
            prntWindow.close();
        }

        function Print() {
            debugger;
            //readTextFile("assets/css/style.css");
            
            var InvoiceHTML = "";
            InvoiceHTML += "<div style=\"width: 100%; \">";
                InvoiceHTML += "<div style=\"width: 100%\">";
                    InvoiceHTML += "<div style=\"width: 45%; float: left;\">";
                        InvoiceHTML += "<img alt=\"\" src=\"assets/images/MZBLogo.png\" style=\"width: 45%;\" class=\"img-reponsive\">";
                    InvoiceHTML += "</div>";
                    InvoiceHTML += "<div style=\"width: 45%; float: right;\">";
                        InvoiceHTML += "<img alt=\"\" src=\"assets/images/MZBLogo2.png\" style=\"padding-top: 5%; float: right; width: 85%;\" class=\"img-reponsive\">";
                    InvoiceHTML += "</div>";
                InvoiceHTML += "</div>";
                InvoiceHTML += "<br><br><br>";
                InvoiceHTML += "<div style=\"width: 100%;\">";
                    InvoiceHTML += "<br><br><br>";
                    InvoiceHTML += "<table style=\"width: 100%;\">";
                        InvoiceHTML += "<tr>";
                            InvoiceHTML += "<td style=\"padding: 5px;\"><span>Bill #</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblBillNo').innerText + "</strong></td>";
                            InvoiceHTML += "<td style=\"padding: 5px;\"><span>Customer Invoice #</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblCustomerBillNo').innerText +"</strong></td>";
                        InvoiceHTML += "</tr>";
                        InvoiceHTML += "<tr>";
                            InvoiceHTML += "<td style=\"padding: 5px;\"><span>Bill Date</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblBillDate').innerText + "</strong></td>";
                            InvoiceHTML += "<td style=\"padding: 5px\"><span>Customer</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblPartyName').innerText +"</strong></td>";
                        InvoiceHTML += "</tr>";
                        InvoiceHTML += "<tr>";
                            InvoiceHTML += "<td style=\"padding: 5px\"><span>Shipping Line</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblShippingLine').innerText + "</strong></td>";
                            InvoiceHTML += "<td style=\"padding: 5px\"><span>Clearing Agent</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblClearingAgent').innerText +"</strong></td>";
                        InvoiceHTML += "</tr>";
                        debugger;
                        InvoiceHTML += "<tr>";
                            InvoiceHTML += "<td style=\"padding: 5px\"><span>Remarks</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblRemarks').innerText +"</strong></td><td></td>";
                        InvoiceHTML += "</tr>";
                    InvoiceHTML += "</table>";
                InvoiceHTML += "</div>";
                InvoiceHTML += "<br><br><br>";
                InvoiceHTML += "<div style=\"width: 100%;\">";
                    InvoiceHTML += "<table style=\"width: 100%;\" border=\"1\">";
                        InvoiceHTML += "<thead>";
                            InvoiceHTML += "<tr style=\"background-color: #CCC; color: Black; font-size: 15px;\">";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Bilty#</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Date</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Truck</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">From</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">To</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Container</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Expenses</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Rate</th>";
                                InvoiceHTML += "<th style=\"padding: 05px;\">Amount</th>";
                            InvoiceHTML += "</tr>";
                        InvoiceHTML += "</thead>";
                        InvoiceHTML += "<tbody>";
                            var table = document.getElementById("ContentPlaceHolder1_Tbody1");
                            var rowLength = table.rows.length;
                            for (i = 0; i < rowLength; i++) {
                                
                                var cell = table.rows.item(i).cells;
                                var cellLength = cell.length;
                                InvoiceHTML += "<tr>";
                                    InvoiceHTML += "<td style=\"text-align: center; font-size: 12px; font-size: 12px;\">" + cell.item(0).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center; font-size: 12px;\">" + cell.item(1).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center; font-size: 12px;\">" + cell.item(2).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center; font-size: 12px;\">" + cell.item(3).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center; font-size: 12px;\">" + cell.item(4).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center; font-size: 12px;\">" + cell.item(5).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center; font-size: 12px;\">" + cell.item(6).innerHTML + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center; font-size: 12px;\">" + numberWithCommas(cell.item(7).innerHTML) + "</td>";
                                    InvoiceHTML += "<td style=\"text-align: center; font-size: 12px;\">" + numberWithCommas(cell.item(8).innerHTML) + "</td>";
                                InvoiceHTML += "</tr>";
                                //Total = (+Total + +ExpenseAmount);                                
                            }
                            InvoiceHTML += "<tr>";
                                InvoiceHTML += "<td colspan=\"8\" style=\"text-align: right; vertical-align: bottom;\">Total</td>";
                                //InvoiceHTML += "<td>" + Total + "</td>";
                                InvoiceHTML += "<td style=\"text-align: center; font-size: 12px;\">" + document.getElementById('ContentPlaceHolder1_lblInvoiceGrandTotal').innerText + "</td>";
                            InvoiceHTML += "</tr>";
                        InvoiceHTML += "</tbody>";
                        InvoiceHTML += "</table>";
                        InvoiceHTML += "<h4 style=\"text-decoration: underline;\">" + document.getElementById('ContentPlaceHolder1_lblAmountinWords').innerText +"</h4>";
                InvoiceHTML += "</div>";
            InvoiceHTML += "</div>";
            InvoiceHTML += "<br />";

            var prntData = document.getElementById('ContentPlaceHolder1_pnlInvoices');
            var prntWindow = window.open("", "Print", "width=400,height=400,left=0,top=0,toolbar=0,scrollbar=1,status=0");
            var style = "";
            prntWindow.document.write(InvoiceHTML);
            prntWindow.document.close();
            prntWindow.focus();
            prntWindow.print();
            prntWindow.close();
        }
    </script>
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
                    <%-- <asp:LinkButton ID="lnkGenerateInvoice" runat="server" CssClass="btn btn-xs btn-info pull-right m-r-10 m-t-30" OnClick="lnkGenerateInvoice_Click"><i class="fas fa-file-invoice"></i></asp:LinkButton>--%>
                    <asp:LinkButton ID="lnkGenerateInvoice" runat="server" OnClick="lnkGenerateInvoice_Click"><i class="fas fa-file-invoice"></i></asp:LinkButton>
                    
                    Search Challan<br><small></small>
                </h1>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <ul class="breadcrumb breadcrumb-top">
            <li>Admin</li>
            <li><a href="javascript:;">Search Challan</a></li>
        </ul>
        <!-- END Forms General Header -->
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                 <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
               <asp:Panel ID="pnlChallan" runat="server" CssClass="col-xs-12">
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
                            
                         
                               <asp:GridView ID="gvResult" runat="server" Width="100%" EmptyDataText="No Record found" AutoGenerateColumns="false"
                                            CssClass="table table-striped table-vcenter" Font-Size="12px" Font-Names="Open Sans" OnRowCommand="gvResult_RowCommand" DataKeyNames="OrderID,ChallanID" BackColor="White">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.no">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="OrderNo" HeaderText="Bilty #"></asp:BoundField>
                                                <asp:BoundField DataField="OrderDate" HeaderText="Bilty Date"></asp:BoundField>
                                                <asp:BoundField DataField="ChallanNo" HeaderText="Challan #"></asp:BoundField>
                                                <asp:BoundField DataField="ChallanDate" HeaderText="Challan Date"></asp:BoundField>
                                                <asp:BoundField DataField="Sender" HeaderText="Sender"></asp:BoundField>
                                                <asp:BoundField DataField="Receiver" HeaderText="Receiver"></asp:BoundField>
                                                <asp:BoundField DataField="ProductName" HeaderText="Product Name"></asp:BoundField>
                                                <asp:BoundField DataField="Weight" HeaderText="Weight"></asp:BoundField>
                                                <asp:BoundField DataField="Freight" HeaderText="Freight"></asp:BoundField>
                                                <asp:BoundField DataField="AdvanceAmount" HeaderText="Advance"></asp:BoundField>
                                                <asp:BoundField DataField="VehicleRegNo" HeaderText="Vehicle #"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Actions">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkPrint" runat="server" CssClass="fas fa-print" ToolTip="Click To Generate Report" ForeColor="DodgerBlue" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Print"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            
                                        </asp:GridView>
                                
                        </div>
                        <!-- END Table Styles Content -->
                    </div>
               
                    <!-- END Table Styles Block -->
            </div>
        </div> 
                   </asp:Panel> 

                 <asp:Panel ID="pnlChallanPreview" runat="server" CssClass="col-xs-12" style="display: none;">
                        <section class="box ">
                            <header class="panel_header">
                                <h2 class="title pull-left">Challan Preview</h2>
                                <asp:LinkButton ID="lnkClosePrview" runat="server" CssClass="btn btn-danger pull-right m-r-10 m-t-30" OnClick="lnkClosePrview_Click"><i class="fas fa-times"></i></asp:LinkButton>
                            </header>
                            <div class="content-body">
                                <%--<div class="row">
                                    <div class="col-md-12">
                                        
                                    </div>
                                </div>--%>
                                <%-- SSRS Report --%>
                                <rsweb:reportviewer ID="rwChallan" runat="server" Width="100%" Height="800px" PageCountMode="Actual" ShowPageNavigationControls="False"></rsweb:reportviewer>
                                <%-- SSRS Report --%>
                            </div>
                        </section>
                    </asp:Panel>
                    <ajaxToolkit:ModalPopupExtender ID="modalReport" runat="server" PopupControlID="pnlReport" TargetControlID="btnOpenReport"
                        CancelControlID="btnCloseReport" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                    
                    <asp:Panel CssClass="col-xs-12" ID="pnlReport" runat="server"  tabindex="-1" role="dialog" aria-hidden="true">
                        <asp:Button ID="btnOpenReport" runat="server" style="display: none" />
                        <asp:Button ID="btnCloseReport" runat="server" style="display: none" />
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Maroon" style="display: none;"></asp:LinkButton>--%>
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="lnkCloseIcon" runat="server" CssClass="pull-right" OnClick="lnkClose_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                    <h4 class="modal-title">Challan Report</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="divModalNotification" style="margin-top: 10px;" runat="server"></div>
                                    <div class="row">
                                        <div class="col-md-12" style="overflow-y: scroll; overflow-x: scroll; height: 400px;">
                                        
                                        </div>
                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="lnkClose" runat="server" CssClass="btn btn-info" OnClick="lnkClose_Click"><i class="fas fa-times"></i> | Close</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
   
       
    </div>
    <!-- END Page Content -->
</asp:Content>
