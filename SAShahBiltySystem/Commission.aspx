<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Commission.aspx.cs" Inherits="SAShahBiltySystem.Commission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           
             <!-- Page content -->
        <div id="page-content">
            <!-- Forms General Header -->
          
                     <div class="content-header">
                <div class="header-section">
                    <h1>
                        
                        COMMISSION
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
                                <h2><strong>Commission</strong></h2>
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
                                   <table style="width: 100%">
                                    <tr>
                                    <td style="width: 3%"></td>
                                    <td style="width: 30%"><asp:TextBox ID="txtMinAmount" runat="server" TextMode="Number" CssClass="form-control" placeholder="Min Order Amount"></asp:TextBox></td>
                                    <td style="width: 2%"></td>
                                    <td style="width: 30%"><asp:TextBox ID="txtMaxAmount" runat="server" TextMode="Number" CssClass="form-control" placeholder="Max Order Amount"></asp:TextBox></td>
                                    <td style="width: 2%"></td>
                                    <td style="width: 27%"><asp:TextBox ID="txtPercentage" runat="server" TextMode="Number" CssClass="form-control" placeholder="Percentage"></asp:TextBox></td>
                                    <td style="width: 1%"></td>
                                    <td style="width: 2%"><i class="fa fa-percent"></i></td>
                                    <td style="width: 3%"></td>
                                    </tr>
                                    </table>
                                   <table style="width: 100%; margin-top: 1%; margin-bottom: 1%">
                                    <tr>
                                    <td style="width: 3%"></td>
                                    <td style="width: 30%"><asp:TextBox ID="txtFixedAdditionalAmount" runat="server" TextMode="Number" CssClass="form-control" placeholder="Fixed Additional Amount"></asp:TextBox></td>
                                    <td style="width: 2%"></td>
                                    <td style="width: 30%"><asp:TextBox ID="txtCommissionAmount" runat="server" TextMode="Number" CssClass="form-control" placeholder="Commission Amount"></asp:TextBox></td>
                                    <td style="width: 2%"></td>
                                    <td style="width: 18%"></td>
                                    <td style="width: 12%"><asp:Button ID="btnsave" runat="server" Visible="false" CssClass="btn btn-info" Text="Save" OnClick="btnsave_Click"/>
                                        <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-info" Text="Update" Visible="false" OnClick="btnupdate_Click"/>
                                        <asp:Button ID="btnclose" runat="server" CssClass="btn btn-danger" Text="Close" OnClick="btnclose_Click" /></td>
                                    <td style="width: 3%"></td>
                                    </tr>
                                   </table>
                               </asp:Panel>
                               <asp:Panel ID="pnladdnew" runat="server" >
                                   <asp:Button ID="btnaddnew" runat="server" CssClass="btn btn-info" Text="Add New" style="float: right" OnClick="btnaddnew_Click" />
                               </asp:Panel>
                                <asp:Panel ID="pnlgrid" runat="server">
                                    <asp:GridView ID="gvcommission" runat="server" Width="100%" CssClass="table table-striped table-vcenter" ShowHeaderWhenEmpty="true" EmptyDataRowStyle-CssClass="text-center" EmptyDataText="No Record Found" AutoGenerateColumns="false" OnRowCommand="gvcommission_RowCommand" OnRowEditing="gvcommission_RowEditing" OnRowDeleting="gvcommission_RowDeleting">
                                        <Columns>
                                            <asp:BoundField DataField="CommissionID" HeaderText="ID" ReadOnly="true" />
                                            <asp:BoundField DataField="MinAmount" HeaderText="Min Amount" ReadOnly="true" />
                                            <asp:BoundField DataField="MaxAmount" HeaderText="Max Amount" ReadOnly="true" />
                                            <asp:BoundField DataField="FixedAdditionalAmount" HeaderText="Fixed Additional Amount" ReadOnly="true" />
                                            <asp:BoundField DataField="Percentage" HeaderText="Percent Amount" ReadOnly="true" />
                                            <asp:BoundField DataField="CommissionAmount" HeaderText="Commission Amount" ReadOnly="true" />
                                            <asp:TemplateField HeaderText="Actions" HeaderStyle-Width=" 10%" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbedit" runat="server" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ToolTip="Edit" style="margin-left: 35%" CssClass="fa fa-edit"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbdelete" runat="server" OnClientClick="return confirm('Are you sure you want delete');" CommandName="delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ToolTip="Delete" style="margin-left: 5%" CssClass="fa fa-trash"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                
                            </div>
                            <!-- END Table Styles Content -->
                        </div>
                        <!-- END Table Styles Block -->
                </div>
            </div>
              
        </ContentTemplate>
    </asp:UpdatePanel>
        </div>
    
    
                   

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
</asp:Content>
