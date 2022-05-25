<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="SAShahBiltySystem.Group" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>        
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style>
   <title>Group</title>
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
                    <asp:LinkButton ID="lnkAddNew" runat="server" OnClick="lnkAddNew_Click" ToolTip="Click to Add new Group"><i class="fas fa-plus"></i></asp:LinkButton>
                    Group<br><small>Add/View Group & Details</small>
                </h1>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
       
        <ul class="breadcrumb breadcrumb-top">
            <li>Admin</li>
            <li><a href="javascript:;">Group</a></li>
        </ul>
        <!-- END Forms General Header -->
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
        <div class="row">
            <asp:Panel ID="pnlView" runat="server" CssClass="col-md-12" DefaultButton="lnkCloseview" Visible="false">
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <!-- Basic Form Elements Block -->
                <div class="block">
                    <!-- Basic Form Elements Title -->
                    <div class="block-title">
                        <div class="block-options pull-right">
                            <asp:LinkButton ID="lnkCloseview" runat="server" OnClick ="lnkCloseView_Click" CssClass="btn btn-xs btn-danger pull-right" Style="margin-top: 10px; margin-right: 10px;" ><i class="fas fa-times"></i></asp:LinkButton>
                        </div>
                        <h2><strong>Input</strong> Fields</h2>
                    </div>
                    <!-- END Form Elements Title -->

                    <!-- Basic Form Elements Content -->
                    <div class="form-horizontal form-bordered" onsubmit="return false;">
                        <div class="form-group">
                            <div class="col-md-3">
                                <label>Code</label>
                                <asp:Label ID="lblCode" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <label> Group</label>
                                <asp:Label ID="lblGroup" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <label>Email</label>
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <label>Website</label>
                                <asp:Label ID="lblWebsite" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <label>Contact</label>
                                <asp:Label ID="lblContact" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <label>Other Contact</label>
                                <asp:Label ID="lblOtherContact" runat="server"></asp:Label>
                            </div>
                             <div class="col-md-3">
                                <label>Organization</label>
                                <asp:Label ID="lblOrganization" runat="server"></asp:Label>
                            </div>
                            
                            <div class="col-md-3">
                                <label>Address</label>
                                <asp:Label ID="lblAddress" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <label>Description</label>
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
                                <label>Group</label>
                                <asp:TextBox ID="txtGroup" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label>Email</label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                             <div class="col-md-3">
                                <label>Website</label>
                                <asp:TextBox ID="txtWebsite" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label>Contact</label>
                                <asp:TextBox ID="txtContact" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label>Other Contact</label>
                                <asp:TextBox ID="txtOtherContact" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label>Company Access</label>
                                <asp:TextBox ID="txtCompanyAccess" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                           <div class="col-md-6">
                           <label for="cbActive">Organizations</label>
                                            <asp:CheckBoxList ID="cbOrganizations" runat="server">
                                                <asp:ListItem>Hello</asp:ListItem>
                                            </asp:CheckBoxList> 
                           </div>
                            <div class="col-md-6">
                                <label>Address</label>
                                <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Description</label>
                                <asp:TextBox ID="txtDescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-12" style="margin-top: 30px;">
                                 <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn-success pull-right m-l-10" OnClick="lnkSubmit_Click"><i class="fa fa-save"></i> | Save</asp:LinkButton>
                                        
                              <%--  <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger pull-right" OnClick="lnkDelete_Click" Visible="false"><i class="fa fa-trash"></i> | Delete</asp:LinkButton>--%>
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
                            <h2><strong>Result</strong></h2>
                             <asp:Panel ID="pnlSearch" runat="server" DefaultButton="lnkSearch" CssClass="col-md-6 pull-right" style="margin-top: 5px;">
                                    <div class="col-md-10 pull-left">
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <asp:LinkButton ID="lnkSearch" runat="server" OnClick="lnkSearch_Click" CssClass="btn btn-sm btn-info pull-left"><i class="fas fa-search"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancelSearch" runat="server" OnClick="lnkCancelSearch_Click" CssClass="btn btn-sm btn-danger pull-left"><i class="fa fa-times-circle"></i></asp:LinkButton>
                                </asp:Panel>
                           
                        </div>
                        <!-- END Table Styles Title -->

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
                                CssClass="table table-striped table-vcenter" DataKeyNames="GroupID, isActive" OnRowCommand="gvResult_RowCommand" OnRowDataBound="gvResult_RowDataBound">
                             <Columns>
                                                <asp:TemplateField HeaderText="S.no">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                        <asp:BoundField DataField="GroupCode" HeaderText="Code"></asp:BoundField>
                                        <asp:BoundField DataField="GroupName" HeaderText="Group"></asp:BoundField>
                                        <asp:BoundField DataField="EmailAdd" HeaderText="Email"></asp:BoundField>
                                        <asp:BoundField DataField="WebAdd" HeaderText="Website"></asp:BoundField>
                                        <asp:BoundField DataField="Contact" HeaderText="Contact"></asp:BoundField>
                                               
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
                                                                                
                                                                                <li><asp:LinkButton ID="lnkDelete" runat="server" ForeColor="Maroon" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="DeleteGroup"><i class="fas fa-trash"></i> | Delete</asp:LinkButton></li>
                                                                                
                                                                            </ul>
                                                                        </div>
                                                                        <%--<a class="btn btn-alt btn-danger"><i class="fa fa-cog"></i></a>--%>
                                                                        <div class="btn btn-alt btn-primary"><asp:LinkButton ID="lnkActive" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Active"></asp:LinkButton></div>
                                                        
                                                                    </div>
                                                                </div>
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
                  <ajaxToolkit:ModalPopupExtender ID="modalConfirm" runat="server" PopupControlID="pnlConfirm" DropShadow="True" TargetControlID="btnOpenConfirmModal" 
                        CancelControlID="lnkCloseConfirmModal" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                    <asp:Panel ID="pnlConfirm" runat="server">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header text-center">
                        <h4><asp:Label ID="lblModalTitle" runat="server"></asp:Label></h4>                       
                    </div>
                    <!-- END Modal Header -->

                    <!-- Modal Body -->
                    <div class="modal-body">
                        <div class="form-horizontal form-bordered">
                            <div class="form-group form-actions">
                                <div class="col-xs-12 text-right">
                                    <asp:Button ID="btnOpenConfirmModal" runat="server" style="display: none" />
                                    
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
    
                  

            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    <!-- END Page Content -->
</asp:Content>
