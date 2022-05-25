<%@ Page Title="" Language="C#" MasterPageFile="~/Bilty/MasterPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="SAShahBiltySystem.Bilty.Search" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Search Bilty</title>
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
            z-index: 11111111111111;
        }

        .hoverlistitem {
            background-color: #d3d3d3;
        }

        .heading {
            font-weight: bold;
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
    <script src="../assets/js/jquery-1.11.2.min.js"></script>

    <script type="text/javascript">


        function Print() {
            debugger;

            var InvoiceHTML = "";

            var PaidToPay = document.getElementById('ContentPlaceHolder1_lblPaidtoPay').innerText;
            InvoiceHTML += "<style>";
            InvoiceHTML += ".clearfix: after {";
            InvoiceHTML += "content: \"\";";
            InvoiceHTML += "display: table;";
            InvoiceHTML += "clear: both;";
            InvoiceHTML += "}";

            InvoiceHTML += "a {";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "text-decoration: underline;";
            InvoiceHTML += "}";

            InvoiceHTML += "body {";
            InvoiceHTML += "position: relative;";
            InvoiceHTML += "width: 21cm;  ";
            InvoiceHTML += "height: 29.7cm; ";
            InvoiceHTML += "margin: 0 auto; ";
            InvoiceHTML += "color: #001028;";
            InvoiceHTML += "background: #FFFFFF; ";
            InvoiceHTML += "font-family: Calibri; ";
            InvoiceHTML += "font-size: 12px; ";
            InvoiceHTML += "font-family: Arial;";
            InvoiceHTML += "}";

            InvoiceHTML += "header {";
            InvoiceHTML += "padding: 10px 0;";
            InvoiceHTML += "margin-bottom: 30px;";
            InvoiceHTML += "}";

            InvoiceHTML += "#logo {";
            InvoiceHTML += "text-align: center;";
            InvoiceHTML += "margin-bottom: 10px;";
            InvoiceHTML += "border-bottom: 1px solid #C1CED9;";
            InvoiceHTML += "}";

            InvoiceHTML += "#logo img {";
            InvoiceHTML += "width: 90px;";
            InvoiceHTML += "}";

            InvoiceHTML += "h1 {";
            InvoiceHTML += "border-top: 1px solid  #5D6975;";
            InvoiceHTML += "border-bottom: 1px solid  #5D6975;";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "font-size: 2.4em;";
            InvoiceHTML += "line-height: 1.4em;";
            InvoiceHTML += "font-weight: normal;";
            InvoiceHTML += "text-align: center;";
            InvoiceHTML += "margin: 0 0 20px 0;";
            InvoiceHTML += "background: url(dimension.png);";
            InvoiceHTML += "}";

            InvoiceHTML += "#project {";
            InvoiceHTML += "float: left;";
            InvoiceHTML += "}";

            InvoiceHTML += "#project span {";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "text-align: right;";
            InvoiceHTML += "width: 52px;";
            InvoiceHTML += "margin-right: 10px;";
            InvoiceHTML += "display: inline-block;";
            InvoiceHTML += "font-size: 0.8em;";
            InvoiceHTML += "}";

            InvoiceHTML += "#company {";
            InvoiceHTML += "float: right;";
            InvoiceHTML += "text-align: right;";
            InvoiceHTML += "}";

            InvoiceHTML += "#project div,";
            InvoiceHTML += "#company div {";
            InvoiceHTML += "white-space: nowrap;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc {";
            InvoiceHTML += "width: 100%;";
            InvoiceHTML += "border-collapse: collapse;";
            InvoiceHTML += "border-spacing: 0;";
            InvoiceHTML += "margin-bottom: 20px;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc tr:nth-child(2n-1) td {";
            InvoiceHTML += "background: #F5F5F5;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc th,";
            InvoiceHTML += ".tblDesc td {";
            InvoiceHTML += "text-align: center;";
            InvoiceHTML += "border: 1px solid black;";
            //InvoiceHTML += "pading: 10px";
            //InvoiceHTML += "font-size: 13px";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc th {";
            InvoiceHTML += "padding: 15px";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "border-bottom: 1px solid #C1CED9;";
            InvoiceHTML += "white-space: nowrap;";
            InvoiceHTML += "font-weight: Bold;";
            InvoiceHTML += "font-size: 18px;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc .service,";
            InvoiceHTML += ".tblDesc .desc {";
            InvoiceHTML += "text-align: left;";
            InvoiceHTML += "}";

            InvoiceHTML += "tblDesc td {";
            InvoiceHTML += "padding: 20px;";
            InvoiceHTML += "text-align: right;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc td.service,";
            InvoiceHTML += ".tblDesc td.desc {";
            InvoiceHTML += "vertical-align: top;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc td.unit,";
            InvoiceHTML += ".tblDesc td.qty,";
            InvoiceHTML += ".tblDesc td.total {";
            InvoiceHTML += "font-size: 1.2em;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc td.grand {";
            InvoiceHTML += "border-top: 1px solid #5D6975;;";
            InvoiceHTML += "}";

            InvoiceHTML += "#notices .notice {";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "font-size: 1.2em;";
            InvoiceHTML += "}";

            InvoiceHTML += "footer {";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "width: 100%;";
            InvoiceHTML += "height: 30px;";
            InvoiceHTML += "position: absolute;";
            InvoiceHTML += "bottom: 0;";
            InvoiceHTML += "border-top: 1px solid #C1CED9;";
            InvoiceHTML += "padding: 8px 0;";
            InvoiceHTML += "text-align: center;";
            InvoiceHTML += "}";
            InvoiceHTML += "</style > ";
            InvoiceHTML += "<header class=\"clearfix\">";
            InvoiceHTML += "<div id=\"logo\ style=\"width: 100%; border-top: 1px solid #C1CED9;\">";
            InvoiceHTML += "<img src=\"../assets/images/MZBLogo.png\" style=\"width: 25%;\">";
            InvoiceHTML += "<img src=\"../assets/images/MZBLogo2.png\" style=\"width: 43%; float: right;\">";
            InvoiceHTML += "</div>";
            InvoiceHTML += "<br>";
            InvoiceHTML += "<div class=\"clearfix\" style=\"width: 100%;\">";
            InvoiceHTML += "<br><br><br>";
            InvoiceHTML += "<table style=\"width: 100%;\">";
            InvoiceHTML += "<tr>";
            InvoiceHTML += "<td style=\"padding: 10px;\"><span>Bilty#</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblBiltyNo').innerText + "</strong></div></td>";
            InvoiceHTML += "<td style=\"padding: 10px;\"><span>Date#</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblBiltyDate').innerText + "</strong></td>";
            InvoiceHTML += "<td style=\"padding: 10px;\">Truck</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblVehicleRegNo').innerText + "</strong></td>";
            InvoiceHTML += "<td style=\"padding: 10px;\">From</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblFrom').innerText + "</strong></td>";
            InvoiceHTML += "<td style=\"padding: 10px;\"><span>To</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblTo').innerText + "</strong></td>";
            InvoiceHTML += "</tr>";

            InvoiceHTML += "<tr>";
            InvoiceHTML += "<td colspan=\"3\" style=\"padding: 10px;\"><span>Sender</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblSenderCompany').innerText + "</strong></div></td>";
            InvoiceHTML += "<td colspan=\"2\" style=\"padding: 10px;\"><span>Broker</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblBroker').innerText + "</strong></td>";
            InvoiceHTML += "</tr>";

            InvoiceHTML += "<tr>";
            InvoiceHTML += "<td colspan=\"3\" style=\"padding: 10px;\"><span>Receiver</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblReceiverCompany').innerText + "</strong></div></td>";
            InvoiceHTML += "<td colspan=\"2\" style=\"padding: 10px;\"><span>Vehicle Contact</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblContact').innerText + "</strong></td>";
            InvoiceHTML += "</tr>";
            InvoiceHTML += "</table>";
            InvoiceHTML += "</div>";
            InvoiceHTML += "</header>";
            InvoiceHTML += "<main>";
            InvoiceHTML += "<table border\"1\" class=\"tblDesc\">";
            InvoiceHTML += "<thead>";
            InvoiceHTML += "<tr>";
            InvoiceHTML += "<th style=\"padding: 20px;\">NOs.</th>";
            InvoiceHTML += "<th style=\"padding: 20px;\">DESCRIPTION</th>";
            InvoiceHTML += "<th style=\"padding: 20px;\">WEIGHT</th>";
            InvoiceHTML += PaidToPay == "To-Pay" ? "<th style=\"padding: 20px;\">FREIGHT</th>" : "";
            InvoiceHTML += "</tr>";
            InvoiceHTML += "</thead>";
            InvoiceHTML += "<tbody>";

            var tableExpenses = document.getElementById("ContentPlaceHolder1_tblDescriptionBody");
            for (var i = 0, row; row = tableExpenses.rows[i]; i++) {
                var items = row.cells;
                InvoiceHTML += "<tr>";
                InvoiceHTML += "<td style=\"" + (i > 1 ? " padding: 10px;" : " padding: 20px;") + "\">" + items.item(0).innerHTML + "</td>";
                InvoiceHTML += "<td style=\"text-align: left;" + (i > 1 ? " padding: 10px;" : " padding: 20px;") + "\">" + items.item(1).innerHTML + "</td>";
                InvoiceHTML += "<td style=\"" + (i > 1 ? " padding: 10px;" : " padding: 20px;") + "\">" + items.item(2).innerHTML + "</td>";
                InvoiceHTML += PaidToPay == "To-Pay" ? "<td style=\"" + (i > 1 ? " padding: 10px;" : "padding: 20px;") + "\">" + items.item(3).innerHTML + "</td>" : "";
                //InvoiceHTML += "<td style=\"padding: 20px;\">" + items.item(4).innerHTML + "</td>";
                //InvoiceHTML += "<td style=\"padding: 20px;\">" + items.item(5).innerHTML + "</td>";
                InvoiceHTML += "</tr>";
            }
            InvoiceHTML += "<tr style=\"height: 175px;\">";
            InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            InvoiceHTML += PaidToPay == "To-Pay" ? "<td style=\"padding: 20px;\">&nbsp;</td>" : "";
            //InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            //InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            InvoiceHTML += "</tr>";
            //var items = tableExpenses.rows.item(0).cells;

            InvoiceHTML += "</tbody>";
            InvoiceHTML += "</table>";
            InvoiceHTML += "<table style=\"width: 100%\">";
            if (PaidToPay == "To-Pay") {
                //InvoiceHTML += "<tr>";
                //    InvoiceHTML += "<td colspan=\"2\">&nbsp;</td>";
                //    InvoiceHTML += document.getElementById('ContentPlaceHolder1_lblTotalAdvance').innerText == "0" ? "" : "<td style=\"text-align: right;\"><h2>Total Advance: " + document.getElementById('ContentPlaceHolder1_lblTotalAdvance').innerText + "</h4></td>";
                //InvoiceHTML += "</tr>";
                InvoiceHTML += "<tr>";
                InvoiceHTML += "<td colspan=\"2\">&nbsp;</td>";
                InvoiceHTML += "<td style=\"text-align: right;\"><h2>Total: " + document.getElementById('ContentPlaceHolder1_lblBalance').innerText + "</h4></td>";
                InvoiceHTML += "</tr>";
            } else {
                InvoiceHTML += "<tr>";
                InvoiceHTML += "<td colspan=\"2\">&nbsp;</td>";
                InvoiceHTML += "<td style=\"text-align: right;\"><h2>Paid</h4></td>";
                InvoiceHTML += "</tr>";
            }

            InvoiceHTML += "</table > ";
            InvoiceHTML += "<br>";
            InvoiceHTML += "<div id=\"notices\">";
            InvoiceHTML += "<div>NOTICE:</div>";
            InvoiceHTML += "<div class=\"notice\">Contact transportation company or broker in case of any debris.</div>";
            InvoiceHTML += "</div>";
            InvoiceHTML += "<br><br>";
            InvoiceHTML += "<div id=\"notices\" style=\"text-align: right;\">";
            InvoiceHTML += "<div>Receiver Signature:</div>";
            InvoiceHTML += "<br><br><br> _________________________________";
            InvoiceHTML += "</div>";
            InvoiceHTML += "</main>";
            InvoiceHTML += "<footer>";
            InvoiceHTML += "Invoice was created on a computer and is valid without the signature and seal.";
            InvoiceHTML += "</footer>";
            var prntData = document.getElementById('ContentPlaceHolder1_pnlInvoices');
            var prntWindow = window.open("", "Print", "width=400,height=400,left=0,top=0,toolbar=0,scrollbar=1,status=0");
            var style = "";
            prntWindow.document.write(InvoiceHTML);
            prntWindow.document.close();
            prntWindow.focus();
            prntWindow.print();
            prntWindow.close();
        }

        function PrintInvoice() {
            debugger;

            var InvoiceHTML = "";
            InvoiceHTML += "<style>";
            InvoiceHTML += ".clearfix: after {";
            InvoiceHTML += "content: \"\";";
            InvoiceHTML += "display: table;";
            InvoiceHTML += "clear: both;";
            InvoiceHTML += "}";

            InvoiceHTML += "a {";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "text-decoration: underline;";
            InvoiceHTML += "}";

            InvoiceHTML += "body {";
            InvoiceHTML += "position: relative;";
            InvoiceHTML += "width: 21cm;  ";
            InvoiceHTML += "height: 29.7cm; ";
            InvoiceHTML += "margin: 0 auto; ";
            InvoiceHTML += "color: #001028;";
            InvoiceHTML += "background: #FFFFFF; ";
            InvoiceHTML += "font-family: Calibri; ";
            InvoiceHTML += "font-size: 12px; ";
            InvoiceHTML += "font-family: Arial;";
            InvoiceHTML += "}";

            InvoiceHTML += "header {";
            InvoiceHTML += "padding: 10px 0;";
            InvoiceHTML += "margin-bottom: 30px;";
            InvoiceHTML += "}";

            InvoiceHTML += "#logo {";
            InvoiceHTML += "text-align: center;";
            InvoiceHTML += "margin-bottom: 10px;";
            InvoiceHTML += "border-bottom: 1px solid #C1CED9;";
            InvoiceHTML += "}";

            InvoiceHTML += "#logo img {";
            InvoiceHTML += "width: 90px;";
            InvoiceHTML += "}";

            InvoiceHTML += "h1 {";
            InvoiceHTML += "border-top: 1px solid  #5D6975;";
            InvoiceHTML += "border-bottom: 1px solid  #5D6975;";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "font-size: 2.4em;";
            InvoiceHTML += "line-height: 1.4em;";
            InvoiceHTML += "font-weight: normal;";
            InvoiceHTML += "text-align: center;";
            InvoiceHTML += "margin: 0 0 20px 0;";
            InvoiceHTML += "background: url(dimension.png);";
            InvoiceHTML += "}";

            InvoiceHTML += "#project {";
            InvoiceHTML += "float: left;";
            InvoiceHTML += "}";

            InvoiceHTML += "#project span {";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "text-align: right;";
            InvoiceHTML += "width: 52px;";
            InvoiceHTML += "margin-right: 10px;";
            InvoiceHTML += "display: inline-block;";
            InvoiceHTML += "font-size: 0.8em;";
            InvoiceHTML += "}";

            InvoiceHTML += "#company {";
            InvoiceHTML += "float: right;";
            InvoiceHTML += "text-align: right;";
            InvoiceHTML += "}";

            InvoiceHTML += "#project div,";
            InvoiceHTML += "#company div {";
            InvoiceHTML += "white-space: nowrap;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc {";
            InvoiceHTML += "width: 100%;";
            InvoiceHTML += "border-collapse: collapse;";
            InvoiceHTML += "border-spacing: 0;";
            InvoiceHTML += "margin-bottom: 20px;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc tr:nth-child(2n-1) td {";
            InvoiceHTML += "background: #F5F5F5;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc td {";
            InvoiceHTML += "text-align: center;";
            InvoiceHTML += "border: 1px solid black;";
            //InvoiceHTML += "pading: 10px";
            //InvoiceHTML += "font-size: 13px";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc th {";
            InvoiceHTML += "padding: 15px";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "border-bottom: 1px solid #C1CED9;";
            InvoiceHTML += "white-space: nowrap;";
            InvoiceHTML += "font-weight: Bold;";
            InvoiceHTML += "font-size: 18px;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc .service,";
            InvoiceHTML += ".tblDesc .desc {";
            InvoiceHTML += "text-align: left;";
            InvoiceHTML += "}";

            InvoiceHTML += "tblDesc td {";
            InvoiceHTML += "padding: 20px;";
            InvoiceHTML += "text-align: right;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc td.service,";
            InvoiceHTML += ".tblDesc td.desc {";
            InvoiceHTML += "vertical-align: top;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc td.unit,";
            InvoiceHTML += ".tblDesc td.qty,";
            InvoiceHTML += ".tblDesc td.total {";
            InvoiceHTML += "font-size: 1.2em;";
            InvoiceHTML += "}";

            InvoiceHTML += ".tblDesc td.grand {";
            InvoiceHTML += "border-top: 1px solid #5D6975;;";
            InvoiceHTML += "}";

            InvoiceHTML += "#notices .notice {";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "font-size: 1.2em;";
            InvoiceHTML += "}";

            InvoiceHTML += "footer {";
            InvoiceHTML += "color: #5D6975;";
            InvoiceHTML += "width: 100%;";
            InvoiceHTML += "height: 30px;";
            InvoiceHTML += "position: absolute;";
            InvoiceHTML += "bottom: 0;";
            InvoiceHTML += "border-top: 1px solid #C1CED9;";
            InvoiceHTML += "padding: 8px 0;";
            InvoiceHTML += "text-align: center;";
            InvoiceHTML += "}";
            InvoiceHTML += "</style > ";
            InvoiceHTML += "<header class=\"clearfix\">";
            InvoiceHTML += "<div id=\"logo\ style=\"width: 100%; border-top: 1px solid #C1CED9;\">";
            InvoiceHTML += "<img src=\"../assets/images/MZBLogo.png\" style=\"width: 25%;\">";
            InvoiceHTML += "<img src=\"../assets/images/MZBLogo2.png\" style=\"width: 43%; float: right;\">";
            InvoiceHTML += "</div>";
            InvoiceHTML += "<br>";
            //InvoiceHTML += "<h1>BILTY# " + document.getElementById('ContentPlaceHolder1_lblBiltyNo').innerText + "</h1>";
            InvoiceHTML += "<div class=\"clearfix\" style=\"width: 100%;\">";
            InvoiceHTML += "<br><br><br>";
            InvoiceHTML += "<table style=\"width: 100%;\">";
            InvoiceHTML += "<tr>";
            InvoiceHTML += "<td><span>Invoice #</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblPrintInvoieno').innerText + "</strong></div></td>";
            InvoiceHTML += "</tr>";
            InvoiceHTML += "<tr>";
            InvoiceHTML += "<td><span>Invoice Date</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblPrintInvoiceDate').innerText + "</strong></td>";
            InvoiceHTML += "</tr>";
            InvoiceHTML += "<tr>";
            InvoiceHTML += "<td>Customer</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblPrintInvoiceCsutomer').innerText + "</strong></td>";
            InvoiceHTML += "</tr>";
            InvoiceHTML += "<tr>";
            InvoiceHTML += "<td>Remarks</span> <strong>" + document.getElementById('ContentPlaceHolder1_lblPrintInvoiceRemarks').innerText + "</strong></td>";
            InvoiceHTML += "</tr>";
            InvoiceHTML += "</table>";
            InvoiceHTML += "</div>";
            InvoiceHTML += "</header>";
            InvoiceHTML += "<main>";
            InvoiceHTML += "<table border\"1\" class=\"tblDesc\">";
            InvoiceHTML += "<thead>";
            InvoiceHTML += "<tr>";
            InvoiceHTML += "<th style=\"padding: 20px;\">CODE</th>";
            InvoiceHTML += "<th style=\"padding: 20px;\">DESCRIPTION</th>";
            InvoiceHTML += "<th style=\"padding: 20px;\">QUANTITY</th>";
            InvoiceHTML += "<th style=\"padding: 20px;\">RATE</th>";
            InvoiceHTML += "<th style=\"padding: 20px;\">AMOUNT</th>";
            InvoiceHTML += "</tr>";
            InvoiceHTML += "</thead>";
            InvoiceHTML += "<tbody>";

            var tableExpenses = document.getElementById("ContentPlaceHolder1_tblPrintInvoice");
            for (var i = 0, row; row = tableExpenses.rows[i]; i++) {
                var items = row.cells;
                InvoiceHTML += "<tr>";
                InvoiceHTML += "<td" + (i > 0 ? "" : " style=\"padding: 20px;\"") + ">" + items.item(0).innerHTML + "</td>";
                InvoiceHTML += "<td" + (i > 0 ? "" : " style=\"padding: 20px;\"") + ">" + items.item(1).innerHTML + "</td>";
                InvoiceHTML += "<td" + (i > 0 ? "" : " style=\"padding: 20px;\"") + ">" + items.item(2).innerHTML + "</td>";
                InvoiceHTML += "<td" + (i > 0 ? "" : " style=\"padding: 20px;\"") + ">" + items.item(3).innerHTML + "</td>";
                InvoiceHTML += "<td" + (i > 0 ? "" : " style=\"padding: 20px;\"") + ">" + items.item(4).innerHTML + "</td>";
                InvoiceHTML += "</tr>";
            }
            //InvoiceHTML += "<tr style=\"height: 175px;\">";
            //    InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            //    InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            //    InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            //    InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            //InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            //InvoiceHTML += "<td style=\"padding: 20px;\">&nbsp;</td>";
            InvoiceHTML += "</tr>";
            //var items = tableExpenses.rows.item(0).cells;

            InvoiceHTML += "</tbody>";
            InvoiceHTML += "</table>";
            InvoiceHTML += "<table style=\"width: 100%\">";
            InvoiceHTML += "<tr>";
            InvoiceHTML += "<td colspan=\"3\">&nbsp;</td>";
            InvoiceHTML += "<td style=\"text-align: right;\"><h2>Total: " + document.getElementById('ContentPlaceHolder1_lblPrintInvoiceToal').innerText + "</h4></td>";
            InvoiceHTML += "</tr>";
            InvoiceHTML += "</table > ";
            InvoiceHTML += "<br>";
            InvoiceHTML += "<div id=\"notices\">";
            InvoiceHTML += "<div>NOTICE:</div>";
            InvoiceHTML += "<div class=\"notice\">Contact transportation company or broker in case of debris.</div>";
            InvoiceHTML += "</div>";
            InvoiceHTML += "<br><br>";
            InvoiceHTML += "<div id=\"notices\" style=\"text-align: right;\">";
            InvoiceHTML += "<div>Receiver Signature:</div>";
            InvoiceHTML += "<br><br><br> _________________________________";
            InvoiceHTML += "</div>";
            InvoiceHTML += "</main>";
            InvoiceHTML += "<footer>";
            InvoiceHTML += "Invoice was created on a computer and is valid without the signature and seal.";
            InvoiceHTML += "</footer>";
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
                    
                    <asp:LinkButton ID="lnkSearchBilty" runat="server" OnClick="lnkSearchBilty_Click" ToolTip="Click to Search"><i class="fas fa-search"></i></asp:LinkButton>
                    Search Bilty<br><small>Add/View Search & Details</small>
                </h1>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <ul class="breadcrumb breadcrumb-top">
            <li>Admin</li>
            <li><a href="javascript:;">Search Bilty</a></li>
        </ul>
        <!-- END Forms General Header -->
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                 <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
                 <div class="row">
            <asp:Panel ID="pnlSearch" runat="server" CssClass="col-md-12" Visible="false">
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <!-- Basic Form Elements Block -->
                <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                        <div class="block-options pull-right">
                            <asp:LinkButton ID="lnkCloseSearch" runat="server" CssClass="btn btn-xs btn-danger pull-right" Style="margin-top: 10px; margin-right: 10px;" OnClick="lnkCloseSearch_Click"><i class="fas fa-times"></i></asp:LinkButton>
                        </div>
                        <h2><strong>Keyword</strong></h2>
                    </div>
                    <!-- END Form Elements Title -->

                    <!-- Basic Form Elements Content -->
                    <div class="form-horizontal form-bordered" onsubmit="return false;">
                        <div class="form-group">
                            
                            <div class="col-md-6">
                                <label>Keyword:</label>
                                 <asp:TextBox ID="txtKeyword" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                               <asp:LinkButton ID="lnkSearch" runat="server" CssClass="btn btn-success pull-right m-r-10 m-t-25" ToolTip="Click to Search Bilty"><i class="fas fa-search"></i></asp:LinkButton>
                            </div>
                            
                        </div>
                    </div>
                    <!-- END Basic Form Elements Content -->
                </div>
                <!-- END Basic Form Elements Block -->
            </asp:Panel>
           
        </div>

        <div class="row">
            <div class="col-md-12">
                    
                    <!-- Table Styles Block -->
                    <div class="block">
                        <!-- Table Styles Title -->
                        <div class="block-title">
                            
                        </div>
                        <!-- END Table Styles Title -->
                        <div class="table-options clearfix">
                             
                              
                              
                            </div>
                        <!-- Table Styles Content -->
                        <!-- Changing classes functionality initialized in js/pages/tablesGeneral.js -->
                         <asp:Panel runat="server" ID="pnlGrid">
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
                         <asp:HiddenField ID="hfSelectedOrder" runat="server" />
                             <%--<asp:GridView ID="gvResult" runat="server" Width="100%" EmptyDataText="No Record found" AutoGenerateColumns="false"
                                            CssClass="table table-striped table-vcenter" Font-Size="12px" DataKeyNames="DocumentTypeID, isActive" BackColor="White" OnRowCommand="gvResult_RowCommand" OnRowDataBound="gvResult_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.no">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                       <asp:BoundField DataField="Code" HeaderText="Code"></asp:BoundField>
                                        <asp:BoundField DataField="Name" HeaderText="Document"></asp:BoundField>
                                        <asp:BoundField DataField="Description" HeaderText="Description"></asp:BoundField>
                                                 <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10%">
                                                            <ItemTemplate>
                                                                <div class="btn-group">
                                                                    <div class="btn-group">
                                                                        <div class="btn-group">
                                                                            <a href="javascript:void(0)" data-toggle="dropdown" class="btn btn-alt btn-primary dropdown-toggle"><span class="caret"></span></a>
                                                                            <ul class="dropdown-menu text-right">
                                                                                <li class="dropdown-header">Header</li>
                                                                                <li><asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="View"><i class="fas fa-eye"></i> | View</asp:LinkButton></li>
                                                                                <li><asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Change"><i class="fas fa-edit m-l-15"></i> | Edit</asp:LinkButton></li>
                                                                                
                                                                                <li><asp:LinkButton ID="lnkDelete" runat="server" ForeColor="Maroon" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="DeleteDocumentType"><i class="fas fa-trash"></i> | Delete</asp:LinkButton></li>
                                                                                
                                                                            </ul>
                                                                        </div>
                                                                        <%--<a class="btn btn-alt btn-danger"><i class="fa fa-cog"></i></a>--%>
                             <%--                                                                        <div class="btn btn-alt btn-primary"><asp:LinkButton ID="lnkActive" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Active"></asp:LinkButton></div>
                                                        
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                       
                                            </Columns>
                                        </asp:GridView>--%>
                            <asp:GridView ID="gvBilty" runat="server" CssClass="table table-striped table-vcenter" AutoGenerateColumns="false" Font-Size="10px"
                                                DataKeyNames="OrderID, Vehicles, Containers, Products, Recievings, Damages, isInvoiced, PaidToPay,CustomerCompanyID"
                                                OnRowCommand="gvBilty_RowCommand" OnRowDataBound="gvBilty_RowDataBound" AllowPaging="true" AllowSorting="true" OnSorting="gvBilty_Sorting"
                                                OnPageIndexChanging="gvBilty_PageIndexChanging" PageSize="50" PagerSettings-Position="TopAndBottom" PagerStyle-HorizontalAlign="Center" PagerSettings-FirstPageText="<<" PagerSettings-LastPageText=">>">
                                                <Columns>
                                                    <asp:BoundField DataField="OrderNo" HeaderText="Bilty #" SortExpression="OrderNo" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="SenderCompany" HeaderText="Sender" SortExpression="SenderCompany" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="ReceiverCompany" HeaderText="Reciever" SortExpression="ReceiverCompany" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="BillToCustomerCompany" HeaderText="Bill To" SortExpression="BillToCustomerCompany" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="PaidToPay" HeaderText="Paid To Pay" SortExpression="PaidToPay" />
                                                    <asp:TemplateField HeaderText="Vehicles" ItemStyle-HorizontalAlign="Center" SortExpression="Vehicles">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkVehicles" runat="server" CommandName="BiltyVehicles" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-truck"></i></asp:LinkButton>
                                                            |
                                                            <asp:Label ID="lblTotalVehicles" runat="server" Text='<%# Eval("Vehicles") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="Containers" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkContainers" runat="server" CommandName="BiltyContainers" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-shuttle-van"></i></asp:LinkButton> | <asp:Label ID="lblTotalContainers" runat="server" Text='<%# Eval("Containers") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Products" SortExpression="Products" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkProducts" runat="server" CommandName="BiltyProducts" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-boxes"></i></asp:LinkButton>
                                                            |
                                                            <asp:Label ID="lblProducts" runat="server" Text='<%# Eval("Products") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Advances" SortExpression="Advances" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkAdvances" runat="server" CommandName="BiltyAdvances" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-search-plus"></i></asp:LinkButton>
                                                            |
                                                            <asp:Label ID="lblAdvances" runat="server" Text='<%# Eval("Advances") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Expenses" SortExpression="Expenses" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkExpenses" runat="server" CommandName="BiltyExpenses" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-search-plus"></i></asp:LinkButton>
                                                            |
                                                            <asp:Label ID="lblExpenses" runat="server" Text='<%# Eval("TotalExpenses") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--  <asp:TemplateField HeaderText="Damages" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDamages" runat="server" CommandName="Invoices" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-unlink"></i></asp:LinkButton> | <asp:Label ID="lblTotalRecievingDocs" runat="server" Text='<%# Eval("Damages") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:BoundField DataField="BiltyFreight" SortExpression="BiltyFreight" HeaderText="Bilty Freight" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="Rate" SortExpression="Rate" HeaderText="Rate" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                                    <%--<asp:BoundField DataField="PartyCommission" HeaderText="Party Commission" ItemStyle-HorizontalAlign="Center" />--%>
                                                    <asp:TemplateField HeaderText="Bilty Print" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>

                                                            <div class="dropdown">
                                                                <button class="btn-xs btn-danger dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                                                                    Print
                                                                    <span class="caret"></span>
                                                                </button>
                                                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                                                    <li role="presentation">
                                                                        <asp:LinkButton ID="lnkPrintOfficeBilty" CssClass="btn-xs btn-default" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="OfficePrint"><i class="fas fa-print"></i>| Office</asp:LinkButton>
                                                                    </li>

                                                                    <li role="presentation">
                                                                        <asp:LinkButton ID="lnkPrintCustomerBilty" CssClass="btn-xs btn-default" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="CustomerPrint"><i class="fas fa-print"></i>| Customer</asp:LinkButton>
                                                                    </li>

                                                                    <li role="presentation">
                                                                        <asp:LinkButton ID="lnkPrintBilty" CssClass="btn-xs btn-default" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="BothPrint"><i class="fas fa-print"></i>| Both</asp:LinkButton>
                                                                    </li>

                                                                </ul>
                                                            </div>

                                                            <%--<div class="btn-group bottom15 right15">
                                                                <div class="dropdown">
                                                                    <button class="btn btn-primary btn-border dropdown-toggle btn-xs" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                                                        Documents
                                                                        <span class="caret"></span>
                                                                    </button>
                                                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                                                        <li role="presentation"><asp:LinkButton ID="lnkBiltyPrint" runat="server" Font-Size="12px" CommandName="BiltyPrint" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-print"></i> | Print Bilty</asp:LinkButton></li>
                                                                        <li role="presentation"><asp:LinkButton ID="lnkInvoice" runat="server" Font-Size="12px" CommandName="Invoice" Enabled ="False" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-file-invoice"></i> | Invoice</asp:LinkButton></li>
                                                                        <li role="presentation"><asp:LinkButton ID="SalesTaxInvoice" runat="server" Font-Size="12px" Enabled ="False" ToolTip="Underconstruction" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-percent"></i> | Sales Tax Invoice</asp:LinkButton></li>
                                                                    </ul>
                                                                </div>
                                                            </div>--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Update" Visible="false">
                                                        <ItemTemplate>
                                                            <div class="dropdown">
                                                                <button class="btn btn-xs btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                                                    Edit
                                                                    <span class="caret"></span>
                                                                </button>
                                                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                                                    <li role="presentation">
                                                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Change" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' Text="Only Bilty"></asp:LinkButton></li>
                                                                    <li role="presentation">
                                                                        <asp:LinkButton ID="lnkEditWhole" runat="server" CommandName="ChangeAll" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' Text="Whole Bilty"></asp:LinkButton></li>
                                                                </ul>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddlStatus" runat="server"  CssClass="form-control">
                                                                <asp:ListItem>Pending</asp:ListItem>
                                                                <asp:ListItem>Advance Received</asp:ListItem>
                                                                <asp:ListItem>Partial Payment</asp:ListItem>
                                                                <asp:ListItem>Complete</asp:ListItem>
                                                                <asp:ListItem>Cancel</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            <PagerStyle CssClass="pagination-ys" />
                                            </asp:GridView>
                                
                        </div>
                             </asp:Panel>
                        <!-- END Table Styles Content -->
                        <asp:Panel ID="pnlReport" Style="display: none;" runat="server">
                                    <asp:LinkButton CssClass="btn btn-danger pull-right" ID="pnlReportHide" OnClick="pnlReportHide_Click" runat="server"><i class="fas fa-times"></i></asp:LinkButton>
                                    <div class="row">

                                        <%-- SSRS REPORT --%>

                                        <rsweb:ReportViewer ID="rwBilty" runat="server" Width="100%" Height="800px" ShowPageNavigationControls="False"></rsweb:ReportViewer>

                                        <%-- SSRS REPORT --%>
                                    </div>
                                </asp:Panel>
                    </div>
                 <ajaxToolkit:ModalPopupExtender ID="modalConfirm" runat="server" PopupControlID="pnlConfirm" DropShadow="True" TargetControlID="btnOpenConfirmModal" 
                        CancelControlID="lnkCloseConfirmModal" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                   <asp:Panel ID="pnlConfirm" runat="server" class="">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                   <div class="col-md-12">
                                <div class="form-group">
                                    <label>Customer Invoice No</label>
                                    <asp:TextBox ID="txtCustomerInvoiceNo" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                    <!-- END Modal Header -->
                    <asp:Label ID="lblModalTitle" runat="server"></asp:Label></h4>
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <div class="form-horizontal form-bordered">
                            <div class="form-group form-actions">
                                <div class="col-xs-12 text-right">
                                    <asp:Button ID="btnOpenConfirmModal" runat="server" style="display: none" />
                                    <asp:Label ID="lblConfirmAction" runat="server" Visible="false"></asp:Label>
                                    <asp:LinkButton ID="lnkCloseConfirmModal" runat="server" ForeColor="Maroon" CssClass="pull-right" style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <asp:HiddenField ID="hfConfirmAction" runat="server" />
                                   
                            <asp:LinkButton ID="lnkConfirm" runat="server" CssClass="btn btn-sm btn-primary" OnClick="lnkConfirm_Click"><i class="fas fa-save"></i> | Confirm</asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancelConfirm" runat="server" CssClass="btn btn-sm btn-danger" ><i class="fas fa-times-circle"></i> | Decline</asp:LinkButton>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END Modal Body -->
                </div>
            </div>
        </asp:Panel>
                    <!-- END Table Styles Block -->
                  <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalBilty" runat="server" PopupControlID="pnlBilty" DropShadow="True" TargetControlID="btnOpenBilty"
                                    CancelControlID="lnkCloseBilty" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlBilty" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black; height: 600px; overflow-y: scroll" Width="1300px">

                                    <asp:Button ID="btnOpenBilty" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseBilty" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label6" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseBiltys" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseBiltys_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    <div class="row">
                                        <asp:Panel ID="Panel2" runat="server" class="col-md-12">
                                            <div id="divBiltyNotification" runat="server"></div>
                                            <div class="col-lg-12">
                                                <section class="box ">
                                                    <header class="panel_header">
                                                        <h2 class="title pull-left">Manual Bilty</h2>
                                                        <div class="actions panel_actions pull-right">
                                                            <%--<a class="box_toggle fa fa-chevron-down"></a>--%>
                                                        </div>
                                                    </header>
                                                    <div class="content-body">
                                                        <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                            <div class="row">

                                                                <div class="col-xs-8">
                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label class="form-label">Bilty No.</label>
                                                                            <div class="controls">
                                                                                <asp:TextBox ID="txtBiltyNo" runat="server" class="form-control"></asp:TextBox>
                                                                                <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label class="form-label">Bilty Date</label>
                                                                            <div class="controls">
                                                                                <asp:TextBox ID="txtBiltyDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                                                                                <asp:HiddenField ID="hfBiltyDate" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-4">
                                                                    <asp:LinkButton ID="lnkCancelledBilty" runat="server" CssClass="btn btn-danger pull-right m-t-25" ToolTip="Cancelled Bilty"><i class="fas fa-ban"></i></asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkCombinedBilty" runat="server" CssClass="btn btn-info pull-right m-r-10 m-t-25" ToolTip="Combined Bilty"><i class="fas fa-compress-arrows-alt"></i></asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkMergedBilty" runat="server" CssClass="btn btn-success pull-right m-r-10 m-t-25" ToolTip="Merged Bilty"><i class="fas fa-link"></i></asp:LinkButton>
                                                                </div>
                                                            </div>
                                                        </div>



                                                    </div>
                                                </section>
                                            </div>

                                            <div class="col-lg-12">
                                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                    <ContentTemplate>
                                                        <section class="box ">
                                                            <header class="panel_header">
                                                                <h2 class="title pull-left">Customer Information</h2>
                                                                <div class="actions panel_actions pull-right">
                                                                    <%--<a class="box_toggle fa fa-chevron-down"></a>--%>
                                                                </div>
                                                            </header>
                                                            <div class="content-body">
                                                                <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                                    <div class="row">
                                                                        <div id="divCustomerInfoNotification" style="margin-top: 10px;" runat="server"></div>
                                                                        <div class="col-xs-12 col-sm-4">
                                                                            <div class="form-group">
                                                                                <div class="controls">
                                                                                    <asp:DropDownList ID="ddlSearchSender" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                                                                    <%--<asp:TextBox ID="txtSearchSender" runat="server" class="form-control" placeholder="Search Consigner/Sender" AutoPostBack="true" OnTextChanged="txtSearchSender_TextChanged"></asp:TextBox>
                                                                                    <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCompanies"
                                                                                        MinimumPrefixLength="2"
                                                                                        CompletionListCssClass="list" 
	                                                                                    CompletionListItemCssClass="listitem" 
	                                                                                    CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                                        TargetControlID="txtSearchSender"
                                                                                        ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                                                                                    </ajaxToolkit:AutoCompleteExtender>--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>


                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Code</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtSenderCompanyCode" runat="server" placeholder="Code" class="form-control"></asp:TextBox>

                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Group</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtSenderGroup" runat="server" class="form-control" placeholder="Group"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Company</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtSenderCompany" runat="server" class="form-control" placeholder="Company"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Department</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtSenderDepartment" runat="server" class="form-control" placeholder="Department"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-4">
                                                                            <div class="form-group">

                                                                                <div class="controls">
                                                                                    <asp:DropDownList ID="ddlSearchReceiver" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                                                                    <%--<asp:TextBox ID="txtSearchReceiver" runat="server" class="form-control" placeholder="Search Consignee/Sender" AutoPostBack="true" OnTextChanged="txtSearchReceiver_TextChanged"></asp:TextBox>
                                                                                    <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCompanies"
                                                                                        MinimumPrefixLength="2"
                                                                                        CompletionListCssClass="list" 
	                                                                                    CompletionListItemCssClass="listitem" 
	                                                                                    CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                                        TargetControlID="txtSearchReceiver"
                                                                                        ID="AutoCompleteExtender3" runat="server" FirstRowSelected="false">
                                                                                    </ajaxToolkit:AutoCompleteExtender>--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>


                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Code</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtReceiverCompanyCode" runat="server" class="form-control" placeholder="Code"></asp:TextBox>

                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Group</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtReceiverGroup" runat="server" class="form-control" placeholder="Group"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Company</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtReceiverCompany" runat="server" class="form-control" placeholder="Company"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Department</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtReceiverDepartment" runat="server" class="form-control" placeholder="Department"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-4">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Bill To/Customer</label>--%>
                                                                                <div class="controls">

                                                                                    <asp:DropDownList ID="ddlSearchCustomer" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                                                                    <%--<asp:TextBox ID="txtSearchCustomer" runat="server" class="form-control" placeholder="Bill To/Customer" AutoPostBack="true" OnTextChanged="txtSearchCustomer_TextChanged"></asp:TextBox>
                                                                                    <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCompanies"
                                                                                        MinimumPrefixLength="2"
                                                                                        CompletionListCssClass="list" 
	                                                                                    CompletionListItemCssClass="listitem" 
	                                                                                    CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                                        TargetControlID="txtSearchCustomer"
                                                                                        ID="AutoCompleteExtender4" runat="server" FirstRowSelected="false">
                                                                                    </ajaxToolkit:AutoCompleteExtender>--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>


                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Code</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtCustomerCode" runat="server" class="form-control" placeholder="Code"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Group</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtCustomerGroup" runat="server" class="form-control" placeholder="Group"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Compnay</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtCustomerCompany" runat="server" class="form-control" placeholder="Company"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-2">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Department</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:TextBox ID="txtCustomerDepartment" runat="server" class="form-control" placeholder="Department"></asp:TextBox>
                                                                                    <%--<input type="text" class="form-control" name="formfield1">--%>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-sm-3">
                                                                            <div class="form-group">
                                                                                <%--<label class="form-label">Payment Type</label>--%>
                                                                                <div class="controls">
                                                                                    <asp:DropDownList ID="ddlBillingType" runat="server" CssClass="form-control">
                                                                                        <asp:ListItem>- Select Payment Type -</asp:ListItem>
                                                                                        <asp:ListItem>Vehicle Wise</asp:ListItem>
                                                                                        <asp:ListItem>Weight Wise</asp:ListItem>
                                                                                        <asp:ListItem Selected="True">Container Wise</asp:ListItem>
                                                                                        <asp:ListItem>Vehicle + Weight Wise</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <%--<div class="col-xs-12">
                                                                            <div class="pull-right ">
                                                                                <button type="submit" class="btn btn-success">Save</button>
                                                                                <button type="button" class="btn">Cancel</button>
                                                                            </div>
                                                                        </div>--%>
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
                                                        <h2 class="title pull-left">Shipping Information</h2>
                                                        <%--<div class="actions panel_actions pull-right">
                                                            <a class="box_toggle fa fa-chevron-down"></a>
                                                
                                                
                                                        </div>--%>
                                                    </header>
                                                    <div class="content-body">
                                                        <div id="general_validate" action="javascript:;" novalidate="novalidate">
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
                                                                            <asp:HiddenField ID="hfLoadingDate" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-3">
                                                                    <div class="form-group">
                                                                        <label class="form-label">Clearing Agent</label>
                                                                        <div class="controls">
                                                                            <asp:DropDownList ID="ddlClearingAgent" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>

                                            <div class="col-lg-12">
                                                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                                    <ContentTemplate>
                                                        <section class="box ">
                                                            <header class="panel_header">
                                                                <h2 class="title pull-left">Location Information</h2>
                                                                <%--<div class="actions panel_actions pull-right">
                                                                    <a class="box_toggle fa fa-chevron-down"></a>
                                                        
                                                        
                                                                </div>--%>
                                                            </header>
                                                            <div class="content-body">
                                                                <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                                    <div class="row">
                                                                        <div class="col-xs-2">
                                                                            <div class="form-group">
                                                                                <label class="form-label">Pick Location</label>
                                                                                <div class="controls">
                                                                                    <asp:DropDownList ID="ddlSearchPickLocation" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchPickLocation_SelectedIndexChanged"></asp:DropDownList>
                                                                                    <%--<asp:TextBox ID="txtSearchPickLocation" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtSearchPickLocation_TextChanged"></asp:TextBox>
                                                                                    <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchLocations"
                                                                                        MinimumPrefixLength="2"
                                                                                        CompletionListCssClass="list" 
	                                                                                    CompletionListItemCssClass="listitem" 
	                                                                                    CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                                        TargetControlID="txtSearchPickLocation"
                                                                                        ID="AutoCompleteExtender5" runat="server" FirstRowSelected="false">
                                                                                    </ajaxToolkit:AutoCompleteExtender>--%>
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
                                                                                    <asp:DropDownList ID="ddlSearchDropLocation" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchDropLocation_SelectedIndexChanged"></asp:DropDownList>
                                                                                    <%--<asp:TextBox ID="txtSearchDropLocation" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtSearchDropLocation_TextChanged"></asp:TextBox>
                                                                                    <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchLocations"
                                                                                    <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchLocations"
                                                                                        MinimumPrefixLength="2"
                                                                                        CompletionListCssClass="list" 
	                                                                                    CompletionListItemCssClass="listitem" 
	                                                                                    CompletionListHighlightedItemCssClass="hoverlistitem"
                                                                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                                                        TargetControlID="txtSearchDropLocation"
                                                                                        ID="AutoCompleteExtender6" runat="server" FirstRowSelected="false">
                                                                                    </ajaxToolkit:AutoCompleteExtender>--%>
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

                                            <div class="col-lg-12">
                                                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                                    <ContentTemplate>
                                                        <section class="box ">
                                                            <header class="panel_header">
                                                                <h2 class="title pull-left">Bilty Freight</h2>
                                                                <%--<div class="actions panel_actions pull-right">
                                                                    <a class="box_toggle fa fa-chevron-down"></a>
                                                        
                                                        
                                                                </div>--%>
                                                            </header>
                                                            <div class="content-body">
                                                                <div id="general_validate" action="javascript:;" novalidate="novalidate">
                                                                    <div class="row">
                                                                        <div class="col-xs-12">
                                                                            <div id="divBiltyFreightNotification" runat="server"></div>
                                                                            <div class="col-xs-3">
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Bilty Freight</label>
                                                                                    <div class="controls">
                                                                                        <asp:TextBox ID="txtBiltyFreight" runat="server" CssClass="form-control" TextMode="Number" AutoPostBack="true" OnTextChanged="txtBiltyFreight_TextChanged"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xs-3">
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Freight</label>
                                                                                    <div class="controls">
                                                                                        <asp:TextBox ID="txtFreight" runat="server" CssClass="form-control" TextMode="Number" AutoPostBack="true" OnTextChanged="txtFreight_TextChanged"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xs-3">
                                                                                <div class="form-group">
                                                                                    <label class="form-label">PartyCommision</label>
                                                                                    <div class="controls">
                                                                                        <asp:TextBox ID="txtPartyCommission" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
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

                                            <div class="col-lg-12">
                                                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
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
                                                                            <div id="divAdvanceInfoNotification" runat="server"></div>
                                                                            <div class="col-xs-2">
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Advance Freight</label>
                                                                                    <div class="controls">
                                                                                        <asp:TextBox ID="txtAdvanceFreight" runat="server" CssClass="form-control" TextMode="Number" AutoPostBack="true" OnTextChanged="txtAdvanceFreight_TextChanged"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xs-2">
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Factory Advance</label>
                                                                                    <div class="controls">
                                                                                        <asp:TextBox ID="txtFactoryAdvance" runat="server" CssClass="form-control" TextMode="Number" AutoPostBack="true" OnTextChanged="txtAdvanceFreight_TextChanged"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xs-2">
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Diesel</label>
                                                                                    <div class="controls">
                                                                                        <asp:TextBox ID="txtDieselAdvance" runat="server" CssClass="form-control" TextMode="Number" AutoPostBack="true" OnTextChanged="txtAdvanceFreight_TextChanged"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xs-2" id="divAdvanceVehicle" runat="server" visible="false">
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Adv. Amount</label>
                                                                                    <div class="controls">
                                                                                        <asp:TextBox ID="txtVehicleAdvanceAmount" runat="server" CssClass="form-control" TextMode="Number" AutoPostBack="true" OnTextChanged="txtAdvanceFreight_TextChanged"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xs-2">
                                                                                <div class="form-group">
                                                                                    <label class="form-label">Adv. Vehicle?</label>
                                                                                    <div class="controls">
                                                                                        <asp:CheckBox ID="cbAdvVehicle" runat="server" AutoPostBack="true" OnCheckedChanged="cbAdvVehicle_CheckedChanged" />
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
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCancelSaveBilty" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelSaveBilty_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkSaveBilty" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveBilty_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>

                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalBiltyVehicles" runat="server" PopupControlID="pnlBiltyVehicles" DropShadow="True" TargetControlID="btnOpenBiltyVehicles"
                                    CancelControlID="lnkCloseBiltyVehicles" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlBiltyVehicles" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="1200px">

                                    <asp:Button ID="btnOpenBiltyVehicles" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseBiltyVehicles" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="lblBiltyVehicleOrderID" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseBiltyVehicle" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseBiltyVehicle_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    <div class="row">
                                        <asp:Panel ID="pnlBiltyVehicleInputs" runat="server" class="col-md-12" Visible="false">
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Vehicle Type</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlVehicleType" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Vehicle Reg. No. </label>
                                                    <div class="controls">
                                                        <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlVehicleRegNo_SelectedIndexChanged" CssClass="form-control" ID="ddlVehicleRegNo">
                                                        </asp:DropDownList>
                                                        <%--<asp:TextBox ID="txtVehicleRegNo" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Vehicle Contact</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtVehicleContactNo" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Broker</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlBroker" Enabled="false" runat="server" CssClass="form-control select-chosen"></asp:DropDownList>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Driver</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtDriverName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Driver Father</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtDriverfather" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Driver NIC</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtDriverNIC" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">License</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtDriverLicense" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Contact No.</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtDriverContactNo" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Rate</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtVehicleRate" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                             <%--<div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Expenses Type</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlExpenses" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                             <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Expenses Amount</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtExpensesAmount" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>--%>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCancelAddingNewBilty" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelAddingNewBilty_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkSaveBiltyVehicles" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveBiltyVehicles_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div class="col-md-12">
                                            <div id="divVehicleInfoModalNotification" runat="server"></div>

                                            <asp:HiddenField ID="hfSelectedOrderVehicle" runat="server" />
                                            <asp:LinkButton CssClass="btn btn-info btn-xs pull-right" ID="lnkAddVechile" Visible="false" OnClick="lnkAddVechile_Click" runat="server"><i class="fas fa-plus"></i> | Add Vehicle</asp:LinkButton>
                                            <%--<asp:LinkButton ID="lnkAddNewBiltyVehicle" runat="server" CssClass="btn btn-xs btn-info pull-right m-b-10 m-r-10" OnClick="lnkAddNewBiltyVehicle_Click"><i class="fas fa-plus"></i> | Add New</asp:LinkButton>--%>
                                            <asp:GridView ID="gvBiltyVehicles" runat="server" Font-Size="12px" CssClass="table table-striped table-vcenter" AutoGenerateColumns="false" DataKeyNames="OrderVehicleID, Status, PaidToPay"
                                                EmptyDataText="No vehicle assigned to selected bilty" OnRowCommand="gvBiltyVehicles_RowCommand" OnRowDataBound="gvBiltyVehicles_RowDataBound">
                                                <Columns>
                                                    <asp:BoundField DataField="VehicleTypeName" HeaderText="Type" />
                                                    <asp:BoundField DataField="RegNo" HeaderText="Reg. No." />
                                                    <asp:BoundField DataField="VehicleContactNo" HeaderText="Vehicle Contact #" />
                                                    <asp:BoundField DataField="Broker" HeaderText="Broker" />
                                                    <asp:BoundField DataField="DriverName" HeaderText="Driver" />
                                                    <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                    <asp:BoundField DataField="DriverCellNo" HeaderText="Contact" />
                                                    <asp:TemplateField HeaderText="Update">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-xs btn-info" Enabled="true" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Change"><i class="fas fa-edit"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Wipe"><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>


                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalContainers" runat="server" PopupControlID="pnlBiltyContainers" DropShadow="True" TargetControlID="btnOpenBiltyContainers"
                                    CancelControlID="lnkCloseBiltyContainers" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlBiltyContainers" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="1300px">

                                    <asp:Button ID="btnOpenBiltyContainers" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseBiltyContainers" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label1" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseBiltyContainer" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseBiltyContainer_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCloseContainerExpense" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseContainerExpense_Click" Visible="false"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCloseContainerReceiving" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseContainerReceiving_Click" Visible="false"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    <div class="row">
                                        <asp:Panel ID="pnlBiltyContainerInputs" runat="server" class="col-md-12" Visible="false">
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Container Type</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlContainerType" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Container No.</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtContainerNo" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Weight</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtWeight" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Container Pickup</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlContainerPickup" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Container Dropoff</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlContainerDropoff" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Rate</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtContainerRate" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Assigned to</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlAssignedVehicle" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12">
                                                <div class="form-group">
                                                    <label class="form-label">Remarks</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtContainerRemarks" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="12" Rows="2"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCancelSaveBiltyContainer" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelSaveBiltyContainer_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkSaveBiltyContainer" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveBiltyContainer_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div id="divContainerNotifications" runat="server"></div>
                                        <div id="divContainerDetails" runat="server" class="col-md-12">

                                            <asp:HiddenField ID="hfSelectedOrderContainer" runat="server" />
                                            <asp:HiddenField ID="hfSelectedCotnainerReceiving" runat="server" />
                                            <%--<asp:LinkButton ID="lnkAddNewContainer" runat="server" CssClass="btn btn-xs btn-info pull-right m-b-10 m-r-10" OnClick="lnkAddNewContainer_Click"><i class="fa fa-plus"></i> | Add New</asp:LinkButton>--%>
                                            <asp:GridView ID="gvContainer" runat="server" Font-Size="10px" CssClass="table table-striped table-vcenter" AutoGenerateColumns="false"
                                                EmptyDataText="No container assigned to selected bilty" OnRowCommand="gvContainer_RowCommand" DataKeyNames="OrderConsignmentID, Status" OnRowDataBound="gvContainer_RowDataBound">
                                                <Columns>
                                                    <asp:BoundField DataField="ContainerTypeName" HeaderText="Container" />
                                                    <asp:BoundField DataField="ContainerNo" HeaderText="Container #" />
                                                    <asp:BoundField DataField="ContainerWeight" HeaderText="Weight" />
                                                    <asp:BoundField DataField="EmptyContainerDropLocation" HeaderText="Drop Location" />
                                                    <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                    <asp:TemplateField HeaderText="Expenses">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkExpenses" runat="server" ToolTip="Click to Add/View Expenses" CommandName="Expenses" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-money"></i></asp:LinkButton>
                                                            |
                                                            <asp:Label ID="lblTotalExpense" runat="server" Text='<%# Eval("Expenses") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Update">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkEditContainer" runat="server" CssClass="btn btn-xs btn-info" ToolTip="Click to Edit" CommandName="Change" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-edit"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lnkDeleteContainert" runat="server" CssClass="btn btn-xs btn-danger" ToolTip="Click to Delete" Visible="false" CommandName="Wipe" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>

                                        <asp:Panel ID="pnlContainerExpensesInput" runat="server" class="col-md-12" Visible="false">
                                            <div class="col-xs-12 col-sm-3">
                                                <div class="form-group">
                                                    <label class="form-label">Container</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlExpenseContainer" runat="server" CssClass="form-control" Enabled="false"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3">
                                                <div class="form-group">
                                                    <label class="form-label">Expense Type</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlExpenseType" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3">
                                                <div class="form-group">
                                                    <label class="form-label">Amount</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtExpenseAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCancelSaveContainerExpense" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelSaveContainerExpense_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkSaveContainerExpense" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveContainerExpense_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div id="divContExpensesNotification" runat="server"></div>
                                        <div id="divContainerExpense" runat="server" class="col-md-12" visible="false">
                                            <asp:LinkButton ID="lnkAddExpense" runat="server" CssClass="btn btn-primary btn-xs pull-right m-b-10" OnClick="lnkAddExpense_Click"><i class="fa fa-plus-square"></i> | Add Expense</asp:LinkButton>
                                            <asp:HiddenField ID="hfContainerExpense" runat="server" />
                                            <asp:GridView ID="gvContainerExpense" runat="server" Font-Size="10px" CssClass="table table-hover" AutoGenerateColumns="false"
                                                EmptyDataText="No container assigned to selected bilty" DataKeyNames="ContainerExpenseID" OnRowCommand="gvContainerExpense_RowCommand">
                                                <Columns>
                                                    <asp:BoundField DataField="ContainerNo" HeaderText="Container #" />
                                                    <asp:BoundField DataField="ExpensesTypeName" HeaderText="Expense" />
                                                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                                    <asp:TemplateField HeaderText="Update">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkEditContainerExpense" runat="server" CssClass="btn btn-xs btn-info" ToolTip="Click to Edit this Container Expense" CommandName="Change" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-edit"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lnkDeleteContainertExpense" runat="server" CssClass="btn btn-xs btn-danger" ToolTip="Click to Delete" CommandName="Remove" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>


                                    </div>

                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalProducts" runat="server" PopupControlID="pnlBiltyProducts" DropShadow="True" TargetControlID="btnOpenBiltyProducts"
                                    CancelControlID="lnkCloseBiltyProducts" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlBiltyProducts" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="1200px">

                                    <asp:Button ID="btnOpenBiltyProducts" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseBiltyProducts" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label2" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseBiltyProduct" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCancleSaveProductReceiving_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    <div class="row">
                                        <asp:Panel ID="pnlBiltyProductInputs" runat="server" class="col-md-12" Visible="false">
                                            <div class="col-xs-12 col-sm-3">
                                                <div class="form-group">
                                                    <label class="form-label">Search</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtSearchProducts" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <%--<ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"></ajaxToolkit:AutoCompleteExtender>--%>
                                                        <%--<ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchProducts"
                                                            MinimumPrefixLength="2"
                                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                            TargetControlID="txtSearchProducts"
                                                            ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false">
                                                        </ajaxToolkit:AutoCompleteExtender>--%>

                                                        <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchProducts"
                                                            MinimumPrefixLength="2"
                                                            CompletionListCssClass="list"
                                                            CompletionListItemCssClass="listitem"
                                                            CompletionListHighlightedItemCssClass="hoverlistitem"
                                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                            TargetControlID="txtSearchProducts"
                                                            ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
                                                        </ajaxToolkit:AutoCompleteExtender>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3">
                                                <div class="form-group">
                                                    <label class="form-label">Item</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlProductItem" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlProductItem_SelectedIndexChanged"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Package Type</label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlPackageType" runat="server" CssClass="form-control" Enabled="false"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Qty</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtProductQantity" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Weight</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtProductWeight" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3">
                                                <div class="form-group">
                                                    <label class="form-label">Freight</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtRate" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCancelAddingProduct" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelAddingProduct_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkAddProduct" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkAddProduct_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div class="col-md-12">
                                            <div id="divProductNotification" runat="server"></div>
                                            <asp:HiddenField ID="hfCustomerCompanyID" runat="server" />
                                            <asp:HiddenField ID="hfSelectedProductID" runat="server" />

                                            <asp:GridView ID="gvProduct" runat="server" Font-Size="10px" CssClass="table table-hover" AutoGenerateColumns="false"
                                                EmptyDataText="No Product assigned to selected bilty" OnRowDataBound="gvProduct_RowDataBound" OnRowCommand="gvProduct_RowCommand" DataKeyNames="OrderProductID,ReceivedOrNot,ProductRate">
                                                <Columns>
                                                    <asp:BoundField DataField="Name" HeaderText="Product" />
                                                    <asp:BoundField DataField="PackageTypeName" HeaderText="Packaging" />
                                                    <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                                                    <asp:BoundField DataField="TotalWeight" HeaderText="Weight" />
                                                    <asp:TemplateField HeaderText="Receiving">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddlReceiving" runat="server" CssClass="form-control" Font-Size="12px" AutoPostBack="true" OnSelectedIndexChanged="ddlReceiving_SelectedIndexChanged">
                                                                <asp:ListItem>Pending</asp:ListItem>
                                                                <asp:ListItem>Received</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Update">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-xs btn-info" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Change"><i class="fas fa-edit"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Wipe"><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>


                                        <asp:Panel ID="pnlRecieveGrid" runat="server" class="col-md-12" Visible="false">

                                            <asp:GridView ID="gvProductDocuments" runat="server">
                                            </asp:GridView>

                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancleSaveProductReceiving_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveProductReceiving_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCancleSaveProductReceiving" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancleSaveProductReceiving_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkSaveProductReceiving" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveProductReceiving_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>


                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalRecievings" runat="server" PopupControlID="pnlBiltyRecievings" DropShadow="True" TargetControlID="btnOpenBiltyRecievings"
                                    CancelControlID="lnkCloseBiltyRecievings" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlBiltyRecievings" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="1300px">

                                    <asp:Button ID="btnOpenBiltyRecievings" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseBiltyRecievings" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label3" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseBiltyRecieving" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseBiltyRecieving_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    <div class="row">
                                        <asp:Panel ID="pnlRecievingInputs" runat="server" class="col-md-12" Visible="false">
                                            <asp:HiddenField runat="server" ID="hfOrderProductID" />
                                            <div class="col-xs-12 col-sm-4">
                                                <div class="form-group">
                                                    <label class="form-label">Received By</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtOrderReceivedBy" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4">
                                                <div class="form-group">
                                                    <label class="form-label">Receiving Date</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtOrderReceivingDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4">
                                                <div class="form-group">
                                                    <label class="form-label">Receiving Time</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtOrderReceivingTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCacnelAddingReceiving" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCacnelAddingReceiving_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkAddReceiving" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkAddReceiving_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div class="col-md-12">
                                            <div id="divRecievingNotification" runat="server"></div>

                                            <asp:HiddenField ID="hfSelectedReceiving" runat="server" />
                                            <asp:LinkButton ID="lnkAddNewRecieving" runat="server" CssClass="btn btn-xs btn-info pull-right m-b-10 m-r-10" OnClick="lnkAddNewRecieving_Click"><i class="fas fa-plus"></i> | Add New</asp:LinkButton>
                                            <asp:GridView ID="gvRecievings" runat="server" Font-Size="10px" CssClass="table table-striped table-vcenter" AutoGenerateColumns="false"
                                                EmptyDataText="No reciepts of selected bilty" OnRowCommand="gvRecievings_RowCommand" DataKeyNames="ConsignmentReceiverID">
                                                <Columns>
                                                    <asp:BoundField DataField="ReceivedBy" HeaderText="Receiver" />
                                                    <asp:BoundField DataField="ReceivedDateTime" HeaderText="Receivied On" />
                                                    <asp:TemplateField HeaderText="Update">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-xs btn-info" CommandName="Change" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-edit"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandName="Wipe" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>


                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalAdvances" runat="server" PopupControlID="pnlAdvances" DropShadow="True" TargetControlID="btnOpenAdvances"
                                    CancelControlID="lnkCloseAdvances" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlAdvances" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="1200px">

                                    <asp:Button ID="btnOpenAdvances" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseAdvances" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label14" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseAdvancess" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseAdvancess_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    <div class="row">
                                        <asp:Panel ID="pnl" runat="server" class="col-md-12">
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Advance Friehgt</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtAdvancefrei" runat="server" CssClass="form-control" OnTextChanged="SumAllAdvances" AutoPostBack="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Factory Advance</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtFactAdvance" runat="server" CssClass="form-control" OnTextChanged="SumAllAdvances" AutoPostBack="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Diesel</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtDiesAdvance" runat="server" CssClass="form-control" OnTextChanged="SumAllAdvances" AutoPostBack="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2">
                                                <div class="form-group">
                                                    <label class="form-label">Advance from Vehicle</label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtVehicAdvance" runat="server" CssClass="form-control" OnTextChanged="SumAllAdvances" AutoPostBack="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4">
                                                <div class="form-group">
                                                    <label>Total</label>
                                                    <h3>
                                                        <asp:Label ID="lblTotAdvance" runat="server"></asp:Label></h3>
                                                </div>
                                            </div>
                                            <div id="divAdvancesNotification" runat="server"></div>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCancelSaveAdvances" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelSaveAdvances_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkSaveAdvances" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveAdvances_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>

                                        </asp:Panel>
                                        <div class="col-md-12">


                                            <asp:HiddenField ID="HiddenField2" runat="server" />

                                            <%--<asp:GridView ID="GridView1" runat="server" Font-Size="12px" CssClass="table table-hover" AutoGenerateColumns="false" 
                                                EmptyDataText="No vehicle assigned to selected bilty" OnRowCommand="gvBiltyVehicles_RowCommand" OnRowDataBound="gvBiltyVehicles_RowDataBound" DataKeyNames="OrderVehicleID, Status">
                                                <Columns>
                                                    <asp:BoundField DataField="VehicleType" HeaderText="Type" />
                                                    <asp:BoundField DataField="VehicleRegNo" HeaderText="Reg. No." />
                                                    <asp:BoundField DataField="VehicleContactNo" HeaderText="Vehicle Contact #" />
                                                    <asp:BoundField DataField="Broker" HeaderText="Broker" />
                                                    <asp:BoundField DataField="DriverName" HeaderText="Driver" />
                                                    <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                    <asp:BoundField DataField="DriverCellNo" HeaderText="Contact" />
                                                    <asp:TemplateField HeaderText="Update">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-xs btn-info" Enabled="false" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Change"><i class="fas fa-edit"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Wipe"><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>--%>
                                        </div>
                                    </div>


                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalAdvances2" runat="server" PopupControlID="pnlAdvances2" DropShadow="True" TargetControlID="btnOpenAdvances2"
                                    CancelControlID="lnkCloseAdvance2" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlAdvances2" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="1200px">

                                    <asp:Button ID="btnOpenAdvances2" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseAdvance2" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label15" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseAdvances2" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseAdvances2_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    <div class="row">
                                        <asp:Panel ID="pnlAdvanceInput" runat="server" class="col-md-12" Visible="false">
                                            <div class="col-md-4 pull-left">
                                                <label>Advance Type</label>
                                                <asp:RadioButtonList ID="rbAdvanceTypes" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rbAdvanceTypes_SelectedIndexChanged">
                                                    <asp:ListItem>Advance Freight</asp:ListItem>
                                                    <asp:ListItem>Factory Advance</asp:ListItem>
                                                    <asp:ListItem>Diesel Advance</asp:ListItem>
                                                    <asp:ListItem>Vehicle Advance</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="col-md-6 pull-left" style="border-left: 1px solid black;">
                                                <div class="form-group col-md-6" id="AdvanceAmountPlaceholder" runat="server">
                                                    <label>Amount</label>
                                                    <asp:TextBox ID="txtAdvanceAmount" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-6" id="PatrolPumpAdvancePlaceholder" runat="server" visible="false">
                                                    <label>Patrol Pump</label>
                                                    <asp:DropDownList ID="ddlPatrolPumps" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-6" id="PatrolRatePlaceholder" runat="server" visible="false">
                                                    <label>Rate per Litre</label>
                                                    <asp:TextBox ID="txtPatrolRate" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-6" id="PatrolLitrePlaceholder" runat="server" visible="false">
                                                    <label>Litres</label>
                                                    <asp:TextBox ID="txtPatrolLitre" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group" id="VehicleAdvancePlaceholder" runat="server" visible="false">
                                                    <label>Vehicle</label>
                                                    <asp:TextBox ID="txtAdvanceVehicleFrom" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCancelSaveAdvances2" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelSaveAdvances2_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkSaveAdvances2" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveAdvances2_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:LinkButton ID="lnkAddAdvance2" runat="server" CssClass="btn btn-info pull-right" OnClick="lnkAddAdvance2_Click"><i class="fas fa-plus-square"></i></asp:LinkButton>
                                            <h4 class="pull-left">Total:
                                                <asp:Label ID="lblTotalAdvances" runat="server"></asp:Label></h4>
                                        </div>
                                        <div id="divAdvances2Notification" runat="server"></div>

                                        <asp:Panel ID="Panel7" runat="server" class="col-md-12">

                                            <asp:GridView ID="gvAdvances2" runat="server" CssClass="table table-striped table-vcenter" AutoGenerateColumns="false"
                                                OnRowDataBound="gvAdvances2_RowDataBound" OnRowCommand="gvAdvances2_RowCommand" DataKeyNames="AdvanceID">
                                                <Columns>
                                                    <asp:BoundField DataField="AdvanceID" HeaderText="ID" />
                                                    <asp:BoundField DataField="AdvanceAgainst" HeaderText="Type" />
                                                    <asp:BoundField DataField="AdvanceAmount" HeaderText="Amount" />
                                                    <asp:BoundField DataField="PatrolPump" HeaderText="Fuel Station" />
                                                    <asp:BoundField DataField="PatrolRate" HeaderText="Rate/Ltr" />
                                                    <asp:BoundField DataField="PatrolLitres" HeaderText="Litres" />
                                                    <asp:BoundField DataField="CreatedDate" HeaderText="Date" />
                                                    <%--<asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkVoucher" runat="server" CssClass="btn btn-xs btn-secondary" Enabled="false" ToolTip="Cannnot make its voucher" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Voucher"><i class="fas fa-receipt"></i> | Voucher</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Wipe"><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </asp:Panel>
                                        <div class="col-md-12">


                                            <asp:HiddenField ID="HiddenField3" runat="server" />

                                            <%--<asp:GridView ID="GridView1" runat="server" Font-Size="12px" CssClass="table table-hover" AutoGenerateColumns="false" 
                                                EmptyDataText="No vehicle assigned to selected bilty" OnRowCommand="gvBiltyVehicles_RowCommand" OnRowDataBound="gvBiltyVehicles_RowDataBound" DataKeyNames="OrderVehicleID, Status">
                                                <Columns>
                                                    <asp:BoundField DataField="VehicleType" HeaderText="Type" />
                                                    <asp:BoundField DataField="VehicleRegNo" HeaderText="Reg. No." />
                                                    <asp:BoundField DataField="VehicleContactNo" HeaderText="Vehicle Contact #" />
                                                    <asp:BoundField DataField="Broker" HeaderText="Broker" />
                                                    <asp:BoundField DataField="DriverName" HeaderText="Driver" />
                                                    <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                    <asp:BoundField DataField="DriverCellNo" HeaderText="Contact" />
                                                    <asp:TemplateField HeaderText="Update">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-xs btn-info" Enabled="false" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Change"><i class="fas fa-edit"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Wipe"><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>--%>
                                        </div>
                                    </div>


                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <%--New Expenses--%>
                         <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalExpenses" runat="server" PopupControlID="pnlExpneses" DropShadow="True" TargetControlID="btnOpenExpenses"
                                    CancelControlID="lnkCloseExpense" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlExpneses" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="1200px">

                                    <asp:Button ID="btnOpenExpenses" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseExpense" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label16" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseExpenses" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseExpenses_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    <div class="row">
                                        <asp:Panel ID="pnlExpensesInput" runat="server" class="col-md-12" Visible="false">
                                            <div class="col-md-4 pull-left">
                                                <label>Expenses Type</label>
                                                 <asp:DropDownList ID="ddlExpenses" runat="server" CssClass="form-control"></asp:DropDownList>                                                
                                            </div>
                                            <div class="col-md-6 pull-left" style="border-left: 1px">
                                                <div class="form-group col-md-6" id="ExpensesAmountPlaceholder" runat="server">
                                                    <label>Amount</label>
                                                    <asp:TextBox ID="txtExpensesAmount" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                                </div>
                                                
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <asp:LinkButton ID="lnkCancelSaveExpenses" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelSaveExpenses_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkSaveExpenses" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveExpenses_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:LinkButton ID="lnkAddExpenses" runat="server" CssClass="btn btn-info pull-right" OnClick="lnkAddExpenses_Click"><i class="fas fa-plus-square"></i></asp:LinkButton>
                                            <h4 class="pull-left">Total:
                                                <asp:Label ID="lblTotalExpenses" runat="server"></asp:Label></h4>
                                        </div>
                                        <div id="divExpensesNotification" runat="server"></div>

                                        <asp:Panel ID="Panel9" runat="server" class="col-md-12">

                                            <asp:GridView ID="gvExpenses" runat="server" CssClass="table table-striped table-vcenter" AutoGenerateColumns="false"
                                                OnRowDataBound="gvExpenses_RowDataBound" OnRowCommand="gvExpenses_RowCommand" DataKeyNames="OrderExpenseID,OrderID">
                                                <Columns>
                                                    <asp:BoundField DataField="ExpensesTypeName" HeaderText="Expenses" />
                                                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                                   
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="DeleteExpenses"><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </asp:Panel>
                                        <div class="col-md-12">


                                            <asp:HiddenField ID="HiddenField4" runat="server" />

                                            <%--<asp:GridView ID="GridView1" runat="server" Font-Size="12px" CssClass="table table-hover" AutoGenerateColumns="false" 
                                                EmptyDataText="No vehicle assigned to selected bilty" OnRowCommand="gvBiltyVehicles_RowCommand" OnRowDataBound="gvBiltyVehicles_RowDataBound" DataKeyNames="OrderVehicleID, Status">
                                                <Columns>
                                                    <asp:BoundField DataField="VehicleType" HeaderText="Type" />
                                                    <asp:BoundField DataField="VehicleRegNo" HeaderText="Reg. No." />
                                                    <asp:BoundField DataField="VehicleContactNo" HeaderText="Vehicle Contact #" />
                                                    <asp:BoundField DataField="Broker" HeaderText="Broker" />
                                                    <asp:BoundField DataField="DriverName" HeaderText="Driver" />
                                                    <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                    <asp:BoundField DataField="DriverCellNo" HeaderText="Contact" />
                                                    <asp:TemplateField HeaderText="Update">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-xs btn-info" Enabled="false" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Change"><i class="fas fa-edit"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Wipe"><i class="fas fa-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>--%>
                                        </div>
                                    </div>


                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <%--End Expenses--%>



                        <%--<asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>--%>
                        <ajaxToolkit:ModalPopupExtender ID="modalRecievingDocs" runat="server" PopupControlID="pnlBiltyRecievingDocs" DropShadow="True" TargetControlID="btnOpenBiltyRecievingDocs"
                            CancelControlID="lnkCloseBiltyRecievingDocs" BackgroundCssClass="modalBackground">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pnlBiltyRecievingDocs" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="1300px">

                            <asp:Button ID="btnOpenBiltyRecievingDocs" runat="server" Style="display: none" />
                            <asp:LinkButton ID="lnkCloseBiltyRecievingDocs" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                            <h4 class="pull-left">
                                <asp:Label ID="Label4" runat="server"></asp:Label></h4>
                            <asp:LinkButton ID="lnkCloseBiltyRecievingDoc" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseBiltyRecievingDoc_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                            <div class="row">
                                <asp:Panel ID="pnlRecievingDocInputs" runat="server" class="col-md-12" Visible="false">
                                    <div class="col-xs-12 col-sm-4">
                                        <div class="form-group">
                                            <label class="form-label">Document Type</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlDocumentType" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4">
                                        <div class="form-group">
                                            <label class="form-label">Document No. </label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtDocumentNo" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4">
                                        <div class="form-group">
                                            <label class="form-label">Document</label>
                                            <div class="controls">
                                                <asp:FileUpload ID="fuReceivingDocument" runat="server" />
                                            </div>
                                        </div>
                                        <div id="hfReceivingDocNotification" runat="server"></div>

                                    </div>
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <div class="controls">
                                                <asp:LinkButton ID="lnkCancelAddingReceivingDoc" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelAddingReceivingDoc_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                <asp:LinkButton ID="lnkAddReceivingDoc" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkAddReceivingDoc_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <div class="col-md-12">
                                    <asp:HiddenField ID="hfSelectedRecievingDocID" runat="server" />
                                    <asp:HiddenField ID="hfReceivingDocumentName" runat="server" />
                                    <asp:LinkButton ID="lnkAddNewRecievingDoc" runat="server" CssClass="btn btn-xs btn-info pull-right m-b-10 m-r-10" OnClick="lnkAddNewRecievingDoc_Click"><i class="fas fa-plus"></i> | Add New</asp:LinkButton>
                                    <asp:GridView ID="gvRecievingDoc" runat="server" Font-Size="10px" CssClass="table table-hover" AutoGenerateColumns="false"
                                        EmptyDataText="No reciept document of selected bilty" OnRowCommand="gvRecievingDoc_RowCommand" DataKeyNames="OrderReceivedDocumentID">
                                        <Columns>
                                            <asp:BoundField DataField="DocumentType" HeaderText="Type" />
                                            <asp:BoundField DataField="DocumentNo" HeaderText="Documnet #" />
                                            <asp:BoundField DataField="DocumentName" HeaderText="Name" />
                                            <asp:BoundField DataField="DocumentPath" HeaderText="Path" />
                                            <asp:TemplateField HeaderText="Update">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-xs btn-info" CommandName="Change" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-edit"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete" Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandName="Wipe" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-trash"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>


                        </asp:Panel>
                        <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>

                        <%--<asp:UpdatePanel ID="UpdatePanel7" runat="server">
                            <ContentTemplate>--%>
                        <ajaxToolkit:ModalPopupExtender ID="modalDamages" runat="server" PopupControlID="pnlBiltyDamages" DropShadow="True" TargetControlID="btnOpenBiltyDamages"
                            CancelControlID="lnkCloseBiltyDamages" BackgroundCssClass="modalBackground">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pnlBiltyDamages" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black;" Width="1300px">

                            <asp:Button ID="btnOpenBiltyDamages" runat="server" Style="display: none" />
                            <asp:LinkButton ID="lnkCloseBiltyDamages" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                            <h4 class="pull-left">
                                <asp:Label ID="Label5" runat="server"></asp:Label></h4>
                            <asp:LinkButton ID="lnkCloseBiltyDamage" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseBiltyDamage_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                            <div class="row">
                                <asp:Panel ID="pnlDamageInputs" runat="server" class="col-md-12" Visible="false">
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label class="form-label">Item</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlDamageItem" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label class="form-label">Damage Type</label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlDamageType" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <div class="form-group">
                                            <label class="form-label">Damage Cost</label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtDamageCost" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <div class="form-group">
                                            <label class="form-label">Damage Cause</label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtDamageCause" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <div class="form-group">
                                            <label class="form-label">Damage Document</label>
                                            <div class="controls">
                                                <asp:FileUpload ID="fuDamageDocument" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <div class="controls">
                                                <asp:LinkButton ID="lnkCancelSaveBiltyDamages" runat="server" CssClass="btn btn-danger pull-right m-b-10" OnClick="lnkCancelSaveBiltyDamages_Click"><i class="fas fa-times"></i> | Cancel</asp:LinkButton>
                                                <asp:LinkButton ID="lnkSaveBiltyDamages" runat="server" CssClass="btn btn-primary pull-right m-b-10 m-r-10" OnClick="lnkSaveBiltyDamages_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <div class="col-md-12">
                                    <div id="divDamageNotification" runat="server"></div>

                                    <asp:HiddenField ID="hfSelectedDamageID" runat="server" />
                                    <asp:HiddenField ID="hfDamageDocument" runat="server" />
                                    <asp:LinkButton ID="lnkAddNewDamage" runat="server" CssClass="btn btn-xs btn-info pull-right m-b-10 m-r-10" OnClick="lnkAddNewDamage_Click"><i class="fas fa-plus"></i> | Add New</asp:LinkButton>
                                    <asp:GridView ID="gvDamage" runat="server" Font-Size="10px" CssClass="table table-hover"
                                        EmptyDataText="No reciept document of selected bilty" OnRowCommand="gvDamage_RowCommand" DataKeyNames="OrderDamageID" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="ItemName" HeaderText="Item" />
                                            <asp:BoundField DataField="DamageType" HeaderText="Damage Type" />
                                            <asp:BoundField DataField="DamageCost" HeaderText="Cost" />
                                            <asp:BoundField DataField="DamageCause" HeaderText="Damage Cause" />
                                            <asp:BoundField DataField="DamageDocumentName" HeaderText="Image" />
                                            <asp:TemplateField HeaderText="Update">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-xs btn-info" CommandName="Change" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-edit"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandName="Wipe" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-trash"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                        </asp:Panel>
                        <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>

                        <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalBiltyPrint" runat="server" PopupControlID="pnlBiltyPrint" DropShadow="True" TargetControlID="btnOpenBiltyPrint"
                                    CancelControlID="lnkCloseBiltyPrint" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlBiltyPrint" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black; height: 600px; overflow-y: scroll" Width="1300px">

                                    <asp:Button ID="btnOpenBiltyPrint" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseBiltyPrint" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label8" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseBiltyPrints" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseBills_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    <div id="div2" runat="server"></div>
                                    <h2>Invoice</h2>

                                    <asp:Panel ID="Panel3" runat="server" CssClass="col-xs-12" Visible="false">
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group">
                                                <label class="form-label">Keyword</label>
                                                <div class="controls">
                                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group">
                                                <div class="controls">
                                                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-info m-t-40" OnClick="lnkAddContainers_Click"><i class="fas fa-plus-square"></i></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel4" runat="server" CssClass="col-xs-12">
                                        <!-- start -->
                                        <header class="clearfix">
                                            <div id="logo">
                                                <img src="../assets/images/MZBLogo.png" style="width: 15%;">
                                                <img src="../assets/images/MZBLogo2.png" style="width: 33%; float: right;">
                                            </div>
                                            <h1>Customer Bill</h1>
                                            <div id="company" class="col-lg-6 col-md-6 col-xs-6 pull-right">
                                                <div style="text-align: right;">
                                                    <asp:Label ID="lblBillToCompany" runat="server"></asp:Label>
                                                </div>
                                                <div style="text-align: right;">
                                                    <asp:Label ID="lblBilltoAddress" runat="server"></asp:Label>
                                                </div>
                                                <div style="text-align: right;">
                                                    <asp:Label ID="lblContact" runat="server"></asp:Label>
                                                </div>
                                                <div style="text-align: right;">
                                                    <asp:Label ID="lblBilltoEmail" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div id="project" class="col-lg-6 col-md-6 col-xs-6 pull-left">
                                                <div>
                                                    <span class="heading">BILTY#</span>
                                                    <asp:Label ID="lblBiltyNo" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <span class="heading">TRUCK</span>
                                                    <asp:Label ID="lblVehicleRegNo" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <span class="heading">FROM</span>
                                                    <asp:Label ID="lblFrom" runat="server"></asp:Label>
                                                    <span>TO</span>
                                                    <asp:Label ID="lblTo" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <span class="heading">SENDER</span>
                                                    <asp:Label ID="lblSenderCompany" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <span class="heading">RECEIVER</span>
                                                    <asp:Label ID="lblReceiverCompany" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <span class="heading">DATE</span>
                                                    <asp:Label ID="lblBiltyDate" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <span class="heading">BROKER</span>
                                                    <asp:Label ID="lblBroker" runat="server"></asp:Label>
                                                </div>

                                            </div>
                                        </header>
                                        <main>
                                            <table class="table table-hover">
                                                <thead id="tblDescriptionHead" runat="server">
                                                    <tr>
                                                        <th class="service">Nos.</th>
                                                        <th class="desc">DESCRIPTION</th>
                                                        <th>Weight</th>
                                                        <%--<th>Freight</th>--%>
                                                    </tr>
                                                </thead>
                                                <tbody id="tblDescriptionBody" runat="server">
                                                    <tr>
                                                        <td class="service">1 X 46</td>
                                                        <td class="desc">Container Export</td>
                                                        <td class="unit"></td>
                                                        <td class="qty"></td>
                                                        <td class="total"></td>
                                                        <td class="total"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" style="text-align: right">Shipping Line</td>
                                                        <td colspan="2" class="total"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" style="text-align: right">Address</td>
                                                        <td colspan="2" class="total">Gat#1, Old Truck adda, Mauripur, Karachi</td>
                                                    </tr>
                                                </tbody>

                                                <asp:HiddenField ID="hfBalance" runat="server" />
                                            </table>
                                            <table style="width: 100%">
                                                <%--<tr id="trTotalAdvance" runat="server" visible="false">
                                                    <td colspan="3"></td>
                                                    
                                                    <td style="text-align: right;"><h4>Total Advance: <asp:Label ID="lblTotalAdvance" runat="server"></asp:Label></h4></td>
                                                </tr>--%>
                                                <tr id="trBalance" runat="server" visible="false">
                                                    <td colspan="3"></td>
                                                    <td style="text-align: right;">
                                                        <h4>Balance:
                                                            <asp:Label ID="lblBalance" runat="server"></asp:Label></h4>
                                                    </td>
                                                </tr>
                                                <tr id="trPaid" runat="server">
                                                    <td colspan="3"></td>
                                                    <td style="text-align: right;">
                                                        <h4>Paid</h4>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Label ID="lblPaidtoPay" runat="server" Style="display: none;"></asp:Label>
                                            <div id="notices">
                                                <div>NOTICE:</div>
                                                <div class="notice">Contact transportation company or broker in case of debris.</div>
                                            </div>
                                        </main>
                                        <footer>
                                            Invoice was created on a computer and is valid without the signature and seal.
                                       
                                        </footer>
                                        <!-- end -->
                                        <a href="#" onclick="Print(); return false;" class="btn btn-purple btn-md"><i class="fa fa-print"></i>&nbsp; Print </a>
                                    </asp:Panel>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalInvoicePrint" runat="server" PopupControlID="pnlInvoicePrint" DropShadow="True" TargetControlID="btnOpenInvoicePrint"
                                    CancelControlID="lnkCloseInvoicePrint" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlInvoicePrint" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black; height: 600px; overflow-y: scroll" Width="1300px">

                                    <asp:Button ID="btnOpenInvoicePrint" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseInvoicePrint" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label9" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseInvoicePrints" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseInvoicePrints_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    <div id="div3" runat="server"></div>
                                    <h2>Invoice</h2>

                                    <asp:Panel ID="Panel5" runat="server" CssClass="col-xs-12" Visible="false">
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group">
                                                <label class="form-label">Keyword</label>
                                                <div class="controls">
                                                    <asp:CheckBoxList ID="CheckBoxList2" runat="server"></asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group">
                                                <div class="controls">
                                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-info m-t-40" OnClick="lnkAddContainers_Click"><i class="fas fa-plus-square"></i></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel6" runat="server" CssClass="col-xs-12">
                                        <!-- start -->
                                        <header class="clearfix">
                                            <div id="logo">
                                                <img src="../assets/images/MZBLogo.png" style="width: 15%;">
                                                <img src="../assets/images/MZBLogo2.png" style="width: 33%; float: right;">
                                            </div>
                                            <h1>Customer Invoice</h1>
                                            <div id="company" class="col-lg-6 col-md-6 col-xs-6 pull-right">
                                                <div style="text-align: right;">
                                                    <asp:Label ID="Label10" runat="server"></asp:Label>
                                                </div>
                                                <div style="text-align: right;">
                                                    <asp:Label ID="Label11" runat="server"></asp:Label>
                                                </div>
                                                <div style="text-align: right;">
                                                    <asp:Label ID="Label12" runat="server"></asp:Label>
                                                </div>
                                                <div style="text-align: right;">
                                                    <asp:Label ID="Label13" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div id="project" class="col-lg-6 col-md-6 col-xs-6 pull-left">
                                                <div>
                                                    <span class="heading">Invoice#</span>
                                                    <asp:Label ID="lblPrintInvoieno" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <span class="heading">InvoiceDate</span>
                                                    <asp:Label ID="lblPrintInvoiceDate" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <span class="heading">Customer</span>
                                                    <asp:Label ID="lblPrintInvoiceCsutomer" runat="server"></asp:Label>
                                                    <span>TO</span>
                                                    <asp:Label ID="Label17" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <span class="heading">Remarks</span>
                                                    <asp:Label ID="lblPrintInvoiceRemarks" runat="server"></asp:Label>
                                                </div>

                                            </div>
                                        </header>
                                        <main>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th class="service">Nos.</th>
                                                        <th class="desc">DESCRIPTION</th>
                                                        <th>Qty</th>
                                                        <th>Rate</th>
                                                        <th>Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tblPrintInvoice" runat="server">
                                                    <tr>
                                                        <td class="service">1 X 46</td>
                                                        <td class="desc">Container Export</td>
                                                        <td class="unit"></td>
                                                        <td class="qty"></td>
                                                        <td class="total"></td>
                                                        <td class="total"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" style="text-align: right">Shipping Line</td>
                                                        <td colspan="2" class="total"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" style="text-align: right">Address</td>
                                                        <td colspan="2" class="total">Gat#1, Old Truck adda, Mauripur, Karachi</td>
                                                    </tr>
                                                </tbody>

                                                <asp:HiddenField ID="HiddenField5" runat="server" />
                                            </table>
                                            <table style="width: 100%">
                                                <%--<tr>
                                                    <td colspan="3"></td>
                                                    
                                                    <td style="text-align: right;"><h4>Total Advance: <asp:Label ID="Label22" runat="server"></asp:Label></h4></td>
                                                </tr>--%>
                                                <tr>
                                                    <td colspan="3"></td>
                                                    <td style="text-align: right;">
                                                        <h4>Total:
                                                            <asp:Label ID="lblPrintInvoiceToal" runat="server"></asp:Label></h4>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div id="notices">
                                                <div>NOTICE:</div>
                                                <div class="notice">Contact transportation company or broker in case of debris.</div>
                                            </div>
                                        </main>
                                        <footer>
                                            Invoice was created on a computer and is valid without the signature and seal.
                                       
                                        </footer>
                                        <!-- end -->
                                        <a href="#" onclick="PrintInvoice(); return false;" class="btn btn-purple btn-md"><i class="fa fa-print"></i>&nbsp; Print </a>
                                    </asp:Panel>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                            <ContentTemplate>
                                <ajaxToolkit:ModalPopupExtender ID="modalInvoice" runat="server" PopupControlID="pnlInvoice" DropShadow="True" TargetControlID="btnOpenInvoice"
                                    CancelControlID="lnkCloseInvoice" BackgroundCssClass="modalBackground">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="pnlInvoice" runat="server" CssClass="row" Style="background-color: white; padding: 20px; border: 1px solid black; height: 600px; overflow-y: scroll" Width="1300px">

                                    <asp:Button ID="btnOpenInvoice" runat="server" Style="display: none" />
                                    <asp:LinkButton ID="lnkCloseInvoice" runat="server" ForeColor="Maroon" CssClass="pull-right" Style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <h4 class="pull-left">
                                        <asp:Label ID="Label7" runat="server"></asp:Label></h4>
                                    <asp:LinkButton ID="lnkCloseInvoices" runat="server" ForeColor="Maroon" CssClass="pull-right" OnClick="lnkCloseInvoices_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    <div id="divInvoiceNotification" runat="server"></div>
                                    <h2>Invoice</h2>

                                    <asp:Panel ID="pnlContainerSelection" runat="server" CssClass="col-xs-12" Visible="false">
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group">
                                                <label class="form-label">Keyword</label>
                                                <div class="controls">
                                                    <asp:CheckBoxList ID="cbOrderContainers" runat="server"></asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group">
                                                <div class="controls">
                                                    <asp:LinkButton ID="lnkAddContainers" runat="server" CssClass="btn btn-info m-t-40" OnClick="lnkAddContainers_Click"><i class="fas fa-plus-square"></i></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlInvoices" runat="server" CssClass="col-xs-12">
                                        <!-- start -->
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="invoice-head row">
                                                    <div class="col-xs-12 col-md-2 invoice-title">
                                                        <h2 class="text-center bg-primary ">Invoice</h2>
                                                    </div>
                                                    <div class="col-xs-12 col-md-3 invoice-head-info">
                                                        <span class='text-muted'>
                                                            <span class='text-muted'>
                                                                <asp:Label ID="lblBilltoCustomer" runat="server"></asp:Label></span><br>
                                                        </span>
                                                    </div>
                                                    <div class="col-xs-12 col-md-3 invoice-head-info">
                                                        <span class='text-muted'>Invoice #
                                                        <asp:Label ID="lblOrderNo" runat="server"></asp:Label><br>
                                                            <asp:Label ID="lblOrderDate" runat="server"></asp:Label></span>
                                                    </div>
                                                    <div class="col-xs-12 col-md-3 invoice-logo col-md-offset-1">
                                                        <img alt="" src="../data/invoice/invoice-logo.png" class="img-reponsive">
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <br>
                                            </div>
                                            <div class="col-xs-6 invoice-infoblock pull-left">
                                                <h4>Sender</h4>
                                                <h3>
                                                    <asp:Label ID="lblSenderCompanyName" runat="server"></asp:Label></h3>
                                                <address>
                                                    <span class='text-muted'>
                                                        <asp:Label ID="lblSenderAddress" runat="server"></asp:Label></span>
                                                </address>
                                            </div>
                                            <div class="col-xs-6 invoice-infoblock text-right">
                                                <h4>Receiver</h4>
                                                <h3>
                                                    <asp:Label ID="lblReceiverCompanyName" runat="server"></asp:Label></h3>
                                                <address>
                                                    <span class='text-muted'>
                                                        <asp:Label ID="lblReceiverAddress" runat="server"></asp:Label></span>
                                                </address>
                                            </div>
                                        </div>

                                        <div class="row" id="Div1" runat="server">
                                            <div class="col-xs-12">
                                                <h3>Order summary</h3>
                                                <br>
                                                <div class="table-responsive">
                                                    <table class="table table-hover invoice-table">
                                                        <thead>
                                                            <tr>
                                                                <td>
                                                                    <h4>No. Of Packages</h4>
                                                                </td>
                                                                <td class="text-center">
                                                                    <h4>Details</h4>
                                                                </td>
                                                                <td class="text-center">
                                                                    <h4>Rate</h4>
                                                                </td>
                                                                <td>Amount</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="Tbody1" runat="server">
                                                            <!-- foreach ($order->lineItems as $line) or some such thing here -->
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblTotalInvoiceContainers" runat="server"></asp:Label></td>
                                                                <td class="">
                                                                    <asp:Label ID="lblInvoiceDescription" runat="server"></asp:Label></td>
                                                                <td class="text-center">
                                                                    <asp:Label ID="lblInvoiceContainerRate" runat="server"></asp:Label></td>
                                                                <td class="text-center">
                                                                    <asp:Label ID="lblInvoicecontainerTotal" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td class="">Empty Lift on Charges</td>
                                                                <td class="text-center">1850</td>
                                                                <td class="text-center">1850</td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td class="">Weightment Charges</td>
                                                                <td class="text-center">190</td>
                                                                <td class="text-center">190</td>
                                                            </tr>
                                                            <tr>
                                                                <td>MSC LINE</td>
                                                                <td class="text-center"></td>
                                                                <td class="text-center"></td>
                                                                <td class="text-right"></td>
                                                            </tr>

                                                            <tr>
                                                                <td></td>
                                                                <td class="">
                                                                    <div class="row" id="tblContainers" runat="server">
                                                                        <div class="col-xs-12">
                                                                            <h3>Container's summary</h3>
                                                                            <br>
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover invoice-table">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <h4>Date #</h4>
                                                                                            </td>
                                                                                            <td class="text-center">
                                                                                                <h4>Vehicle #</h4>
                                                                                            </td>
                                                                                            <td class="text-center">
                                                                                                <h4>Container #</h4>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody id="containersList" runat="server"></tbody>
                                                                                </table>
                                                                            </div>
                                                                            <div class="clearfix"></div>
                                                                            <br>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td class="text-center"></td>
                                                                <td class="text-right"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table class="table table-hover invoice-table">
                                                        <%--<tr>
                                                            <td class="thick-line"></td>
                                                            <td class="thick-line"></td>
                                                            <td class="thick-line text-center"><h4>Subtotal</h4></td>
                                                            <td class="thick-line text-right"><h4>$1670.99</h4></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="no-line"></td>
                                                            <td class="no-line"></td>
                                                            <td class="no-line text-center"><h4>Shipping</h4></td>
                                                            <td class="no-line text-right"><h4>$15</h4></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="no-line"></td>
                                                            <td class="no-line"></td>
                                                            <td class="no-line text-center"><h4>VAT</h4></td>
                                                            <td class="no-line text-right"><h4>$150.23</h4></td>
                                                        </tr>--%>
                                                        <tr>
                                                            <td class="no-line"></td>
                                                            <td class="no-line"></td>
                                                            <td class="no-line text-center">
                                                                <h4>Total</h4>
                                                            </td>
                                                            <td class="no-line text-right">
                                                                <h3 style='margin: 0px;' class="text-primary">
                                                                    <asp:Label ID="lblInvoiceGrandTotal" runat="server"></asp:Label></h3>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="clearfix"></div>
                                                <br>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="col-xs-12 text-center">
                                                <a href="#" onclick="Print();" class="btn btn-purple btn-md"><i class="fa fa-print"></i>&nbsp; Print </a>
                                                <%--<a href="#" target="_blank" class="btn btn-accent btn-md"><i class="fa fa-send"></i> &nbsp; Send </a>        --%>
                                            </div>
                                        </div>
                                        <!-- end -->
                                    </asp:Panel>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                
                        <ajaxToolkit:ModalPopupExtender ID="modalReceiveDocuments" runat="server" PopupControlID="pnlReceiveDocument" TargetControlID="btnOpen"
                            CancelControlID="btnClose" BackgroundCssClass="modalBackground">
                        </ajaxToolkit:ModalPopupExtender>

                        <asp:Panel CssClass="col-xs-12" ID="pnlReceiveDocument" runat="server" TabIndex="-1" role="dialog" aria-hidden="true">
                            <asp:Button ID="btnOpen" runat="server" Style="display: none" />
                            <asp:Button ID="btnClose" runat="server" Style="display: none" />
                            <%--<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Maroon" style="display: none;"></asp:LinkButton>--%>
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <div id="divModalNotification" style="margin-top: 10px;" runat="server"></div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:LinkButton CssClass="fas fa-times pull-right" ID="pnlReceiveDocumentsClose" OnClick="pnlReceiveDocumentsClose_Click" runat="server" />
                                            </div>
                                            <div class="col-md-12" style="overflow-y: scroll; overflow-x: scroll; height: 400px;">
                                                <asp:HiddenField runat="server" ID="hfOrderID" />
                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <label class="form-label">Received By</label>
                                                        <div class="controls">
                                                            <asp:TextBox ID="txtProductReceivedBy" runat="server" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <label class="form-label">Receiving Date</label>
                                                        <div class="controls">
                                                            <asp:TextBox ID="txtProductReceivedDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <label class="form-label">Receiving Time</label>
                                                        <div class="controls">
                                                            <asp:TextBox ID="txtProductReceivedTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <label class="form-label">Receiving Document</label>
                                                        <div class="controls">
                                                            <asp:FileUpload ID="fuDocuments" CssClass="form-control" AllowMultiple="true" runat="server" />
                                                            <asp:Button Text="Upload" CssClass="btn btn-xs btn-warning" ID="btnFileUpload" OnClick="btnFileUpload_Click" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:GridView ID="gvDocuments" Visible="false" runat="server" Width="100%" EmptyDataText="No Record found"
                                                        CssClass="table table-hover" Font-Size="12px" OnRowCommand="gvDocuments_RowCommand" AutoGenerateColumns="false" OnRowDeleting="gvDocuments_RowDeleting" Font-Names="Open Sans">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.no">
                                                                <ItemTemplate>
                                                                    <%#Container.DataItemIndex + 1 %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Document Image" ItemStyle-Width="50%">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="imgDocument" Width="12%" runat="server" ImageUrl='<%# Eval("File") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--<asp:ImageField DataImageUrlField="File" style="width: 100%;" HeaderText="Document"></asp:ImageField>--%>
                                                            <asp:TemplateField HeaderText="Type">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlDocumentType" runat="server" CssClass="form-control" Font-Size="12px">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Document No">
                                                                <ItemTemplate>
                                                                    <asp:TextBox runat="server" ID="txtDocumentNo" CssClass="form-control" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-xs btn-danger" CommandName="trash" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fas fa-trash"></i></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <HeaderStyle BackColor="#1f5607" ForeColor="White" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <asp:LinkButton CssClass="btn btn-xs btn-success" Visible="false" ID="lnkSaveProductRecieve" OnClick="lnkSaveProductRecieve_Click" runat="server"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

            </div>
        </div>  
                
            </ContentTemplate>
        </asp:UpdatePanel>
   
       
    </div>
    <!-- END Page Content -->
</asp:Content>
