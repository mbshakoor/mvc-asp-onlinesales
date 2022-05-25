using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAShahBiltySystem.Bilty
{
    public partial class CreateWorkOrder : System.Web.UI.Page
    {
        #region Members

        int loginid;
        string operation;
        int workorderid;
        int gvInputRowBindingIndex;
        DataTable loggedindata = new DataTable();
        Random rnd = new Random();


        int count = 1;

        #endregion

        #region Properties

        //public int LoginID
        //{
        //    get
        //    {
        //        if (Request.QueryString["lid"] != string.Empty && Request.QueryString["lid"] != null)
        //        {
        //            loginid = Convert.ToInt32(Request.QueryString["lid"].ToString());
        //        }
        //        return loginid;

        //    }
        //}

        public int LoginID
        {
            get
            {
                if (Session["UserID"] != string.Empty && Session["UserID"] != null)
                {
                    loginid = Convert.ToInt32(Session["UserID"]);
                }
                return loginid;

            }
        }

        public int EditOrderID
        {
            get
            {
                if (Session["woID"] != string.Empty && Session["woID"] != null)
                {
                    workorderid = Convert.ToInt32(Session["woID"].ToString());
                }
                return workorderid;

            }
        }

        public string Operation
        {
            get
            {
                if (Request.QueryString["ops"] != string.Empty && Request.QueryString["ops"] != null)
                {
                    operation = Request.QueryString["ops"].ToString();
                }
                return operation;

            }
        }

        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }

        public DataTable LoggedInData
        {
            get
            {
                if (Session["LoggedInUserData"] != null)
                {
                    loggedindata = Session["LoggedInUserData"] as DataTable;
                }
                return loggedindata;

            }
        }
        #endregion

        #region Page Initialization

        protected void Page_Init(object sender, EventArgs e)
        {
            //try
            //{
            //    var SenderBlurScript = Page.ClientScript.GetPostBackEventReference(txtSearchSender, "OnBlur");
            //    txtSearchSender.Attributes.Add("onblur", SenderBlurScript);
            //}
            //catch (Exception ex)
            //{
            //    notification("Error", "Error initializing page, due to: " + ex.Message);
            //}
        }

        #endregion

        #region Helper Methods

        private Int64 GetPackageID(String code, String name)
        {
            if (code != string.Empty && name != string.Empty)
            {
                PackagingTypeDML dmlPackage = new PackagingTypeDML();
                DataTable dt = dmlPackage.GetPackage(code, name);
                if (dt.Rows.Count > 0)
                {
                    return (Int64)dt.Rows[0]["PackageTypeID"];
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        private Int64 getProductID(string ProductName)
        {
            if (ProductName != string.Empty)
            {
                ProductDML dmlProduct = new ProductDML();
                DataTable dt = dmlProduct.getProductID(ProductName);
                return dt.Rows.Count > 0 ? (Int64)dt.Rows[0]["ID"] : 0;
            }
            else
            {
                return 0;
            }
        }

        private void FillDropDown(DataTable dt, DropDownList _ddl, string _ddlValue, string _ddlText, string _ddlDefaultText)
        {
            if (dt.Rows.Count > 0)
            {
                _ddl.DataSource = dt;

                _ddl.DataValueField = _ddlValue;
                _ddl.DataTextField = _ddlText;

                _ddl.DataBind();

                ListItem item = new ListItem();

                item.Text = _ddlDefaultText;
                item.Value = _ddlDefaultText;

                _ddl.Items.Insert(0, item);
                _ddl.SelectedIndex = 0;
            }
        }

        #endregion

        #region Page Load

        public void CheckOwnCompanyGroup()
        {
            try
            {
                //DataTable dtGroupName = (DataTable)Session["LoggedInData"];
                string GroupCode = LoggedInData.Rows[0]["GroupCode"].ToString().Trim();
                if (GroupCode != "SASG")
                {
                    txtVehicleRegNo.ReadOnly = true;
                    txtAccount.ReadOnly = true;
                    txtAdvance.ReadOnly = true;
                    txtFreight.ReadOnly = true;
                }
                else
                {
                    txtVehicleRegNo.ReadOnly = false;
                    txtAccount.ReadOnly = false;
                    txtAdvance.ReadOnly = false;
                    txtFreight.ReadOnly = false;
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Cannot check group due to : " + ex.Message);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            notification();
            //CheckOwnCompanyGroup();
            if (EditOrderID > 0 && EditOrderID != null)
            {
                CheckOrderIDToHideBiltyButton();
            }
            if (!IsPostBack)
            {

                this.Title = "Create Work Orders";
                GetOwnCompanyDropDown();
                //lblCurrentDate.Text = DateTime.Now.ToShortDateString();
                //lblCurrentDate.Text = DateTime.Today.ToString("dd/MMM/yyyy");
                lblCurrentDate.Text = ConvertDate(DateTime.Now.ToString(), "dd-MMM-yyyy");
                if (EditOrderID > 0 && EditOrderID != null)
                {
                    CheckOrderIDToHideBiltyButton();
                    GetFillInputs();
                    if (Operation != "change")
                    {
                        txtSearchSender.ReadOnly = true;
                    }
                }
                else
                {
                    lblDeliveryDate.Text = string.Empty;
                }
            }
        }

        #endregion

        #region Custom Methods

        public void notification()
        {
            try
            {
                divNotification.InnerHtml = string.Empty;
            }
            catch (Exception ex)
            {
                divNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }

        public void notification(string type, string msg)
        {
            try
            {
                if (type == "Error")
                {
                    divNotification.InnerHtml = "<div class=\"alert alert-danger\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
                }
                else if (type == "Success")
                {
                    divNotification.InnerHtml = "<div class=\"alert alert-success\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
                }
                else if (type == string.Empty)
                {
                    divNotification.InnerHtml = string.Empty;
                }
            }
            catch (Exception ex)
            {
                divNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }
        public void DistributionNotification(string type, string msg)
        {
            try
            {
                if (type == "Error")
                {
                    divDistributeNotification.InnerHtml = "<div class=\"alert alert-danger\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
                }
                else if (type == "Success")
                {
                    divDistributeNotification.InnerHtml = "<div class=\"alert alert-success\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
                }
                else if (type == string.Empty)
                {
                    divDistributeNotification.InnerHtml = string.Empty;
                }
            }
            catch (Exception ex)
            {
                divDistributeNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }

        public void PartialBiltyNotification(string type, string msg)
        {
            try
            {
                if (type == "Error")
                {
                    divPartialBiltyNotification.InnerHtml = "<div class=\"alert alert-danger\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
                }
                else if (type == "Success")
                {
                    divPartialBiltyNotification.InnerHtml = "<div class=\"alert alert-success\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
                }
                else if (type == string.Empty)
                {
                    divPartialBiltyNotification.InnerHtml = string.Empty;
                }
            }
            catch (Exception ex)
            {
                divPartialBiltyNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }

        public string ConvertDate(string DateString, string Format)
        {
            try
            {
                DateTime BiltyDate = Convert.ToDateTime(DateString);
                return BiltyDate.ToString(Format);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public void ModalNotification(string type, string msg)
        {
            try
            {
                if (type == "Error")
                {
                    divModalNotification.InnerHtml = "<div class=\"alert alert-danger\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
                }
                else if (type == "Success")
                {
                    divModalNotification.InnerHtml = "<div class=\"alert alert-success\">" + msg + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
                }
                else if (type == string.Empty)
                {
                    divModalNotification.InnerHtml = string.Empty;
                }
            }
            catch (Exception ex)
            {
                divModalNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }

        int GetColumnIndexByName(GridViewRow row, string columnName)
        {
            int columnIndex = 0;
            foreach (DataControlFieldCell cell in row.Cells)
            {
                if (cell.ContainingField is BoundField)
                    if (((BoundField)cell.ContainingField).DataField.Equals(columnName))
                        break;
                columnIndex++;
            }
            return columnIndex;
        }

        public void MakefirstRowEditable(GridViewRowEventArgs e)
        {
            try
            {
                TextBox txtQty = new TextBox();
                txtQty.ID = "txtQty";
                txtQty.CssClass = "form-control";

                //TextBox txtProductType = new TextBox();
                //txtProductType.ID = "txtProductType";
                //txtProductType.CssClass = "form-control";

                DropDownList ddlPackageType = new DropDownList();
                ddlPackageType.ID = "ddlPackageType";
                ddlPackageType.ClientIDMode = ClientIDMode.Static;
                try
                {
                    PackagingTypeDML dml = new PackagingTypeDML();
                    DataTable dtPackageType = dml.GetPackage();
                    if (dtPackageType.Rows.Count > 0)
                    {
                        FillDropDown(dtPackageType, ddlPackageType, "PackageTypeID", "PackageTypeString", "-Select-");
                    }
                }
                catch (Exception ex)
                {
                    notification("Error", "Error getting/binding packagetypes, due to: " + ex.Message);
                }

                DropDownList ddlPartyNameAddress = new DropDownList();
                ddlPartyNameAddress.ID = "ddlPartyNameAddress";
                ddlPartyNameAddress.ClientIDMode = ClientIDMode.Static;
                try
                {
                    CompanyDML dml = new CompanyDML();
                    DataTable dtCompany = dml.GetActiveCompany();
                    if (dtCompany.Rows.Count > 0)
                    {
                        FillDropDown(dtCompany, ddlPartyNameAddress, "CompanyID", "CompanyName", "-Select-");
                    }
                }
                catch (Exception ex)
                {
                    notification("Error", "Error getting/binding Party name & Address, due to: " + ex.Message);
                }
                //TextBox txtPartyNameAddress = new TextBox();
                //txtPartyNameAddress.ID = "txtPartyNameAddress";

                TextBox txtAccount = new TextBox();
                txtAccount.ID = "txtAccount";
                txtAccount.CssClass = "form-control";

                TextBox txtFreight = new TextBox();
                txtFreight.ID = "txtFreight";
                txtFreight.CssClass = "form-control";

                TextBox txtVehicleRegNo = new TextBox();
                txtVehicleRegNo.ID = "txtVehicleRegNo";
                txtVehicleRegNo.CssClass = "form-control";

                TextBox txtAdvance = new TextBox();
                txtAdvance.ID = "txtAdvance";
                txtAdvance.CssClass = "form-control";

                LinkButton lnkSave = new LinkButton();
                lnkSave.ID = "lnkSaveWorkOrder";
                lnkSave.CommandName = "SaveWO";
                lnkSave.CssClass = "btn btn-xs btn-primary";
                lnkSave.Text = "Save";

                e.Row.Cells[1].Controls.Add(txtQty);
                e.Row.Cells[2].Controls.Add(ddlPackageType);
                e.Row.Cells[3].Controls.Add(ddlPartyNameAddress);
                e.Row.Cells[4].Controls.Add(txtAccount);
                e.Row.Cells[5].Controls.Add(txtFreight);
                e.Row.Cells[6].Controls.Add(txtVehicleRegNo);
                e.Row.Cells[7].Controls.Add(txtAdvance);
                //e.Row.Cells[8].Controls.Remove();
                for (int i = 0; i < 3; i++)
                {
                    e.Row.Cells[8].Controls.RemoveAt(0);
                }
                e.Row.Cells[8].Controls.RemoveAt(0);
                e.Row.Cells[8].Controls.RemoveAt(0);
                e.Row.Cells[8].Controls.RemoveAt(0);
                e.Row.Cells[8].Controls.Add(lnkSave);
                //e.Row.Cells[GetColumnIndexByName(e.Row, "ProductType")].Controls.Add(txtProductType);
                //e.Row.Cells[GetColumnIndexByName(e.Row, "PartyNameAddress")].Controls.Add(ddlPartyNameAddress);
                //e.Row.Cells[GetColumnIndexByName(e.Row, "Account")].Controls.Add(txtAccount);
                //e.Row.Cells[GetColumnIndexByName(e.Row, "Freight")].Controls.Add(txtFreight);
                //e.Row.Cells[GetColumnIndexByName(e.Row, "Truck")].Controls.Add(txtVehicleRegNo);
                //e.Row.Cells[GetColumnIndexByName(e.Row, "Advance")].Controls.Add(txtAdvance);
                //e.Row.Cells[GetColumnIndexByName(e.Row, "Operations")].Controls.Add(lnkSave);
            }
            catch (Exception ex)
            {
                notification("Error", "Error making first row editable, due to: " + ex.Message);
            }
        }

        public Int64 GetCompanyID(string Name)
        {
            try
            {
                CompanyDML dmlComp = new CompanyDML();
                DataTable dtSender = dmlComp.GetCompanyForWO(Name);
                Int64 CompanyID = dtSender.Rows.Count > 0 ? Convert.ToInt64(dtSender.Rows[0]["CompanyID"]) : 0;
                return CompanyID;
                //if (dtSender.Rows.Count > 0)
                //{
                //    return Convert.ToInt64(dtSender.Rows[0]["CompanyID"]);
                //}
            }
            catch (Exception ex)
            {
                notification("Error", "Error getting Sender ID, due to: " + ex.Message);
                return 0;
            }
        }

        public Int64 GetPackageTypeID(string Code, string Name)
        {
            try
            {
                PackagingTypeDML dmlPackageType = new PackagingTypeDML();
                DataTable dtSender = dmlPackageType.GetPackage(Name);
                Int64 PackageTypeID = dtSender.Rows.Count > 0 ? Convert.ToInt64(dtSender.Rows[0]["PackageTypeID"]) : 0;
                return PackageTypeID;
            }
            catch (Exception ex)
            {
                notification("Error", "Error getting Sender ID, due to: " + ex.Message);
                return 0;
            }
        }

        public void ConfirmSaveCompany(string Title, string Action)
        {
            try
            {
                modalConfirmSaveNewCompany.Show();
                lblModalTitle.Text = Title;
                hfConfirmAction.Value = Action;
            }
            catch (Exception ex)
            {
                notification("Error", "Error confirming, due to: " + ex.Message);
            }
        }

        public void GetFillInputs(string sortExpression = "VehicleRegNo")
        {
            try
            {
                WorkOrderDML dml = new WorkOrderDML();
                DataTable dtworkOrder = dml.GetWorkOrders_New(EditOrderID);
                Session["WODetails"] = dtworkOrder;
                if (dtworkOrder.Rows.Count > 0)
                {
                    txtSearchSender.Text = dtworkOrder.Rows[0]["SenderCompany"].ToString();
                    txtSearchBillto.Text = dtworkOrder.Rows[0]["BiltoCompany"].ToString();
                    txtPartyNameAddress.Text = dtworkOrder.Rows[0]["ReceiverCompany"].ToString();
                    txtDeliveryDate.Text = dtworkOrder.Rows[0]["DeliveryDate"].ToString();
                    txtWorkOrderDescription.Text = dtworkOrder.Rows[0]["Description"].ToString();
                    DateTime DeliveryDate = Convert.ToDateTime(dtworkOrder.Rows[0]["DeliveryDate"]);
                    lblDeliveryDate.Text = DeliveryDate.ToString("dd-MMM-yyyy");
                    txtSearchBillto.ReadOnly = true;

                    Int64 OrderId = dtworkOrder.Rows[0]["BiltyID"].ToString() == string.Empty ? 0 : Convert.ToInt64(dtworkOrder.Rows[0]["BiltyID"]);
                    if (OrderId <= 0)
                    {
                        lnkBilty.Visible = true;
                    }
                    //sortExpression = ""


                    DataTable dtFinal = new DataTable();
                    foreach (DataColumn _dcWO in dtworkOrder.Columns)
                    {
                        dtFinal.Columns.Add(_dcWO.ColumnName);
                    }


                    if (sortExpression != null)
                    {
                        DataView dv = dtworkOrder.AsDataView();
                        this.SortDirection = "ASC";
                        dv.Sort = sortExpression + " " + this.SortDirection;


                        DataTable newTable = dv.ToTable(true, "ReceiverCompany", "VehicleRegNo");
                        if (newTable.Rows.Count > 0)
                        {
                            foreach (DataRow _drBunches in newTable.Rows)
                            {
                                string Receiver = _drBunches["ReceiverCompany"].ToString();
                                string Vehicle = _drBunches["VehicleRegNo"].ToString();

                                DataRow[] _drBunchData = dtworkOrder.Select("ReceiverCompany = '" + Receiver + "' AND VehicleRegNo = '" + Vehicle + "'");
                                if (_drBunchData.Length > 0)
                                {
                                    for (int i = 0; i < _drBunchData.Length; i++)
                                    {

                                        dtFinal.Rows.Add(_drBunchData[i].ItemArray);
                                    }
                                }



                            }

                        }


                        gvResult.DataSource = dtFinal;
                        gvMakeBilty.DataSource = dtFinal;
                    }
                    else
                    {
                        gvResult.DataSource = dtworkOrder;
                        gvMakeBilty.DataSource = dtworkOrder;
                    }



                    gvResult.DataBind();
                    gvMakeBilty.DataBind();
                }
                else
                {
                    notification("Error", "No record found of selected order");
                }

            }
            catch (Exception ex)
            {
                notification("Error", "Error getting/filling inputs for edit/view, due to: " + ex.Message);
            }
        }

        public void GetOwnCompanyDropDown()
        {
            try
            {
                OwnCompanyDML dml = new OwnCompanyDML();
                DataTable dt = dml.GetCompany();
                FillDropDown(dt, ddlOwnCompany, "CompanyID", "CompanyName", "-select-");
            }
            catch (Exception ex)
            {
                notification("Error", "Cannot get Own Companies Due To: " + ex.Message);
            }
        }

        public void RegisterNewCompany(TextBox Name)
        {
            string[] SenderString = Name.Text.Split('|');
            Random rnd = new Random();
            string Code = rnd.Next(9999).ToString();
            OrderDML dmlOrder = new OrderDML();
            Int64 GroupID = 0;
            GroupDML dmlGroup = new GroupDML();
            string GroupCode = "WOG123";
            string GroupName = "Work Order Group";
            DataTable dtGroup = dmlGroup.GetGroup(GroupCode, GroupName);
            if (dtGroup.Rows.Count > 0)
            {
                GroupID = Convert.ToInt64(dtGroup.Rows[0]["GroupID"]);
            }
            else
            {
                GroupID = dmlGroup.InsertGroup(GroupCode, GroupName, "Created automatically from Work Order", LoginID);
            }
            if (SenderString.Length > 1)
            {
                if (SenderString[1].Trim() == string.Empty)
                {
                    string NewCompanyName = SenderString[0].ToString().Trim();
                    if (GroupID > 0)
                    {
                        CompanyDML dml = new CompanyDML();
                        Int64 CompanyID = dml.InsertCompany(Code, NewCompanyName, "Karachi", GroupID, "Created automatic from WorkOrder", LoginID);
                        if (CompanyID > 0)
                        {
                            notification("Success", "New  Company Created in Directory");
                            DataTable dtCompany = dmlOrder.GetCompanies(NewCompanyName);
                            Name.Text = dtCompany.Rows[0]["CompanyAddress"].ToString();
                        }
                    }
                    else
                    {
                        notification("Error", "Error auto selecting VehicleType for auto save Vehicle");
                    }
                }
                else
                {
                    string NewCompanyName = SenderString[0].ToString().Trim();
                    string address = SenderString[1].ToString().Trim();
                    if (GroupID > 0)
                    {
                        CompanyDML dml = new CompanyDML();
                        Int64 CompanyID = dml.InsertCompany(Code, NewCompanyName, address, GroupID, "Created automatic from WorkOrder", LoginID);
                        if (CompanyID > 0)
                        {
                            notification("Success", "New  Company Created in Directory");
                            DataTable dtCompany = dmlOrder.GetCompanies(NewCompanyName);
                            Name.Text = dtCompany.Rows[0]["CompanyAddress"].ToString();
                        }
                    }
                    else
                    {
                        notification("Error", "Error auto selecting VehicleType for auto save Vehicle");
                    }
                }
            }
            else
            {
                string NewCompanyName = SenderString[0].ToString().Trim();
                if (GroupID > 0)
                {
                    CompanyDML dml = new CompanyDML();
                    Int64 CompanyID = dml.InsertCompany(Code, NewCompanyName, "Karachi", GroupID, "Created automatic from WorkOrder", LoginID);
                    if (CompanyID > 0)
                    {
                        notification("Success", "New  Company Created in Directory");
                        DataTable dtCompany = dmlOrder.GetCompanies(NewCompanyName);
                        Name.Text = dtCompany.Rows[0]["CompanyAddress"].ToString();
                    }
                }
                else
                {
                    notification("Error", "Error auto selecting VehicleType for auto save Vehicle");
                }
            }
        }

        #endregion

        #region Web Methods

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchCompanies(string prefixText, int count)
        {
            List<string> customers = new List<string>();
            OrderDML dmlOrder = new OrderDML();
            DataTable dtCompanies = dmlOrder.GetCompaniesForWorkOrderService(prefixText);
            if (dtCompanies.Rows.Count > 0)
            {
                for (int i = 0; i < dtCompanies.Rows.Count; i++)
                {
                    customers.Add(dtCompanies.Rows[i]["Company"].ToString());
                }
            }
            return customers;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchBillTo()
        {
            List<string> customers = new List<string>();
            OrderDML dmlOrder = new OrderDML();
            DataTable dtCompanies = dmlOrder.GetBillToCustomerCompanies();
            if (dtCompanies.Rows.Count > 0)
            {
                for (int i = 0; i < dtCompanies.Rows.Count; i++)
                {
                    customers.Add(dtCompanies.Rows[i]["Company"].ToString());
                }
            }
            return customers;
        }


        [System.Web.Script.Services.ScriptMethod()]
        [WebMethod]
        public static List<string> SearchPackagetypes()
        {
            List<string> PackageType = new List<string>();
            PackagingTypeDML dmlPackageTypes = new PackagingTypeDML();
            DataTable dtPackages = dmlPackageTypes.GetPackageService();
            if (dtPackages.Rows.Count > 0)
            {
                for (int i = 0; i < dtPackages.Rows.Count; i++)
                {
                    PackageType.Add(dtPackages.Rows[i]["PackageTypeName"].ToString());
                }
            }
            return PackageType;
        }


        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchProducts()
        {
            List<string> Product = new List<string>();
            ProductDML dmlProducts = new ProductDML();
            DataTable dtProducts = dmlProducts.GetProductService();
            if (dtProducts.Rows.Count > 0)
            {
                for (int i = 0; i < dtProducts.Rows.Count; i++)
                {
                    Product.Add(dtProducts.Rows[i]["ProductString"].ToString());
                }
            }
            return Product;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [WebMethod]
        public static List<string> SearchVehicle()
        {
            List<string> Vehicle = new List<string>();
            VehicleDML dmlVehicle = new VehicleDML();
            DataTable dtVehicle = dmlVehicle.GetVehicleWithBrokerService();
            if (dtVehicle.Rows.Count > 0)
            {
                for (int i = 0; i < dtVehicle.Rows.Count; i++)
                {
                    Vehicle.Add(dtVehicle.Rows[i]["VehicleRegNo"].ToString());
                }
            }
            return Vehicle;
        }


        #endregion

        #region Events

        #region Linkbutton's Events

        protected void lnkSaveProduct_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtProduct.Text == string.Empty)
                {
                    notification("Error", "Please Fill Product Name");
                    txtProduct.Focus();
                }
                else
                {
                    ConfirmSaveCompany("Are you sure you want to save Product?", "Product");
                }
            }
            catch (Exception ex)
            {
                notification("Error", ex.Message);
            }
        }

        protected void lnkSaveRow_Click(object sender, EventArgs e)
        {
            try
            {
                string[] partyString = txtPartyNameAddress.Text.Split('|');
                string[] product = txtProduct.Text.Split('|');
                //string[] vehicle = txtVehicleRegNo.Text.Split('|');
                if (txtSearchSender.Text == string.Empty)
                {
                    notification("Error", "Please select Sender");
                    txtSearchSender.Focus();
                }
                else if (txtQty.Text == string.Empty)
                {
                    notification("Error", "Please enter Quantity");
                    txtQty.Focus();
                }
                else if (txtPackageType.Text == string.Empty)
                {
                    notification("Error", "Please enter Package Type");
                    txtPackageType.Focus();
                }
                else if (txtPartyNameAddress.Text == string.Empty)
                {
                    notification("Error", "Please enter Party Name");
                    txtPartyNameAddress.Focus();
                }
                else
                {
                    string[] PartyNameString = txtPartyNameAddress.Text.Split('|');
                    string[] PackageTypeString = txtPackageType.Text.Split('|');
                    if (PartyNameString.Length <= 1)
                    {
                        notification("Error", "No such company found in directory, please save this company to preceed work order");
                        txtPartyNameAddress.Focus();
                    }
                    else if (partyString.Length <= 1)
                    {
                        notification("Error", "No such Receiver Company found in directory, please save this Company to preceed work order");
                        txtPartyNameAddress.Focus();
                    }
                    else if (product.Length <= 1)
                    {
                        notification("Error", "No such product found in directory, please save this product to preceed work order");
                        txtProduct.Focus();
                    }
                    else if (partyString[1].ToString().Trim() == string.Empty)
                    {
                        notification("Error", "Kindly choose a valid Receiver Company");
                    }
                    else if (product[1].ToString().Trim() == string.Empty)
                    {
                        notification("Error", "Kindly choose a valid Product");
                    }
                    else
                    {
                        Int64 Qty = txtQty.Text == string.Empty ? 0 : Convert.ToInt64(txtQty.Text);
                        string PackageType = txtPackageType.Text;
                        string PartyNameAddress = txtPartyNameAddress.Text;

                        string[] ProductString = txtProduct.Text.Split('|');
                        string Product = txtProduct.Text;
                        double ProductWeight = Convert.ToDouble(ProductString[1]);
                        double Weight = Convert.ToDouble(txtProductWeight.Text.Trim());
                        string Account = txtAccount.Text;
                        double Freight = txtFreight.Text == string.Empty ? 0 : Convert.ToDouble(txtFreight.Text);
                        string VehicleRegNo = txtVehicleRegNo.Text;
                        double Advance = txtAdvance.Text == string.Empty ? 0 : Convert.ToDouble(txtAdvance.Text);
                        string sortExpression = "VehicleRegNo";
                        if (hfEditID.Value != string.Empty)
                        {
                            int EditIndex = Convert.ToInt32(hfEditID.Value);
                            Label lblQty = gvResult.Rows[EditIndex].Cells[1].FindControl("lblBags") as Label;
                            Label lblPackageType = gvResult.Rows[EditIndex].Cells[2].FindControl("lblPackageType") as Label;
                            Label lblPartyNameAddress = gvResult.Rows[EditIndex].Cells[3].FindControl("lblPartyAddress") as Label;
                            Label lblProduct = gvResult.Rows[EditIndex].Cells[4].FindControl("lblProduct") as Label;
                            Label lblWeight = gvResult.Rows[EditIndex].Cells[5].FindControl("lblWeight") as Label;
                            Label lblAccount = gvResult.Rows[EditIndex].Cells[6].FindControl("lblAccount") as Label;
                            Label lblFreight = gvResult.Rows[EditIndex].Cells[7].FindControl("lblFreight") as Label;
                            Label lblTruck = gvResult.Rows[EditIndex].Cells[8].FindControl("lblTruck") as Label;
                            Label lblAdvance = gvResult.Rows[EditIndex].Cells[9].FindControl("lblAdvance") as Label;
                            lblQty.Text = txtQty.Text;
                            lblPackageType.Text = txtPackageType.Text;
                            lblPartyNameAddress.Text = txtPartyNameAddress.Text;
                            lblProduct.Text = txtProduct.Text;
                            lblWeight.Text = txtProductWeight.Text;
                            lblAccount.Text = txtAccount.Text;
                            lblFreight.Text = txtFreight.Text;
                            lblTruck.Text = txtVehicleRegNo.Text;
                            lblAdvance.Text = txtAdvance.Text;
                            txtQty.Text = string.Empty;
                            txtPackageType.Text = string.Empty;
                            txtPartyNameAddress.Text = string.Empty;
                            txtProductWeight.Text = string.Empty;
                            txtProduct.Text = string.Empty;
                            txtAccount.Text = string.Empty;
                            txtFreight.Text = string.Empty;
                            txtVehicleRegNo.Text = string.Empty;
                            txtAdvance.Text = string.Empty;
                        }
                        else
                        {
                            DataTable dtWO = new DataTable();
                            dtWO.Columns.Add("BiltyID");
                            dtWO.Columns.Add("WorkOrderID");
                            dtWO.Columns.Add("WorkOrderDetailsID");
                            dtWO.Columns.Add("ProductQty");
                            dtWO.Columns.Add("PackageTypeString");
                            dtWO.Columns.Add("ReceiverCompany");
                            dtWO.Columns.Add("Product");
                            dtWO.Columns.Add("Weight");
                            dtWO.Columns.Add("Account");
                            dtWO.Columns.Add("Freight");
                            dtWO.Columns.Add("VehicleRegNo");
                            dtWO.Columns.Add("Advance");
                            dtWO.Columns.Add("Operations");
                            Label lblAssignTruck = new Label();
                            string grdAssignTruck = string.Empty;

                            if (gvResult.Rows.Count > 0)
                            {
                                lblAssignTruck = gvResult.Rows[0].Cells[8].FindControl("lblTruck") as Label;
                                grdAssignTruck = lblAssignTruck.Text.Replace("&nbsp;", string.Empty);
                                foreach (GridViewRow _gvrWO in gvResult.Rows)
                                {
                                    Label lblQty = _gvrWO.Cells[1].FindControl("lblBags") as Label;
                                    Label lblPackageType = _gvrWO.Cells[2].FindControl("lblPackageType") as Label;
                                    Label lblPartyNameAddress = _gvrWO.Cells[3].FindControl("lblPartyAddress") as Label;
                                    Label lblProduct = _gvrWO.Cells[4].FindControl("lblProduct") as Label;
                                    Label lblWeight = _gvrWO.Cells[5].FindControl("lblWeight") as Label;
                                    Label lblAccount = _gvrWO.Cells[6].FindControl("lblAccount") as Label;
                                    Label lblFreight = _gvrWO.Cells[7].FindControl("lblFreight") as Label;
                                    Label lblTruck = _gvrWO.Cells[8].FindControl("lblTruck") as Label;
                                    Label lblAdvance = _gvrWO.Cells[9].FindControl("lblAdvance") as Label;

                                    string gridQty = lblQty.Text.Replace("&nbsp;", string.Empty);
                                    string gridPackageType = lblPackageType.Text.Replace("&nbsp;", string.Empty);
                                    string gridPartyNameAddress = lblPartyNameAddress.Text.Replace("&nbsp;", string.Empty);
                                    string gridProduct = lblProduct.Text.Replace("&nbsp;", string.Empty);
                                    string gridWeight = lblWeight.Text.Replace("&nbsp;", string.Empty);
                                    string gridAccount = lblAccount.Text.Replace("&nbsp;", string.Empty);
                                    string gridFreight = lblFreight.Text.Replace("&nbsp;", string.Empty);
                                    string gridTruck = lblTruck.Text.Replace("&nbsp;", string.Empty);
                                    string gridAdvance = lblAdvance.Text.Replace("&nbsp;", string.Empty);

                                    dtWO.Rows.Add(
                                        "0",
                                        _gvrWO.Cells[0].Text,
                                        "0",
                                        gridQty,
                                        gridPackageType,
                                        gridPartyNameAddress,
                                        gridProduct,
                                        gridWeight,
                                        gridAccount,
                                        gridFreight,
                                        gridTruck,
                                        gridAdvance,
                                        _gvrWO.Cells[9].Text
                                    );
                                }
                            }

                            if (grdAssignTruck != string.Empty)
                            {

                                dtWO.Rows.Add(
                                      "0",
                                      string.Empty,
                                      "0",
                                      Qty,
                                      PackageType,
                                      PartyNameAddress,
                                      Product,
                                      Weight,
                                      Account,
                                      Freight,
                                      VehicleRegNo,
                                      Advance,
                                      string.Empty
                                  );
                                try
                                {
                                    txtQty.Text = string.Empty;
                                    txtPackageType.Text = string.Empty;
                                    //txtPartyNameAddress.Text = string.Empty;
                                    txtProduct.Text = string.Empty;
                                    txtProductWeight.Text = string.Empty;
                                    txtAccount.Text = string.Empty;
                                    txtFreight.Text = string.Empty;
                                    txtVehicleRegNo.Text = string.Empty;
                                    txtAdvance.Text = string.Empty;

                                }
                                catch (Exception ex)
                                {
                                    notification("Error", "Error clearing fields, due to: " + ex.Message);
                                }
                                txtQty.Focus();
                            }
                            else
                            {
                                dtWO.Rows.Add(
                                    "0",
                                          string.Empty,
                                          "0",
                                          Qty,
                                          PackageType,
                                          PartyNameAddress,
                                          Product,
                                          Weight,
                                          Account,
                                          Freight,
                                          VehicleRegNo,
                                          Advance,
                                          string.Empty
                                      );
                                try
                                {
                                    txtQty.Text = string.Empty;
                                    txtSearchBillto.ReadOnly = true;
                                    txtPackageType.Text = string.Empty;
                                    txtPartyNameAddress.Text = string.Empty;
                                    txtProduct.Text = string.Empty;
                                    txtProductWeight.Text = string.Empty;
                                    txtAccount.Text = string.Empty;
                                    txtFreight.Text = string.Empty;
                                    txtVehicleRegNo.Text = string.Empty;
                                    txtAdvance.Text = string.Empty;

                                }
                                catch (Exception ex)
                                {
                                    notification("Error", "Error clearing fields, due to: " + ex.Message);
                                }
                                txtQty.Focus();
                            }

                            if (sortExpression != null)
                            {
                                DataView dv = dtWO.AsDataView();
                                this.SortDirection = "ASC";

                                dv.Sort = sortExpression + " " + this.SortDirection;
                                gvResult.DataSource = dv;
                                Session["WODetails"] = dv;
                            }
                            else
                            {
                                gvResult.DataSource = dtWO;
                                Session["WODetails"] = dtWO;
                            }

                            DataTable dtTotal = new DataTable();
                            dtTotal.Columns.Add("Total");
                            dtTotal.Columns.Add("Qty");
                            dtTotal.Columns.Add("Weight");
                            dtTotal.Columns.Add("Freight");
                            dtTotal.Columns.Add("Advance");
                            string Total = "Total";
                            double TotalQty = 0;
                            double TotalWegith = 0;
                            double TotalFreight = 0;
                            double TotalAdvance = 0;
                            for (int i = 0; i < dtWO.Rows.Count; i++)
                            {
                                TotalQty += dtWO.Rows[i]["ProductQty"].ToString().Trim() == string.Empty ? 0 : Convert.ToDouble(dtWO.Rows[i]["ProductQty"]);
                                TotalWegith += dtWO.Rows[i]["Weight"].ToString().Trim() == string.Empty ? 0 : Convert.ToDouble(dtWO.Rows[i]["Weight"]);
                                TotalFreight += dtWO.Rows[i]["Freight"].ToString().Trim() == string.Empty ? 0 : Convert.ToDouble(dtWO.Rows[i]["Freight"]);
                                TotalAdvance += dtWO.Rows[i]["Advance"].ToString().Trim() == string.Empty ? 0 : Convert.ToDouble(dtWO.Rows[i]["Advance"]);
                            }
                            dtTotal.Rows.Add(Total, TotalQty, TotalWegith, TotalFreight, TotalAdvance);
                            gvTotalResult.DataSource = dtTotal.Rows.Count > 0 ? dtTotal : null;
                            //gvResult.DataSource = dtWO;
                            gvResult.DataBind();
                            gvTotalResult.DataBind();



                        }
                    }
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error saving work order, due to: " + ex.Message);
            }
        }

        protected void lnkSaveSender_Click(object sender, EventArgs e)
        {
            try
            {
                ConfirmSaveCompany("Are you sure you want to make Company automatically", "SaveSenderCompany");
            }
            catch (Exception ex)
            {
                notification("Error", "Error confirming to save sender company, due to: " + ex.Message);
            }
        }

        protected void lnkSaveNewParty_Click(object sender, EventArgs e)
        {
            try
            {
                ConfirmSaveCompany("Are you sure you want to make Company automatically", "SaveReceiverCompany");
            }
            catch (Exception ex)
            {
                notification("Error", "Error confirming to save receiver sompany, due to: " + ex.Message);
            }
        }

        public DataTable GetBrokerByName(string Name)
        {
            BrokersDML dmlBroker = new BrokersDML();
            DataTable dtBroker = dmlBroker.GetBrokerByName(Name);
            if (dtBroker.Rows.Count > 0)
            {
                return dtBroker;
            }
            else
            {
                CodeGenerator cg = new CodeGenerator();
                string code = cg.generateCode(Name);
                int status = dmlBroker.InsertBroker(code, Name, LoginID);
                if (status > 0)
                {
                    dtBroker = dmlBroker.GetBrokerByName(Name);
                    return dtBroker;
                }
                return dtBroker;
            }
        }

        protected void lnkConfirmSaveNewCompany_Click(object sender, EventArgs e)
        {
            try
            {
                if (hfConfirmAction.Value == "SaveSenderCompany")
                {
                    RegisterNewCompany(txtSearchSender);
                    //string[] SenderString = txtSearchSender.Text.Split('|');
                    ////Int64 SenderCompanyID = 0;
                    //string NewCompanyName = SenderString[0].ToString().Trim();
                    //Random rnd = new Random();
                    //string Code = rnd.Next(9999).ToString();
                    //OrderDML dmlOrder = new OrderDML();
                    //Int64 GroupID = 0;
                    //GroupDML dmlGroup = new GroupDML();
                    //string GroupCode = "WOG123";
                    //string GroupName = "Work Order Group";
                    //DataTable dtGroup = dmlGroup.GetGroup(GroupCode, GroupName);
                    //if (dtGroup.Rows.Count > 0)
                    //{
                    //    GroupID = Convert.ToInt64(dtGroup.Rows[0]["GroupID"]);
                    //}
                    //else
                    //{
                    //    GroupID = dmlGroup.InsertGroup(GroupCode, GroupName, "Created automatically from Work Order", LoginID);
                    //}

                    //if (GroupID > 0)
                    //{
                    //    CompanyDML dml = new CompanyDML();
                    //    Int64 CompanyID = dml.InsertCompany(Code, NewCompanyName,"Karachi", GroupID, "Created automatic from WorkOrder", LoginID);
                    //    if (CompanyID > 0)
                    //    {
                    //        notification("Success", "New  Company Created in Directory");
                    //        DataTable dtCompany = dmlOrder.GetCompanies(NewCompanyName);
                    //        txtSearchSender.Text = dtCompany.Rows[0]["Company"].ToString();
                    //    }
                    //}
                    //else
                    //{
                    //    notification("Error", "Error auto selecting VehicleType for auto save Vehicle");
                    //}
                }
                if (hfConfirmAction.Value == "SaveReceiverCompany")
                {
                    RegisterNewCompany(txtPartyNameAddress);
                    //string[] SenderString = txtPartyNameAddress.Text.Split('|');
                    //Random rnd = new Random();
                    //string Code = rnd.Next(9999).ToString();
                    //OrderDML dmlOrder = new OrderDML();
                    //Int64 GroupID = 0;
                    //GroupDML dmlGroup = new GroupDML();
                    //string GroupCode = "WOG123";
                    //string GroupName = "Work Order Group";
                    //DataTable dtGroup = dmlGroup.GetGroup(GroupCode, GroupName);
                    //if (dtGroup.Rows.Count > 0)
                    //{
                    //    GroupID = Convert.ToInt64(dtGroup.Rows[0]["GroupID"]);
                    //}
                    //else
                    //{
                    //    GroupID = dmlGroup.InsertGroup(GroupCode, GroupName, "Created automatically from Work Order", LoginID);
                    //}
                    //if (SenderString.Length > 1)
                    //{
                    //    if (SenderString[1].Trim() == string.Empty)
                    //    {
                    //        string NewCompanyName = SenderString[0].ToString().Trim();
                    //        if (GroupID > 0)
                    //        {
                    //            CompanyDML dml = new CompanyDML();
                    //            Int64 CompanyID = dml.InsertCompany(Code, NewCompanyName, "Karachi", GroupID, "Created automatic from WorkOrder", LoginID);
                    //            if (CompanyID > 0)
                    //            {
                    //                notification("Success", "New  Company Created in Directory");
                    //                DataTable dtCompany = dmlOrder.GetCompanies(NewCompanyName);
                    //                txtPartyNameAddress.Text = dtCompany.Rows[0]["CompanyAddress"].ToString();
                    //            }
                    //        }
                    //        else
                    //        {
                    //            notification("Error", "Error auto selecting VehicleType for auto save Vehicle");
                    //        }
                    //    }
                    //    else
                    //    {
                    //        string NewCompanyName = SenderString[0].ToString().Trim();
                    //        string address = SenderString[1].ToString().Trim();
                    //        if (GroupID > 0)
                    //        {
                    //            CompanyDML dml = new CompanyDML();
                    //            Int64 CompanyID = dml.InsertCompany(Code, NewCompanyName, address, GroupID, "Created automatic from WorkOrder", LoginID);
                    //            if (CompanyID > 0)
                    //            {
                    //                notification("Success", "New  Company Created in Directory");
                    //                DataTable dtCompany = dmlOrder.GetCompanies(NewCompanyName);
                    //                txtPartyNameAddress.Text = dtCompany.Rows[0]["CompanyAddress"].ToString();
                    //            }
                    //        }
                    //        else
                    //        {
                    //            notification("Error", "Error auto selecting VehicleType for auto save Vehicle");
                    //        }
                    //    }
                    //}
                    //else
                    //{
                    //    string NewCompanyName = SenderString[0].ToString().Trim();
                    //    if (GroupID > 0)
                    //    {
                    //        CompanyDML dml = new CompanyDML();
                    //        Int64 CompanyID = dml.InsertCompany(Code, NewCompanyName, "Karachi", GroupID, "Created automatic from WorkOrder", LoginID);
                    //        if (CompanyID > 0)
                    //        {
                    //            notification("Success", "New  Company Created in Directory");
                    //            DataTable dtCompany = dmlOrder.GetCompanies(NewCompanyName);
                    //            txtPartyNameAddress.Text = dtCompany.Rows[0]["CompanyAddress"].ToString();
                    //        }
                    //    }
                    //    else
                    //    {
                    //        notification("Error", "Error auto selecting VehicleType for auto save Vehicle");
                    //    }
                    //}



                }
                if (hfConfirmAction.Value == "PackageType")
                {
                    string[] PackageTypeString = txtPackageType.Text.Split('|');
                    string NewPackgeTypeName = PackageTypeString[0].ToString().Trim();
                    Random rnd = new Random();
                    string Code = rnd.Next(9999).ToString();
                    PackagingTypeDML dmlPackageType = new PackagingTypeDML();
                    Int64 PackageTypeID = dmlPackageType.InsertPackage(Code, NewPackgeTypeName, "Created from WorkOrder", LoginID);
                    if (PackageTypeID > 0)
                    {
                        notification("Success", "New Vehicle Type Created in Directory");
                        DataTable dtPackageType = dmlPackageType.GetPackage(NewPackgeTypeName);
                        txtPackageType.Text = dtPackageType.Rows[0]["PackageTypeString"].ToString();
                    }
                }
                if (hfConfirmAction.Value == "Product")
                {
                    string NewProductName = txtProduct.Text.Trim();
                    double weight = 0;

                    string Code = rnd.Next(9999).ToString();
                    //char Code = (char)rnd.Next(62,90);
                    PackagingTypeDML dmlPackage = new PackagingTypeDML();
                    DataTable dtPackage = dmlPackage.GetPackageByName("Work Order Packaging");
                    Int64 PackageTypeID = Convert.ToInt64(dtPackage.Rows[0]["PackageTypeID"]);

                    ProductDML dmlProduct = new ProductDML();
                    Int64 status = dmlProduct.InsertProductFromWorkOrder(NewProductName, Code.ToString(), weight, PackageTypeID, LoginID);
                    if (status > 0)
                    {
                        notification("Success", "New Product Created in Directory");
                        DataTable dtProduct = dmlProduct.GetProduct(Code.ToString(), NewProductName);
                        string[] ProductAndWeight = { dtProduct.Rows[0]["Name"].ToString(), " | ", dtProduct.Rows[0]["Weight"].ToString() };
                        txtProduct.Text = ProductAndWeight.ToString();
                    }
                }
                if (hfConfirmAction.Value == "VehicleRegistration")
                {
                    string VehicleRegNo = txtVehicleRegNo.Text.Trim();
                    Int64 BrokerID = 0;
                    string code = rnd.Next(99999).ToString();
                    DataTable dt = GetBrokerByName("SA Shah");
                    BrokerID = Convert.ToInt64(dt.Rows[0]["ID"]);
                    VehicleTypeDML dmlVehicleType = new VehicleTypeDML();
                    Int64 VehicleTypeID = 0;
                    DataTable dtVehicleType = dmlVehicleType.GetVehicleType("Work Order Type");
                    if (dtVehicleType.Rows.Count > 0)
                    {
                        VehicleTypeID = Convert.ToInt64(dtVehicleType.Rows[0]["VehicleTypeID"]);
                    }
                    else
                    {
                        VehicleTypeID = dmlVehicleType.InsertVehicleTypeWorkOrder("WOT", "Work Order Type", LoginID);

                    }
                    VehicleDML dmlVehicle = new VehicleDML();
                    dmlVehicle.InsertVehicle(code, VehicleRegNo, VehicleTypeID, BrokerID, LoginID);

                    notification("Success", "New Vehicle Created in Directory");
                    DataTable dtVehicleDetails = dmlVehicle.GetVehicleWithBroker(VehicleRegNo);
                    txtVehicleRegNo.Text = dtVehicleDetails.Rows[0]["VehicleRegNo"].ToString();
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error automatic creating new Vehicle, due to: " + ex.Message);
            }
        }

        protected void lnkSavePackageType_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPackageType.Text == string.Empty)
                {
                    notification("Error", "Please provide Package Type name");
                    txtPackageType.Focus();
                }
                else
                {
                    ConfirmSaveCompany("Are you sure you want to save Package Type?", "PackageType");
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error saving Package type, due to: " + ex.Message);
            }
        }

        protected void lnkAddBillTo_Click(object sender, EventArgs e)
        {
            try
            {
                ConfirmSaveCompany("Are you sure you want to make Company automatically", "SaveReceiverCompany");
            }
            catch (Exception ex)
            {
                notification("Error", "Error confirming to save receiver sompany, due to: " + ex.Message);
            }
        }

        protected void lnkSaveWorkOrder_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearchSender.Text == string.Empty)
                {
                    notification("Error", "Please select Sender");
                    txtSearchSender.Focus();
                }
                else if (txtDeliveryDate.Text == string.Empty)
                {
                    notification("Error", "Please select Delivery Date");
                    txtDeliveryDate.Focus();
                }
                else
                {
                    string[] SenderString = txtSearchSender.Text.Split('|');
                    if (SenderString.Length > 1)
                    {
                        string WorkOrderNo = rnd.Next().ToString();
                        string Name = SenderString[0];
                        Int64 SenderID = GetCompanyID(Name);
                        string Description = txtWorkOrderDescription.Text;
                        string DeliveryDate = txtDeliveryDate.Text;
                        string EditDeliveryDate = lblDeliveryDate.Text;
                        WorkOrderDML dml = new WorkOrderDML();
                        Int64 WorkOrderID = 0;
                        if (EditOrderID > 0)
                        {
                            DeliveryDate = txtDeliveryDate.Text == string.Empty ? lblDeliveryDate.Text : txtDeliveryDate.Text;
                            WorkOrderID = EditOrderID;
                            dml.UpdateWorkOrder(SenderID, Description, DeliveryDate, LoginID, WorkOrderID);
                            dml.DeleteWorkDetails(WorkOrderID);
                        }
                        else
                        {
                            WorkOrderID = dml.InsertWorkOrders(WorkOrderNo, SenderID, Description, DeliveryDate, LoginID);
                        }


                        if (WorkOrderID > 0)
                        {
                            foreach (GridViewRow _gvrWO in gvResult.Rows)
                            {
                                Label lblQty = _gvrWO.Cells[1].FindControl("lblBags") as Label;
                                Label lblPackageType = _gvrWO.Cells[2].FindControl("lblPackageType") as Label;
                                Label lblReceiver = _gvrWO.Cells[3].FindControl("lblPartyAddress") as Label;
                                Label lblProduct = _gvrWO.Cells[4].FindControl("lblProduct") as Label;
                                Label lblWeight = _gvrWO.Cells[5].FindControl("lblWeight") as Label;
                                Label lblAccount = _gvrWO.Cells[6].FindControl("lblAccount") as Label;
                                Label lblFreight = _gvrWO.Cells[8].FindControl("lblFreight") as Label;
                                Label lblVehicleRegNo = _gvrWO.Cells[8].FindControl("lblTruck") as Label;
                                Label lblAdvance = _gvrWO.Cells[9].FindControl("lblAdvance") as Label;

                                string[] productname = lblProduct.Text.Split('|');

                                Int64 ProductID = getProductID(productname[0]);

                                Int64 Qty = lblQty.Text == string.Empty ? 0 : Convert.ToInt64(lblQty.Text);

                                //string[] PackageTypeString = lblPackageType.Text.Split('|');
                                //string PackageTypeCode = PackageTypeString[0].Trim();
                                string PackageTypeName = lblPackageType.Text;
                                Int64 PackageTypeID = GetPackageTypeID("0", PackageTypeName);


                                //string[] ProductString = txtProduct.Text.Split('|');
                                //Int64 ProductID = 0;
                                string Product = txtProduct.Text;
                                double TotalWeight = Convert.ToDouble(lblWeight.Text);


                                string ReceiverName = string.Empty;
                                Int64 ReceiverID = 0;
                                if (lblReceiver.Text != string.Empty)
                                {
                                    string[] ReceiverString = lblReceiver.Text.Split('|');
                                    ReceiverName = ReceiverString[0];
                                    ReceiverID = GetCompanyID(ReceiverName);
                                }

                                Int64 CustomerID = 0;
                                if (lblReceiver.Text != string.Empty)
                                {
                                    string[] biltoString = txtSearchBillto.Text.Split('|');
                                    string CustomerName = biltoString[0];
                                    CustomerID = GetCompanyID(CustomerName);
                                }


                                string AccountName = lblAccount.Text;
                                double Freight = Convert.ToInt64(lblFreight.Text);
                                string Truck = lblVehicleRegNo.Text;
                                double Advance = Convert.ToInt64(lblAdvance.Text);

                                Int64 WorkOrderDetailsID = dml.InsertWorkOrderDetails(WorkOrderID, Qty, PackageTypeID, ProductID, TotalWeight, ReceiverID, CustomerID, AccountName, Freight, Truck, Advance, LoginID);
                            }
                            Response.Redirect("WorkOrder.aspx");
                        }
                    }
                    else
                    {
                        notification("Error", "No such Company found in Directory, please save it to proceed work order.");
                        txtSearchSender.Focus();
                    }
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error saving Work Order, due to: " + ex.Message);
            }
        }

        protected void lnkBilty_Click(object sender, EventArgs e)
        {

            try
            {
                makeBiltyStatus.Text = "BulkMakeBilty";
                modalMakeBilty.Show();

            }
            catch (Exception ex)
            {
                notification("Error", ex.Message);
            }

        }

        protected void lnkClose_Click(object sender, EventArgs e)
        {

        }

        protected void lnkCreateBilty_Click(object sender, EventArgs e)
        {
            if (makeBiltyStatus.Text == "BulkMakeBilty")
            {
                try
                {
                    DataTable dtMakeBilty = new DataTable();
                    if (gvResult.Rows.Count > 0)
                    {
                        dtMakeBilty.Columns.Add(new DataColumn("Bags", typeof(string)));
                        dtMakeBilty.Columns.Add(new DataColumn("PackageType", typeof(string)));
                        dtMakeBilty.Columns.Add(new DataColumn("PartyAddress", typeof(string)));
                        dtMakeBilty.Columns.Add(new DataColumn("Product", typeof(string)));
                        dtMakeBilty.Columns.Add(new DataColumn("Weight", typeof(string)));
                        dtMakeBilty.Columns.Add(new DataColumn("Account", typeof(string)));
                        dtMakeBilty.Columns.Add(new DataColumn("Freight", typeof(string)));
                        dtMakeBilty.Columns.Add(new DataColumn("Truck", typeof(string)));
                        dtMakeBilty.Columns.Add(new DataColumn("Advance", typeof(string)));
                        DataRow dr;
                        for (int i = 0; i < gvResult.Rows.Count; i++)
                        {
                            GridViewRow gvRow = gvResult.Rows[i];
                            int biltyID = Convert.ToInt32(gvResult.DataKeys[i]["BiltyID"]);
                            if (biltyID == 0)
                            {
                                Label lblQty = gvRow.Cells[1].FindControl("lblBags") as Label;
                                Label lblPackageType = gvRow.Cells[2].FindControl("lblPackageType") as Label;
                                Label lblReceiver = gvRow.Cells[3].FindControl("lblPartyAddress") as Label;
                                Label lblProduct = gvRow.Cells[4].FindControl("lblProduct") as Label;
                                Label lblWeight = gvRow.Cells[5].FindControl("lblWeight") as Label;
                                Label lblAccount = gvRow.Cells[6].FindControl("lblAccount") as Label;
                                Label lblFreight = gvRow.Cells[7].FindControl("lblFreight") as Label;
                                Label lblVehicleRegNo = gvRow.Cells[8].FindControl("lblTruck") as Label;
                                Label lblAdvance = gvRow.Cells[9].FindControl("lblAdvance") as Label;
                                dr = dtMakeBilty.NewRow();
                                dr[0] = lblQty.Text;
                                dr[1] = lblPackageType.Text;
                                dr[2] = lblReceiver.Text;
                                dr[3] = lblProduct.Text;
                                dr[4] = lblWeight.Text;
                                dr[5] = lblAccount.Text;
                                dr[6] = lblFreight.Text;
                                dr[7] = lblVehicleRegNo.Text;
                                dr[8] = lblAdvance.Text;
                                dtMakeBilty.Rows.Add(dr);
                            }
                        }
                    }

                    DataView view = new DataView(dtMakeBilty);
                    DataTable newTable = view.ToTable(true, "PartyAddress", "Truck");
                    if (ddlPaidToPay.SelectedIndex == 0)
                    {
                        ModalNotification("Error", "Please Select Paid To Pay");
                    }
                    else if (ddlOwnCompany.SelectedIndex == 0)
                    {
                        ModalNotification("Error", "Please Select Own Company");
                    }
                    else
                    {
                        if (newTable.Rows.Count > 0)
                        {
                            foreach (DataRow _drBunches in newTable.Rows)
                            {
                                string Receiver = _drBunches["PartyAddress"].ToString();
                                string Vehicle = _drBunches["Truck"].ToString();

                                DataRow[] _drBunchData = dtMakeBilty.Select("PartyAddress = '" + Receiver + "' AND Truck = '" + Vehicle + "'");
                                if (_drBunches.ItemArray.Length > 0)
                                {
                                    string[] SenderString = txtSearchSender.Text.Trim().Split('|');
                                    Int64 SenderID = GetCompanyID(SenderString[0]);
                                    string[] BilltoCustomer = txtSearchBillto.Text.Trim().Split('|');
                                    Int64 CustomerID = GetCompanyID(BilltoCustomer[0]);
                                    string date = lblCurrentDate.Text;
                                    string deliveryDate;
                                    if (txtDeliveryDate.Text == string.Empty && txtDeliveryDate.Text == null)
                                    {
                                        deliveryDate = lblDeliveryDate.Text;
                                    }
                                    else
                                    {
                                        deliveryDate = txtDeliveryDate.Text;
                                    }
                                    Int64 workOrderID = Convert.ToInt64(Session["woID"]);
                                    string[] RecieverString = _drBunchData[0]["PartyAddress"].ToString().Split('|');
                                    Int64 RecieverID = GetCompanyID(RecieverString[0]);
                                    string VehicleNo = _drBunchData[0]["Truck"].ToString();
                                    Int64 OwnCompanyID = Convert.ToInt64(ddlOwnCompany.SelectedValue.Trim());
                                    string orderNo = rnd.Next(999999).ToString();
                                    string paidtopay = ddlPaidToPay.SelectedItem.Text.Trim().ToString();
                                    Int64 createdbyID = Convert.ToInt64(LoginID);
                                    WorkOrderDML dmlWorkOrder = new WorkOrderDML();
                                    int NewOrderID = dmlWorkOrder.InsertOrders(orderNo, date, deliveryDate, SenderID, RecieverID, CustomerID, SenderString[1], RecieverString[1], workOrderID, createdbyID, paidtopay, OwnCompanyID);


                                    if (NewOrderID > 0)
                                    {
                                        double SumofAdvances = 0;
                                        for (int i = 0; i < _drBunchData.Count(); i++)
                                        {
                                            string[] productname = _drBunchData[i]["Product"].ToString().Split('|');
                                            string[] packageType = _drBunchData[i]["PackageType"].ToString().Split('|');
                                            Int64 ProductID = getProductID(productname[0]);
                                            Int64 packageId = GetPackageID(packageType[0].Trim(), packageType[1].Trim());
                                            double freight = Convert.ToDouble(_drBunchData[i]["Freight"]);
                                            Int64 Qty = Convert.ToInt64(_drBunchData[i]["Bags"]);
                                            double weight = Convert.ToDouble(_drBunchData[i]["Weight"]);
                                            double advance = Convert.ToDouble(_drBunchData[i]["Advance"]);
                                            Int64 workOrderDetailId = Convert.ToInt64(gvResult.DataKeys[i]["WorkOrderDetailsID"]);
                                            dmlWorkOrder.updateOrderIDinWorkOrderDetails(workOrderID, NewOrderID, workOrderDetailId);
                                            SumofAdvances += advance;
                                            string Account = _drBunchData[i]["Account"].ToString().Trim();

                                            dmlWorkOrder.InsertOrderProduct(NewOrderID, workOrderID, ProductID, packageId, Qty, weight, freight, createdbyID, Account);
                                        }
                                        if (SumofAdvances > 0)
                                        {
                                            dmlWorkOrder.InsertOrderAdvance(NewOrderID, SumofAdvances, createdbyID);
                                        }
                                        if (VehicleNo.Trim() != string.Empty || VehicleNo.Trim() != "&nbsp;")
                                        {
                                            string[] RegNo = VehicleNo.Split('|');
                                            VehicleDML dmlVehicle = new VehicleDML();
                                            DataTable dtVehicleID = dmlVehicle.GetVehicleByRegNo(RegNo[0].Trim());
                                            Int64 VehicleID = Convert.ToInt64(dtVehicleID.Rows[0]["VehicleID"]);
                                            dmlWorkOrder.InsertOrderVehicle(NewOrderID, workOrderID, VehicleID);
                                        }

                                    }



                                }


                            }
                        }
                        Response.Redirect("~/Bilty/Search.aspx");
                    }
                }
                catch (Exception ex)
                {
                    notification("error", ex.Message);
                }
                finally
                {
                    modalMakeBilty.Show();
                }
            }
            else if (makeBiltyStatus.Text == "SingleVehicleBilty")
            {
                try
                {

                    if (ddlPaidToPay.SelectedIndex == 0)
                    {
                        ModalNotification("Error", "Please Select Paid To Pay");
                    }
                    else if (ddlOwnCompany.SelectedIndex == 0)
                    {
                        ModalNotification("Error", "Please Select Own Company");
                    }
                    else
                    {
                        if (gvMakeBilty.Rows.Count > 0)
                        {
                            try
                            {
                                string lblVehicleNo = gvMakeBilty.Rows[0].Cells[7].Text.ToString();
                                string lblPartyAddress = gvMakeBilty.Rows[0].Cells[2].Text.ToString();
                                string[] pickLoc = txtSearchSender.Text.Split('|');
                                string vehicleNo = lblVehicleNo.Trim();
                                Int64 workOrderID = Convert.ToInt64(Session["woID"]);
                                string orderNo = rnd.Next(999999).ToString();
                                Int64 senderId = GetCompanyID(pickLoc[0]);
                                string[] rcvLoc = lblPartyAddress.Trim().Split('|');
                                Int64 receiverID = GetCompanyID(rcvLoc[0]);
                                string[] billtoCustomer = txtSearchBillto.Text.Split('|');
                                Int64 customerID = GetCompanyID(billtoCustomer[0]);
                                string date = lblCurrentDate.Text;
                                Int64 OwnCompanyID = Convert.ToInt64(ddlOwnCompany.SelectedValue.Trim());
                                string deliveryDate;
                                if (txtDeliveryDate.Text == string.Empty && txtDeliveryDate.Text == null)
                                {
                                    deliveryDate = lblDeliveryDate.Text;
                                }
                                else
                                {
                                    deliveryDate = txtDeliveryDate.Text;
                                }
                                Int64 NewOrderID = 0;
                                string paidtopay = ddlPaidToPay.SelectedItem.Text.Trim();
                                Int64 createdbyID = Convert.ToInt64(LoginID);
                                WorkOrderDML dmlWorkOrder = new WorkOrderDML();
                                NewOrderID = dmlWorkOrder.InsertOrders(orderNo, date, deliveryDate, senderId, receiverID, customerID, pickLoc[1], rcvLoc[1], workOrderID, createdbyID, paidtopay, OwnCompanyID);
                                if (NewOrderID > 0)
                                {
                                    double SumofAdvances = 0;
                                    for (int i = 0; i < gvMakeBilty.Rows.Count; i++)
                                    {
                                        string lblProduct = gvMakeBilty.Rows[i].Cells[3].Text.ToString();
                                        string[] productname = lblProduct.Trim().Split('|');
                                        string lblPackageType = gvMakeBilty.Rows[i].Cells[1].Text.ToString();
                                        string[] packageType = lblPackageType.Trim().Split('|');
                                        Int64 ProductID = getProductID(productname[0]);
                                        Int64 packageId = GetPackageID(packageType[0].Trim(), packageType[1].Trim());
                                        string lblFreight = gvMakeBilty.Rows[i].Cells[6].Text.ToString();
                                        double freight = Convert.ToDouble(lblFreight.Trim());
                                        string lblBags = gvMakeBilty.Rows[i].Cells[0].Text.ToString();
                                        Int64 Qty = Convert.ToInt64(lblBags.Trim());
                                        string lblWeight = gvMakeBilty.Rows[i].Cells[0].Text.ToString();
                                        double weight = Convert.ToDouble(lblWeight.Trim());
                                        string lblAdvance = gvMakeBilty.Rows[i].Cells[0].Text.ToString();
                                        double advance = Convert.ToDouble(lblAdvance.Trim());
                                        string Account = string.Empty;
                                        Label lblAccount = gvMakeBilty.Rows[i].Cells[6].FindControl("lblAccount") as Label;
                                        if (lblAccount != null)
                                            Account = lblAccount.Text.Trim();
                                        Int64 workOrderDetailId = Convert.ToInt64(gvMakeBilty.DataKeys[i]["WorkOrderDetailsID"]);
                                        dmlWorkOrder.updateOrderIDinWorkOrderDetails(workOrderID, NewOrderID, workOrderDetailId);
                                        SumofAdvances += advance;

                                        dmlWorkOrder.InsertOrderProduct(NewOrderID, workOrderID, ProductID, packageId, Qty, weight, freight, createdbyID, Account);
                                    }
                                    if (SumofAdvances > 0)
                                    {
                                        dmlWorkOrder.InsertOrderAdvance(NewOrderID, SumofAdvances, createdbyID);
                                    }
                                    VehicleDML dmlVehicle = new VehicleDML();
                                    if (vehicleNo != string.Empty || vehicleNo != "&nbsp;")
                                    {
                                        string[] VehilceRegNo = vehicleNo.Split('|');
                                        DataTable dtVehicleID = dmlVehicle.GetVehicleByRegNo(VehilceRegNo[0]);
                                        Int64 VehicleID = Convert.ToInt64(dtVehicleID.Rows[0]["VehicleID"]);
                                        dmlWorkOrder.InsertOrderVehicle(NewOrderID, workOrderID, VehicleID);
                                    }
                                }
                                notification("Success", "Bilty created successfully");
                                ddlPaidToPay.ClearSelection();
                                ddlOwnCompany.ClearSelection();
                            }
                            catch (Exception ex)
                            {
                                notification("error", ex.Message);
                            }
                        }
                    }
                    Response.Redirect("~/Bilty/CreateWorkOrder.aspx");

                }
                catch (Exception ex)
                {
                    notification("Error", ex.Message);
                }
            }

        }

        protected void lnkPartialBiltyClose_Click(object sender, EventArgs e)
        {
            try
            {
                modalPartialBilty.Hide();
            }
            catch (Exception ex)
            {
                PartialBiltyNotification("Error", "Cannot Close Modal Due To: " + ex.Message);
            }
        }

        protected void lnkPartialBiltySave_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                PartialBiltyNotification("Error", ex.Message);
            }
            finally
            {
                modalPartialBilty.Show();
                modalDistribution.Show();
            }
        }

        protected void lnkDistribute_Click(object sender, EventArgs e)
        {
            try
            {
                modalDistribution.Show();
            }
            catch (Exception ex)
            {
                PartialBiltyNotification("Error", "Cannot Distribute Due To: " + ex.Message);
            }
            finally
            {
                modalPartialBilty.Show();
            }
        }

        protected void lnkDistributeSave_Click(object sender, EventArgs e)
        {
            try
            {
                Int64 qty = Convert.ToInt64(txtDistributeQty.Text.Trim());
                string VehicleNo = txtDistributeVehicle.Text.Trim();

                Int64 gvQty = Convert.ToInt64(gvPartialBilty.Rows[0].Cells[0].Text.Trim());
                string product = gvPartialBilty.Rows[0].Cells[1].Text.Trim();
                string truck = gvPartialBilty.Rows[0].Cells[2].Text.Trim();

                if (qty <= gvQty)
                {
                    try
                    {
                        if (VehicleNo == string.Empty)
                        {
                            DistributionNotification("Error", "Kindly Add Truck Number");
                        }
                        else
                        {
                            Int64 MarginQty = gvQty - qty;
                            DataTable dtPartialBiltyItems = new DataTable();
                            dtPartialBiltyItems.Columns.Add("Bags");
                            dtPartialBiltyItems.Columns.Add("Product");
                            dtPartialBiltyItems.Columns.Add("Truck");
                            dtPartialBiltyItems.Rows.Add(MarginQty, product, truck);
                            if (gvPartialBilty.Rows.Count > 1)
                            {
                                for (int i = 1; i <= gvPartialBilty.Rows.Count; i++)
                                {
                                    GridViewRow gvRow = gvPartialBilty.Rows[i];
                                    Int64 GridQty = Convert.ToInt64(gvRow.Cells[0].Text.Trim());
                                    string GridProducts = gvRow.Cells[1].Text.Trim();
                                    string GridVehicles = gvRow.Cells[2].Text.Trim();
                                    dtPartialBiltyItems.Rows.Add(GridQty, GridProducts, GridVehicles);
                                }
                                dtPartialBiltyItems.Rows.Add(qty, product, VehicleNo);
                            }
                            else
                            {
                                dtPartialBiltyItems.Rows.Add(qty, product, VehicleNo);
                            }

                            gvPartialBilty.DataSource = dtPartialBiltyItems;
                            gvPartialBilty.DataBind();
                            modalPartialBilty.Show();
                            modalDistribution.Show();
                        }
                    }
                    catch (Exception ex)
                    {
                        DistributionNotification("Error", ex.Message);
                    }
                    finally
                    {
                        modalPartialBilty.Show();
                        modalDistribution.Show();
                    }

                }
                else
                {
                    DistributionNotification("Error", "Given Quantity is Greater Then Actuall Quantity");
                    modalPartialBilty.Show();
                    modalDistribution.Show();
                }

            }
            catch (Exception ex)
            {
                DistributionNotification("Error", "Error Occured : " + ex.Message);
            }
            finally
            {
                modalPartialBilty.Show();
                modalDistribution.Show();
            }
        }

        protected void lnkDistributeClose_Click(object sender, EventArgs e)
        {
            try
            {
                modalDistribution.Hide();
            }
            catch (Exception ex)
            {
                DistributionNotification("Error", "Cannot Close Due To: " + ex.Message);
            }
            finally
            {
                modalPartialBilty.Show();
            }
        }

        protected void lnkVehicle_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtVehicleRegNo.Text == string.Empty)
                {
                    notification("Error", "Please provide Vehicle name");
                    txtVehicleRegNo.Focus();
                }
                else
                {
                    ConfirmSaveCompany("Are you sure you want to save Vehicle?", "VehicleRegistration");
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error saving Vehicle, due to: " + ex.Message);
            }
        }

        protected void lnkRecalculate_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtQty.Text != string.Empty)
                {
                    double quantity = Convert.ToDouble(txtQty.Text.Trim());
                    string[] ProductString = txtProduct.Text.Split('|');
                    double weight = Convert.ToDouble(ProductString[1]);
                    double TotalWeight = quantity * weight;
                    txtProductWeight.Text = TotalWeight.ToString();
                }
                else
                {
                    notification("Error", "Please Enter Quantity to Calculate");
                    txtQty.Focus();
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Cannot Recalculate due to : " + ex.Message);
            }
        }

        #endregion

        #region Gridview's Events

        protected void gvResult_DataBound(object sender, EventArgs e)
        {
            try
            {
                if (gvResult.Rows.Count > 1)
                {
                    for (int i = gvResult.Rows.Count - 1; i > 0; i--)
                    {
                        GridViewRow row = gvResult.Rows[i];
                        GridViewRow previousRow = gvResult.Rows[i - 1];

                        Label lblVehicleRegNo = row.Cells[8].FindControl("lblTruck") as Label;
                        Label lblPartyName = row.Cells[3].FindControl("lblPartyAddress") as Label;
                        Label lblVehicleRegNo2 = previousRow.Cells[8].FindControl("lblTruck") as Label;
                        Label lblPartyName2 = previousRow.Cells[3].FindControl("lblPartyAddress") as Label;


                        if (lblVehicleRegNo.Text.Trim() == lblVehicleRegNo2.Text.Trim() && lblPartyName.Text.Trim() == lblPartyName2.Text.Trim())
                        {
                            if (previousRow.Cells[8].RowSpan == 0)
                            {
                                if (row.Cells[8].RowSpan == 0)
                                {
                                    previousRow.Cells[8].RowSpan += 2;
                                    previousRow.Cells[3].RowSpan += 2;
                                }
                                else
                                {
                                    previousRow.Cells[8].RowSpan = row.Cells[8].RowSpan + 1;
                                    previousRow.Cells[3].RowSpan = row.Cells[3].RowSpan + 1;
                                }
                                row.Cells[8].Visible = false;
                                row.Cells[3].Visible = false;
                            }
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error binding work orders, due to: " + ex.Message);
            }

        }

        protected void gvResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Change")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow _gvrWO = gvResult.Rows[index];
                    Label lblQty = _gvrWO.Cells[1].FindControl("lblBags") as Label;
                    Label lblPackageType = _gvrWO.Cells[2].FindControl("lblPackageType") as Label;
                    Label lblReceiver = _gvrWO.Cells[3].FindControl("lblPartyAddress") as Label;
                    Label lblProduct = _gvrWO.Cells[4].FindControl("lblProduct") as Label;
                    Label lblWeight = _gvrWO.Cells[5].FindControl("lblWeight") as Label;
                    Label lblAccount = _gvrWO.Cells[6].FindControl("lblAccount") as Label;
                    Label lblFreight = _gvrWO.Cells[7].FindControl("lblFreight") as Label;
                    Label lblVehicleRegNo = _gvrWO.Cells[8].FindControl("lblTruck") as Label;
                    Label lblAdvance = _gvrWO.Cells[9].FindControl("lblAdvance") as Label;

                    hfEditID.Value = index.ToString();
                    txtProduct.Text = lblProduct.Text.Trim();
                    txtProductWeight.Text = lblWeight.Text.Trim();
                    txtQty.Text = lblQty.Text.Trim();
                    txtPackageType.Text = lblPackageType.Text.Trim();
                    txtPartyNameAddress.Text = lblReceiver.Text.Trim();
                    txtAccount.Text = lblAccount.Text.Trim();
                    txtFreight.Text = lblFreight.Text.Trim();
                    txtVehicleRegNo.Text = lblVehicleRegNo.Text.Trim();
                    txtAdvance.Text = lblAdvance.Text.Trim();
                }
                else if (e.CommandName == "SingleVehicleBilty")
                {
                    try
                    {
                        int index = Convert.ToInt32(e.CommandArgument);
                        GridViewRow _gvrWO = gvResult.Rows[index];
                        Label lblReceiver = _gvrWO.Cells[3].FindControl("lblPartyAddress") as Label;
                        Label lblVehicleNo = _gvrWO.Cells[7].FindControl("lblTruck") as Label;
                        DataTable dtWODetails = Session["WODetails"] as DataTable;
                        if (dtWODetails.Rows.Count > 0)
                        {
                            DataRow[] _drSesssionWODetails = dtWODetails.Select("ReceiverCompany = '" + lblReceiver.Text.Trim() + "' AND VehicleRegNo = '" + lblVehicleNo.Text.Trim() + "'");
                            DataTable dtWorkOrderDetails = new DataTable();
                            for (int i = 0; i < dtWODetails.Columns.Count; i++)
                            {
                                dtWorkOrderDetails.Columns.Add(dtWODetails.Columns[i].ColumnName.ToString());
                            }
                            if (_drSesssionWODetails.Length > 0)
                            {
                                for (int i = 0; i < _drSesssionWODetails.Length; i++)
                                {
                                    dtWorkOrderDetails.Rows.Add(_drSesssionWODetails[i].ItemArray);
                                }
                            }
                            gvMakeBilty.DataSource = dtWorkOrderDetails;
                        }
                        gvMakeBilty.DataBind();
                        makeBiltyStatus.Text = "SingleVehicleBilty";
                        modalMakeBilty.Show();
                    }
                    catch (Exception ex)
                    {
                        notification("Error", "Error making single vehicle bilty, due to: " + ex.Message);
                    }

                }
                else if (e.CommandName == "makePartialBilty")
                {

                    int index = Convert.ToInt32(e.CommandArgument);
                    DataTable dtSingleGridRow = new DataTable();
                    GridViewRow gvRow = gvResult.Rows[index];
                    Label Qty = gvRow.Cells[1].FindControl("lblBags") as Label;
                    Label Product = gvRow.Cells[4].FindControl("lblProduct") as Label;
                    Label VehicleNo = gvRow.Cells[8].FindControl("lblTruck") as Label;
                    dtSingleGridRow.Columns.Add("Bags");
                    dtSingleGridRow.Columns.Add("Product");
                    dtSingleGridRow.Columns.Add("Truck");
                    dtSingleGridRow.Rows.Add(Qty.Text.Trim(), Product.Text.Trim(), VehicleNo.Text.Trim());
                    gvPartialBilty.DataSource = dtSingleGridRow;
                    gvPartialBilty.DataBind();
                    modalDistribution.Hide();
                    modalPartialBilty.Show();

                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error commanding row, due to: " + ex.Message);
            }
        }

        protected void gvResult_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (EditOrderID > 0 && EditOrderID != null)
            {

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    int index = Convert.ToInt32(e.Row.RowIndex);
                    Int64 OrderID = Convert.ToInt64(gvResult.DataKeys[index]["BiltyID"]);
                    LinkButton lnkSingleBilty = e.Row.FindControl("lnkMakeSingleVehicleBilty") as LinkButton;
                    if (OrderID > 0)
                    {
                        // e.Row.FindControl("lnkMakeSingleVehicleBilty").Visible = false;
                        lnkSingleBilty.Visible = false;
                    }
                    else
                    {
                        //e.Row.FindControl("lnkMakeSingleVehicleBilty").Visible = true;
                        lnkSingleBilty.Visible = true;
                    }
                }
            }
        }

        public void CheckOrderIDToHideBiltyButton()
        {
            try
            {
                int count = 0;
                for (int i = 0; i < gvResult.Rows.Count; i++)
                {
                    int orderID = Convert.ToInt32(gvResult.DataKeys[i]["BiltyID"]);
                    if (orderID > 0)
                    {
                        count++;
                        orderID = 0;
                    }
                }
                if (count == gvResult.Rows.Count)
                {
                    lnkBilty.Visible = false;
                }
                else
                {
                    lnkBilty.Visible = true;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvInput_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    e.Row.Cells[0].Text = "Serial";

                    e.Row.Cells[0].Width = 125;
                    e.Row.Cells[1].Width = new Unit("10%");
                    e.Row.Cells[2].Width = new Unit("10%");
                    e.Row.Cells[3].Width = new Unit("30%");
                    e.Row.Cells[4].Width = new Unit("10%");
                    e.Row.Cells[5].Width = new Unit("10%");
                    e.Row.Cells[6].Width = new Unit("10%");
                    e.Row.Cells[7].Width = new Unit("10%");
                    gvInputRowBindingIndex = 0;
                }
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    if (gvInputRowBindingIndex == 0)
                    {
                        MakefirstRowEditable(e);
                        gvInputRowBindingIndex++;
                    }
                    else
                    {
                        LinkButton lnkView = new LinkButton();
                        lnkView.ID = "lnkView";
                        lnkView.CommandName = "ViewWO";

                        LinkButton lnkEdit = new LinkButton();
                        lnkEdit.ID = "lnkEdit";
                        lnkEdit.CommandName = "EditWO";

                        LinkButton lnkDelete = new LinkButton();
                        lnkDelete.ID = "lnkDelete";
                        lnkDelete.CommandName = "DeleteWO";

                        e.Row.Cells[8].Controls.Add(lnkView);
                        e.Row.Cells[8].Controls.Add(lnkEdit);
                        e.Row.Cells[8].Controls.Add(lnkDelete);
                    }
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error binding row, due to: " + ex.Message);
            }
        }


        //protected void gvInput_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    try
        //    {
        //        if (e.CommandName == "SaveWO")
        //        {
        //            TextBox txtQty = gvInput.Rows[0].Cells[0].FindControl("txtQty") as TextBox;
        //            //TextBox txtProductType = gvInput.Rows[0].Cells[1].FindControl("txtProductType") as TextBox;
        //            DropDownList ddlPackageTypes = gvInput.Rows[0].Cells[1].FindControl("ddlPackageType") as DropDownList;
        //            DropDownList ddlPartyNameAddress = gvInput.Rows[0].Cells[2].FindControl("ddlPartyNameAddress") as DropDownList;
        //            TextBox txtAccount = gvInput.Rows[0].Cells[3].FindControl("txtAccount") as TextBox;
        //            TextBox txtFreight = gvInput.Rows[0].Cells[4].FindControl("txtFreight") as TextBox;
        //            TextBox txtVehicleRegNo = gvInput.Rows[0].Cells[5].FindControl("txtVehicleRegNo") as TextBox;
        //            TextBox txtAdvance = gvInput.Rows[0].Cells[6].FindControl("txtAdvance") as TextBox;

        //            //TextBox txtQty = gvInput.Rows[0].Cells[GetColumnIndexByName(gvInput.Rows[0], "Qty")].FindControl("txtQty") as TextBox;
        //            //TextBox txtProductType = gvInput.Rows[0].Cells[GetColumnIndexByName(gvInput.Rows[0], "Qty")].FindControl("txtProductType") as TextBox;
        //            //DropDownList ddlPartyNameAddress = gvInput.Rows[0].Cells[GetColumnIndexByName(gvInput.Rows[0], "Qty")].FindControl("ddlPartyNameAddress") as DropDownList;
        //            ////TextBox txtPartyNameAddress = gvInput.Rows[0].Cells[GetColumnIndexByName(gvInput.Rows[0], "Qty")].FindControl("txtPartyNameAddress") as TextBox;
        //            //TextBox txtAccount = gvInput.Rows[0].Cells[GetColumnIndexByName(gvInput.Rows[0], "Qty")].FindControl("txtAccount") as TextBox;
        //            //TextBox txtFreight = gvInput.Rows[0].Cells[GetColumnIndexByName(gvInput.Rows[0], "Qty")].FindControl("txtFreight") as TextBox;
        //            //TextBox txtVehicleRegNo = gvInput.Rows[0].Cells[GetColumnIndexByName(gvInput.Rows[0], "Qty")].FindControl("txtVehicleRegNo") as TextBox;
        //            //TextBox txtAdvance = gvInput.Rows[0].Cells[GetColumnIndexByName(gvInput.Rows[0], "Qty")].FindControl("txtAdvance") as TextBox;


        //            Random rnd = new Random();
        //            string WorkOrderNo = rnd.Next().ToString();
        //            string OrderDate = lblCurrentDate.Text;
        //            Int64 Qty = txtQty.Text == string.Empty ? 0 : Convert.ToInt64(txtQty.Text);
        //            Int64 PackageTypeID = ddlPackageTypes.SelectedIndex == 0 ? 0 : Convert.ToInt64(ddlPackageTypes.SelectedItem.Value);
        //            Int64 SenderID = ddlCompanies.SelectedIndex == 0 ? 0 : Convert.ToInt64(ddlCompanies.SelectedItem.Value);
        //            Int64 ReceiverID = ddlPartyNameAddress.SelectedIndex == 0 ? 0 : Convert.ToInt64(ddlPartyNameAddress.SelectedItem.Value);
        //            string Account = txtAccount.Text;
        //            Int64 Freight = txtFreight.Text == string.Empty ? 0 : Convert.ToInt64(txtQty.Text);
        //            string VehicleRegNo = txtVehicleRegNo.Text;
        //            Int64 Advance = txtAdvance.Text == string.Empty ? 0 : Convert.ToInt64(txtAdvance.Text);
        //            string DeliveryDate = txtDeliveryDate.Text;

        //            DataTable dtWO = new DataTable();
        //            dtWO.Columns.Add("WorkOrderID");
        //            dtWO.Columns.Add("Qty");
        //            dtWO.Columns.Add("ProductType");
        //            dtWO.Columns.Add("PartyNameAddress");
        //            dtWO.Columns.Add("Account");
        //            dtWO.Columns.Add("Freight");
        //            dtWO.Columns.Add("Truck");
        //            dtWO.Columns.Add("Advance");
        //            dtWO.Columns.Add("Operations");
        //            //dtWO.Rows.Add();
        //            foreach (GridViewRow _gvrWO in gvInput.Rows)
        //            {
        //                dtWO.Rows.Add(
        //                    _gvrWO.RowIndex + 1, 
        //                    _gvrWO.Cells[1].Text.Replace("&nbsp;", string.Empty),
        //                    _gvrWO.Cells[2].Text.Replace("&nbsp;", string.Empty),
        //                    _gvrWO.Cells[3].Text.Replace("&nbsp;", string.Empty),
        //                    _gvrWO.Cells[4].Text.Replace("&nbsp;", string.Empty),
        //                    _gvrWO.Cells[5].Text.Replace("&nbsp;", string.Empty),
        //                    _gvrWO.Cells[6].Text.Replace("&nbsp;", string.Empty),
        //                    _gvrWO.Cells[7].Text.Replace("&nbsp;", string.Empty),
        //                    _gvrWO.Cells[8].Text.Replace("&nbsp;", string.Empty)
        //                );
        //            }

        //            dtWO.Rows.Add(
        //                WorkOrderNo,
        //                Qty,
        //                PackageTypeID,
        //                SenderID,
        //                Account,
        //                Freight,
        //                VehicleRegNo,
        //                Advance,
        //                string.Empty
        //            );

        //            gvResult.DataSource = dtWO.Rows.Count > 0 ? dtWO : null;
        //            gvResult.DataBind();


        //            //WorkOrderDML dml = new WorkOrderDML();

        //            //Int64 WorkOrderID = dml.InsertWorkOrder(OrderDate, WorkOrderNo, SenderID, ReceiverID, string.Empty, LoginID);

        //            //notification("Success", "Its Working...");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        notification("Error", "Error commanding row, due to: " + ex.Message);
        //    }
        //}

        #endregion

        #region Textchange Events

        protected void txtSearchSender_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtSearchSender.Text == string.Empty)
                {
                    notification("Error", "Please enter Company code, name or Group to search Company");
                }
                else
                {
                    string[] Company = txtSearchSender.Text.Split('|');
                    if (Company.Length > 0)
                    {
                        //Code, Group, Company, Department
                        //txtSenderCompanyCode.Text = Company[0].ToString().Trim();
                        //txtSenderCompany.Text = Company[1].ToString().Trim();
                        //txtSenderGroup.Text = Company[2].ToString().Trim();
                        //txtSenderDepartment.Text = Company[3].ToString().Trim();

                        //txtPackageType.Text = Company[2].ToString().Trim();
                        //txtItem.Text = Company[1].ToString().Trim();
                        //txtProductQty.Text = txtProductQty.Text == string.Empty ? "0" : txtProductQty.Text;
                        //txtTotalProductWeight.Text = txtProductQty.Text == "0" ? Company[3].ToString() : (Convert.ToDouble(txtProductQty.Text) * Convert.ToDouble(Company[3].ToString() == string.Empty ? "0" : Company[3].ToString())).ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error selecting product, due to: " + ex.Message);
            }
        }

        protected void txtProduct_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //Int64 Qty = txtQty.Text == string.Empty ? 0 : Convert.ToInt64(txtQty.Text);
                //string PartyNameAddress = txtPartyNameAddress.Text;
                //string[] ProductString = txtProduct.Text.Split('|');
                //string Product = txtProduct.Text;
                //double ProductWeight = Convert.ToDouble(ProductString[1]);
                //double Weight = (Qty * ProductWeight);
                //txtProductWeight.Text = Weight.ToString();
                //PackagingTypeDML dml = new PackagingTypeDML();
                //DataTable dtPakageName = dml.GetPackageTypeByProductName(ProductString[0]);
                //txtPackageType.Text = dtPakageName.Rows[0]["PackageTypeName"].ToString();
                if (txtQty.Text != string.Empty)
                {
                    double quantity = Convert.ToDouble(txtQty.Text.Trim());
                    string[] ProductString = txtProduct.Text.Split('|');
                    double weight = Convert.ToDouble(ProductString[1]);
                    double TotalWeight = quantity * weight;
                    txtProductWeight.Text = TotalWeight.ToString();
                }
                else
                {
                    notification("Error", "Please Enter Quantity to Calculate");
                    txtQty.Focus();
                }

            }
            catch (Exception ex)
            {
                notification("Error", "Error changin text for product, due to: " + ex.Message);
            }
        }

        protected void txtQty_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtProduct.Text != string.Empty)
                {
                    double quantity = Convert.ToDouble(txtQty.Text.Trim());
                    string[] ProductString = txtProduct.Text.Split('|');
                    double weight = Convert.ToDouble(ProductString[1]);
                    double TotalWeight = quantity * weight;
                    txtProductWeight.Text = TotalWeight.ToString();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region Blur Events

        //private void HandleCustomPostbackEvent(string ctrlName, string args)
        //{

        //    //if (ctrlName == txtSearchSender.UniqueID && args == "OnBlur")
        //    //{
        //    //    if (txtSearchSender.Text != string.Empty)
        //    //    {
        //    //        string[] SenderString = txtSearchSender.Text.Split('|');
        //    //        Int64 SenderCompanyID = 0;
        //    //        if (SenderString.Length > 1)
        //    //        {

        //    //        }
        //    //        else
        //    //        {
        //    //            string NewCompanyName = SenderString[0].ToString().Trim();
        //    //            Random rnd = new Random();
        //    //            string Code = rnd.Next().ToString();
        //    //            OrderDML dmlOrder = new OrderDML();
        //    //            Int64 GroupID = 0;
        //    //            GroupDML dmlGroup = new GroupDML();
        //    //            string GroupCode = "WOG123";
        //    //            string GroupName = "Work Order Group";
        //    //            DataTable dtGroup = dmlGroup.GetGroup(GroupCode, GroupName);
        //    //            if (dtGroup.Rows.Count > 0)
        //    //            {
        //    //                GroupID = Convert.ToInt64(dtGroup.Rows[0]["GroupID"]);
        //    //            }
        //    //            else
        //    //            {
        //    //                GroupID = dmlGroup.InsertGroup(GroupCode, GroupName, "Created automatically from Work Order", LoginID);
        //    //            }

        //    //            if (GroupID > 0)
        //    //            {
        //    //                CompanyDML dml = new CompanyDML();
        //    //                Int64 CompanyID = dml.InsertCompany(Code, NewCompanyName, GroupID, "Created automatic from WorkOrder", LoginID);
        //    //                if (CompanyID > 0)
        //    //                {
        //    //                    notification("Success", "New  Company Created in Directory");
        //    //                    DataTable dtCompany = dmlOrder.GetCompanies(NewCompanyName);
        //    //                    txtSearchSender.Text = dtCompany.Rows[0]["Company"].ToString();
        //    //                }
        //    //            }
        //    //            else
        //    //            {
        //    //                notification("Error", "Error auto selecting VehicleType for auto save Vehicle");
        //    //            }
        //    //        }
        //    //    }
        //    //}
        //}

        #endregion

        #endregion
    }
}