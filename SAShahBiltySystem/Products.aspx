<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SAShahBiltySystem.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>   

        <div id="page-content">
          
                     <div class="content-header">
                <div class="header-section">
                    <h1>
                        
                        PRODUCT
                        <br />
                    </h1>
                </div>
            </div>
               
           
            <asp:UpdatePanel ID="UpdatePanelGrid" runat="server">
                            <ContentTemplate>
           <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
            <div class="row">
                <asp:Panel ID="pnlView" runat="server" CssClass="col-md-12" Visible="false">
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </asp:Panel>
                <asp:Panel ID="pnlInput" runat="server" CssClass="col-md-12" DefaultButton="lnkSubmit" Visible="false">
                    <asp:HiddenField ID="hfEditID" runat="server" />
                </asp:Panel>
            </div>

            <div class="row">
                <div class="col-md-12">
                        <div class="block">
                            <div class="block-title">
                                <h2><strong>Products</strong></h2>
                            </div>
                            <div class="table-options clearfix">
                                <div class="btn-group btn-group-sm pull-left">

                                    <div class="col-md-6 m-t-25 pull-right">
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">   
                                <asp:Panel ID="pnlmain" runat="server">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 3%"></td>
                                        <td style="width: 30%"><asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox></td>
                                        <td style="width: 2%"></td>
                                        <td style="width: 30%"><asp:TextBox ID="txtsaleprice" runat="server" TextMode="Number" CssClass="form-control" placeholder="Sale Price"></asp:TextBox></td>
                                        <td style="width: 2%"></td>
                                        <td style="width: 30%"><asp:TextBox ID="txtbuyingprice" runat="server" TextMode="Number" CssClass="form-control" placeholder="Buying Price"></asp:TextBox></td>
                                        <td style="width: 3%"></td>
                                    </tr>
                                </table>
                                <table style="width: 100%; margin-top: 1%">
                                    <tr>
                                        <td style="width: 3%"></td>
                                        <td style="width: 30%"><asp:DropDownList ID="ddltype" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:DropDownList></td>
                                        <td style="width: 2%"></td>
                                        <td style="width: 30%"><asp:DropDownList ID="ddlcategory" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:DropDownList></td>
                                        <td style="width: 2%"></td>
                                        <td style="width: 30%"><asp:DropDownList ID="ddlsupplier" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:DropDownList></td>
                                        <td style="width: 3%"></td>
                                    </tr>
                                </table>
                                <table style="width: 100%; margin-top: 1%; margin-bottom: 1%">
                                    <tr>
                                        <td style="width: 3%"></td>
                                        <td style="width: 40%"><asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Description"></asp:TextBox></td>
                                        <td style="width: 2%"></td>
                                        <td style="width: 40%"></td>
                                        <%--<td style="width: 1%"></td>--%>
                                        <td style="width: 12%"><asp:Button ID="btnsave" runat="server" CssClass="btn btn-info" Text="Save" Visible="false" OnClick="btnsave_Click"/>
                                        <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-info" Text="Update" Visible="false" OnClick="btnupdate_Click"/>
                                        <asp:Button ID="btncancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancel_Click"/></td>
                                        <td style="width: 3%"></td>
                                    </tr>
                                </table>
                                </asp:Panel>
                                <asp:Panel ID="pnladdnew" runat="server" >
                                   <asp:Button ID="btnaddnew" runat="server" CssClass="btn btn-info" Text="Add New" style="float: right" OnClick="btnaddnew_Click"/>
                               </asp:Panel>
                                <asp:Panel ID="Panel1" runat="server">
                                    <asp:GridView ID="gvproduct" runat="server" DataKeyNames="Description" Width="100%" CssClass="table table-striped table-vcenter" ShowHeaderWhenEmpty="true" EmptyDataRowStyle-CssClass="text-center" EmptyDataText="No Record Found" AutoGenerateColumns="false" OnRowCommand="gvproduct_RowCommand" OnRowEditing="gvproduct_RowEditing" OnRowDeleting="gvproduct_RowDeleting">
                                        <Columns>
                                            <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="true" />
                                            <asp:BoundField DataField="Code" HeaderText="Code" ReadOnly="true" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="true" />
                                            <asp:BoundField DataField="type" HeaderText="Type" ReadOnly="true" />
                                            <asp:BoundField DataField="category" HeaderText="Category" ReadOnly="true" />
                                            <asp:BoundField DataField="supplier" HeaderText="Supplier" ReadOnly="true" />
                                            <asp:BoundField DataField="SalePrice" HeaderText="Sale Price" ReadOnly="true" />
                                            <asp:BoundField DataField="BuyingPrice" HeaderText="Buying Price" ReadOnly="true" />
                                            <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbedit" runat="server" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ToolTip="Edit" CssClass="fa fa-edit"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbdelete" runat="server" OnClientClick="return confirm('Are you sure you want delete');" ToolTip="Delete" CommandName="delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CssClass="fa fa-trash"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                        </div>
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
        <!-- END User Settings -->
</asp:Content>
