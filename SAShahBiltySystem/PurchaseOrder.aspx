<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="SAShahBiltySystem.PurchaseOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Purchase-Order</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>   
             <!-- Page content -->
        <div id="page-content">
            <!-- Forms General Header -->
          
                     <div class="content-header">
                <div class="header-section">
                    <h1>
                        
                        PURCHASE ORDER
                        <br />
                    </h1>
                </div>
            </div>
               
           
            <asp:UpdatePanel ID="UpdatePanelGrid" runat="server">
                            <ContentTemplate>
            <!-- END Forms General Header -->
           <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
            <div class="row">
                <asp:Panel ID="pnlView" runat="server" CssClass="col-md-12" Visible="false">
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </asp:Panel>
                <asp:Panel ID="pnlInput" runat="server" CssClass="col-md-12" DefaultButton="lnkSubmit" Visible="false">
                    <asp:HiddenField ID="hfEditID" runat="server" />
                    <!-- Basic Form Elements Block -->
                    
                    <!-- END Basic Form Elements Block -->
                </asp:Panel>
            </div>

            <div class="row">
                <div class="col-md-12">
                    
                        <!-- Table Styles Block -->
                        <div class="block">
                            <!-- Table Styles Title -->
                            <div class="block-title">
                                <h2><strong>Purchase Order</strong></h2>
                            </div>
                            <!-- END Table Styles Title -->

                            <!-- Table Styles Content -->
                            <!-- Changing classes functionality initialized in js/pages/tablesGeneral.js -->
                            <div class="table-options clearfix">
                                <div class="btn-group btn-group-sm pull-left">

                                    <div class="col-md-6 m-t-25 pull-right">
                                    </div>
                                </div>
                              <%--  <div class="btn-group btn-group-sm pull-left" data-toggle="buttons">
                                    <label id="style-default" class="btn btn-primary active" data-toggle="tooltip" title=".table">
                                        <input type="radio" name="style-options"> Default
                                    </label>
                                    <label id="style-bordered" class="btn btn-primary" data-toggle="tooltip" title=".table-bordered">
                                        <input type="radio" name="style-options"> Bordered
                                    </label>
                                    <label id="style-borderless" class="btn btn-primary" data-toggle="tooltip" title=".table-borderless">
                                        <input type="radio" name="style-options"> Borderless
                                    </label>
                                </div>--%>
                            </div>
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
                            
                            <asp:Panel ID="pnlmain" runat="server">
                               <asp:Panel ID="pnl1" runat="server">
                                   <table style="width: 100%; margin-bottom: 1%">
                                    <tr>
                                    <td style="width: 3%"></td>
                                    <td style="width: 22%"><asp:DropDownList ID="ddlvendor" ClientIDMode="Static" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlvendor_SelectedIndexChanged"></asp:DropDownList></td>
                                    <td style="width: 2%"></td>
                                    <td style="width: 22%"><asp:TextBox ID="txtmobile" runat="server" CssClass="form-control" placeholder="Mobile No"></asp:TextBox></td>
                                    <td style="width: 2%"></td>
                                    <td style="width: 22%"><asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox></td>
                                    <td style="width: 2%"></td>
                                    <td style="width: 22%"><asp:TextBox ID="txtshop" runat="server" CssClass="form-control" placeholder="Shop No"></asp:TextBox></td>                                   
                                    <td style="width: 3%"></td>
                                    </tr>
                                    </table>                                  
                               </asp:Panel>
                                <asp:Panel ID="pnlgrid" runat="server">
                                    
                                    <asp:GridView ID="gvpurchaseorderDetail" runat="server" Width="100%" CssClass="table table-striped table-vcenter" AutoPostBack="true" AutoGenerateColumns="false" OnRowCommand="gvpurchaseorderDetail_RowCommand" OnRowDeleting="gvpurchaseorderDetail_RowDeleting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">   
                                                <ItemTemplate>  
                                                    <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>  
                                                </ItemTemplate>  
                                            </asp:TemplateField> 
                                            <asp:TemplateField HeaderText="Code" HeaderStyle-Width=" 10%" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtCode" runat="server" AutoPostBack="true" OnTextChanged="txtCode_TextChanged"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product" HeaderStyle-Width=" 10%" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlproduct" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlproduct_SelectedIndexChanged"></asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Qty" HeaderStyle-Width=" 10%" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtQty" runat="server" TextMode="Number" AutoPostBack="true" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit Price" HeaderStyle-Width=" 10%" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Discount" HeaderStyle-Width=" 10%" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtDiscount" runat="server" TextMode="Number" Text="0" AutoPostBack="true" OnTextChanged="txtDiscount_TextChanged"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total" HeaderStyle-Width=" 10%" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtTotal" runat="server" TextMode="Number" Text="0"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Actions" HeaderStyle-Width=" 10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbadd" runat="server" Visible="false" ToolTip="Add" style="margin-left: 5%" CommandName="add" CssClass="fa fa-plus"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbdelete" runat="server" Visible="false" ToolTip="Remove" CommandName="delete" style="margin-left: 5%" CssClass="fa fa-trash"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:Button ID="btnprint" runat="server" Enabled="false" CssClass="btn btn-success" Text="Print" />
                                    <asp:Button ID="btnsave" runat="server" CssClass="btn btn-info" Text="Save" OnClick="btnsave_Click"/>
                                    <asp:Button ID="btncancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancel_Click" />
                                        
                                </asp:Panel>
                            </asp:Panel>
                                
                                <asp:Panel ID="pnladdnew" runat="server" >
                                   <asp:Button ID="btnaddnew" runat="server" CssClass="btn btn-info" Text="Add New" style="float: right" OnClick="btnaddnew_Click" />
                               </asp:Panel>
                                <asp:Panel ID="Panel1" runat="server">
                                    <asp:GridView ID="gvpurchaseorder" runat="server" Width="100%" CssClass="table table-striped table-vcenter" ShowHeaderWhenEmpty="true" EmptyDataRowStyle-CssClass="text-center" EmptyDataText="No Record Found" AutoGenerateColumns="false" OnRowCommand="gvpurchaseorder_RowCommand" OnRowDeleting="gvpurchaseorder_RowDeleting">
                                        <Columns>
                                            <asp:BoundField DataField="PurchaseOrderID" HeaderText="ID" />
                                            <asp:BoundField DataField="Code" HeaderText="Code" />
                                            <asp:BoundField DataField="VendorName" HeaderText="Vendor Name" />
                                            <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" />
                                            <asp:BoundField DataField="ShopNo" HeaderText="Shop No" />
                                            <asp:TemplateField HeaderText="Detail" HeaderStyle-Width=" 10%" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbview" runat="server" CommandName="view" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ToolTip="View" style="margin-left: 35%">View</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbedit" runat="server" Visible="false" CommandName="edit" ToolTip="Edit" CssClass="fa fa-edit"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbdelete" runat="server" OnClientClick="return confirm('Are you sure you want delete');" ToolTip="Delete" CommandName="delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CssClass="fa fa-trash"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                
                            </div>
                            <!-- END Table Styles Content -->
                        </div>
    
                    <ajaxToolkit:ModalPopupExtender ID="modalConfirm" runat="server" PopupControlID="pnlConfirm" DropShadow="True" TargetControlID="btnOpenConfirmModal" 
                        CancelControlID="lnkCloseConfirmModal" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                   <asp:Panel ID="pnlConfirm" runat="server" class="">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header text-center">
                        <h5><asp:Label ID="lblModalTitle" runat="server" Text="Add New Vendor"></asp:Label></h5>                       
                    </div>
                    <!-- END Modal Header -->

                    <!-- Modal Body -->
                    <div class="modal-body">
                        <div class="form-horizontal form-bordered">
                            
                            <div class="form-group form-actions">
                                <table style="width: 100%">
                                <tr>
                                <td style="width: 50%"><asp:TextBox ID="txtvendorname" runat="server" CssClass="form-control" placeholder="Vendor Name"></asp:TextBox></td>
                                <td style="width: 50%"><asp:TextBox ID="txtvenMob" runat="server" TextMode="Number" CssClass="form-control" placeholder="Mobile No"></asp:TextBox></td>
                                </tr>
                                <tr>
                                <td style="width: 50%"><asp:TextBox ID="txtvenEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox></td>
                                <td style="width: 50%"><asp:TextBox ID="txtvenShop" runat="server" CssClass="form-control" placeholder="Shop No"></asp:TextBox></td>
                                </tr>
                                </table>
                                <div class="col-xs-12 text-right">
                                    <asp:Button ID="btnOpenConfirmModal" runat="server" style="display: none" />
                                    
                                    <asp:LinkButton ID="lnkCloseConfirmModal" runat="server" ForeColor="Maroon" CssClass="pull-right" style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <asp:HiddenField ID="hfConfirmAction" runat="server" />
                            <asp:LinkButton ID="lbsaveven" runat="server" CssClass="btn btn-sm btn-primary" OnClick="lbsaveven_Click"><i class="fas fa-save"></i> | Save</asp:LinkButton>
                                    <asp:LinkButton ID="lbcancelven" runat="server" CssClass="btn btn-sm btn-danger"><i class="fas fa-times-circle"></i> | Cancel</asp:LinkButton>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- END Modal Body -->
                </div>
            </div>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="modaldetail" runat="server" PopupControlID="pnldtl" DropShadow="True" TargetControlID="btnopendetail" 
                        CancelControlID="lbclosedetail" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                   <asp:Panel ID="pnldtl" runat="server" class="">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header text-center">
                        <h5><asp:Label ID="Label1" runat="server" Text="DETAIL"></asp:Label></h5>                       
                    </div>
                    <!-- END Modal Header -->

                    <!-- Modal Body -->
                    <div class="modal-body">
                        <div class="form-horizontal form-bordered">
                            
                            <div class="form-group form-actions">
                                <asp:GridView ID="gvdetail" runat="server" Width="100%" CssClass="table table-striped table-vcenter" AutoGenerateColumns="true">
                                    <Columns>

                                    </Columns>
                                </asp:GridView>
                                <div class="col-xs-12 text-right">
                                    <asp:Button ID="btnopendetail" runat="server" style="display: none" />
                                    
                                    <asp:LinkButton ID="lbclosedetail" runat="server" ForeColor="Maroon" CssClass="pull-right" style="display: none;"><i class="fa fa-times-circle-o"></i></asp:LinkButton>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-sm btn-danger"><i class="fas fa-times-circle"></i> | Close</asp:LinkButton>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- END Modal Body -->
                </div>
            </div>
        </asp:Panel>
                        <!-- END Table Styles Block -->
                </div>
            </div>
              
        
        </div>
    </ContentTemplate>
                   </asp:UpdatePanel>
    
                   

        <!-- Scroll to top link, initialized in js/app.js - scrollToTop() -->
        <a href="#" id="to-top"><i class="fa fa-angle-double-up"></i></a>

        <!-- User Settings, modal which opens from Settings link (found in top right user menu) and the Cog link (found in sidebar user info) -->
        <div id="modal-user-settings" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header text-center">
                        <h2 class="modal-title"><i class="fa fa-pencil"></i> Settings</h2>
                    </div>
                    <!-- END Modal Header -->

                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form action="index.html" method="post" enctype="multipart/form-data" class="form-horizontal form-bordered" onsubmit="return false;">
                            <fieldset>
                                <legend>Vital Info</legend>
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Username</label>
                                    <div class="col-md-8">
                                        <p class="form-control-static">Admin</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user-settings-email">Email</label>
                                    <div class="col-md-8">
                                        <input type="email" id="user-settings-email" name="user-settings-email" class="form-control" value="admin@example.com">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user-settings-notifications">Email Notifications</label>
                                    <div class="col-md-8">
                                        <label class="switch switch-primary">
                                            <input type="checkbox" id="user-settings-notifications" name="user-settings-notifications" value="1" checked>
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>Password Update</legend>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user-settings-password">New Password</label>
                                    <div class="col-md-8">
                                        <input type="password" id="user-settings-password" name="user-settings-password" class="form-control" placeholder="Please choose a complex one..">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user-settings-repassword">Confirm New Password</label>
                                    <div class="col-md-8">
                                        <input type="password" id="user-settings-repassword" name="user-settings-repassword" class="form-control" placeholder="..and confirm it!">
                                    </div>
                                </div>
                            </fieldset>
                            <div class="form-group form-actions">
                                <div class="col-xs-12 text-right">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-sm btn-primary">Save Changes</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- END Modal Body -->
                </div>
            </div>
        </div>
    </div>
        <!-- END User Settings -->
</asp:Content>
