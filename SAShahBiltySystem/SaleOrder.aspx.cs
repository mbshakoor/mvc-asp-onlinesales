using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Drawing;
using BLL;

namespace SAShahBiltySystem
{
    public partial class SaleOrder : System.Web.UI.Page
    {
        #region Members

        int loginid;

        #endregion

        #region Properties

        public int LoginID
        {
            get
            {
                if (Session["LoggedInUserData"] != null)
                {
                    DataTable dt = (DataTable)Session["LoggedInUserData"];
                    if (dt.Rows[0]["UserID"].ToString() != null)
                    {
                        loginid = Convert.ToInt32(dt.Rows[0]["UserID"]);
                    }
                    return loginid;
                }
                else
                {
                    return loginid;
                }
            }
        }

        #endregion

        #region Helper Methods

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

        private void FillDropDownCust(DataTable dt, DropDownList _ddl, string _ddlValue, string _ddlText, string _ddlDefaultText, string _addnew)
        {
            if (dt.Rows.Count > 0)
            {
                _ddl.DataSource = dt;

                _ddl.DataValueField = _ddlValue;
                _ddl.DataTextField = _ddlText;

                _ddl.DataBind();

                ListItem item = new ListItem();
                ListItem item2 = new ListItem();

                item.Text = _ddlDefaultText;
                item.Value = _ddlDefaultText;
                item2.Text = _addnew;
                item2.Value = _addnew;

                _ddl.Items.Insert(0, item);
                _ddl.Items.Insert(dt.Rows.Count + 1, item2);
                _ddl.SelectedIndex = 0;
                
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
           if (LoginID > 0)
            {
                if (!IsPostBack)
                {
                    binddropdowns();
                    Bindgridview();
                    bindSOgrid();
                    pnlmain.Visible = false;
                    UserRights();
                }
            }
        }

        private void bindSOgrid()
        {
            SaleOrderDML SO = new SaleOrderDML();
            DataTable dtSO = SO.bindmaingrid();
            gvsaleorder.DataSource = dtSO;
            gvsaleorder.DataBind();
        }

        private void UserRights()
        {
            MenuDML menu = new MenuDML();
            DataTable dtlevel = menu.checklevel(LoginID);
            if (dtlevel.Rows[0]["Level"].ToString() == "1")
            {
                btnaddnew.Visible = false;
                foreach (GridViewRow row in gvsaleorder.Rows)
                {
                    //access control here
                    LinkButton editbutton = (LinkButton)row.FindControl("lbedit");
                    LinkButton deletebutton = (LinkButton)row.FindControl("lbdelete");
                    editbutton.Visible = false;
                    deletebutton.Visible = false;
                }
            }
            else if (dtlevel.Rows[0]["Level"].ToString() == "2")
            {
                btnaddnew.Visible = true;
                foreach (GridViewRow row in gvsaleorder.Rows)
                {
                    LinkButton editbutton = (LinkButton)row.FindControl("lbedit");
                    LinkButton deletebutton = (LinkButton)row.FindControl("lbdelete");
                    editbutton.Visible = false;
                    deletebutton.Visible = false;
                }
            }
            else if (dtlevel.Rows[0]["Level"].ToString() == "3")
            {
                btnaddnew.Visible = true;
                foreach (GridViewRow row in gvsaleorder.Rows)
                {
                    LinkButton editbutton = (LinkButton)row.FindControl("lbedit");
                    LinkButton deletebutton = (LinkButton)row.FindControl("lbdelete");
                    editbutton.Visible = true;
                    deletebutton.Visible = true;
                }
            }
        }

        private void binddropdowns()
        {
            SaleOrderDML SO = new SaleOrderDML();
            DataTable dtcourier = SO.GetCourier();
            DataTable dtcustomer = SO.GetCustomer();
            FillDropDown(dtcourier, ddlcourier, "CourierID", "Name", "--Select Courier--");
            FillDropDownCust(dtcustomer, ddlcustomer, "CustomerID", "CustomerName", "--Select Customer--", "Add New Customer");
        }

        private void Bindgridview()
        {
            SaleOrderDML SO = new SaleOrderDML();
            DataTable dtproducts = SO.GetProduct();

            DataTable dt = new DataTable();
            dt.Clear();
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("Code"), new DataColumn("Product"), new DataColumn("Qty"), new DataColumn("UnitPrice"), new DataColumn("Discount"), new DataColumn("Total") });
            //if (gvSaleorderDetail.Rows.Count == 0)
            //{
                for (int i = 0; i < 1; i++)
                {
                    dt.Rows.Add();
                    
                }
            //}
            //else if (gvSaleorderDetail.Rows.Count > 0)
            //{
            //    for (int i = 0; i < gvSaleorderDetail.Rows.Count; i++)
            //    {
            //        dt.Rows.Add();
            //    }
            //}
            gvSaleorderDetail.DataSource = dt;
            gvSaleorderDetail.DataBind();
            
            ViewState["data"] = dt;
            GridViewRow row = gvSaleorderDetail.Rows[0];
            LinkButton addbutton = (LinkButton)row.FindControl("lbadd");
            LinkButton deletebutton = (LinkButton)row.FindControl("lbdelete");
            DropDownList ddlproduct = (DropDownList)row.FindControl("ddlproduct");
            FillDropDown(dtproducts, ddlproduct, "ProductID", "Name", "--Select Product--");
            addbutton.Visible = true;
            deletebutton.Visible = false;            
        }

        protected void ddlcustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcustomer.SelectedItem.Text == "Add New Customer")
            {
                modalConfirm.Show();
            }
            else
            {
                SaleOrderDML SO = new SaleOrderDML();
                DataTable dt = SO.getcustomerdata(Convert.ToInt32(ddlcustomer.SelectedValue));
                txtmobile.Text = dt.Rows[0]["Mobile"].ToString();
                txtemail.Text = dt.Rows[0]["Email"].ToString();
                txtshippingaddress.Text = dt.Rows[0]["PostalAddress"].ToString();
            }
        }

        protected void gvSaleorderDetail_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DataTable dtdata = new DataTable();
            SaleOrderDML SO = new SaleOrderDML();
            DataTable dtproducts = SO.GetProduct();
            if (e.CommandName == "add")
            {
                GridViewRow grid = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                Label sno = grid.FindControl("lblSRNO") as Label;
                int rowIndex = (Convert.ToInt32(sno.Text) - 1);
                GridViewRow row = gvSaleorderDetail.Rows[rowIndex];
                DataTable dt = (DataTable)ViewState["data"];
                for (int i = 0; i < 1; i++)
                {
                    dt.Rows.Add();            
                }
                string code = (row.FindControl("txtCode") as TextBox).Text;
                string product = (row.FindControl("ddlproduct") as DropDownList).SelectedValue;
                string quantity = (row.FindControl("txtQty") as TextBox).Text;
                string unitprice = (row.FindControl("txtUnitPrice") as TextBox).Text;
                string discount = (row.FindControl("txtDiscount") as TextBox).Text;
                string total = (row.FindControl("txtTotal") as TextBox).Text;
                dt.Rows[dt.Rows.Count - 2]["Code"] = code.ToString();
                dt.Rows[dt.Rows.Count - 2]["Product"] = product.ToString();
                dt.Rows[dt.Rows.Count - 2]["Qty"] = quantity.ToString();
                dt.Rows[dt.Rows.Count - 2]["UnitPrice"] = unitprice.ToString();
                dt.Rows[dt.Rows.Count - 2]["Discount"] = discount.ToString();
                dt.Rows[dt.Rows.Count - 2]["Total"] = total.ToString();

                gvSaleorderDetail.DataSource = dt;
                gvSaleorderDetail.DataBind();
                ViewState["record"] = dt;
                GridViewRow addrow = gvSaleorderDetail.Rows[Convert.ToInt32(sno.Text)];
                LinkButton addbutton = (LinkButton)addrow.FindControl("lbadd");
                DropDownList ddlproduct = (DropDownList)addrow.FindControl("ddlproduct");
                FillDropDown(dtproducts, ddlproduct, "ProductID", "Name", "--Select Product--");
                addbutton.Visible = true;

                for (int i=0; i<gvSaleorderDetail.Rows.Count - 1; i++)
                {
                    GridViewRow deleterow = gvSaleorderDetail.Rows[i];
                    LinkButton deletebutton = (LinkButton)deleterow.FindControl("lbdelete");
                    DropDownList ddlproductall = (DropDownList)deleterow.FindControl("ddlproduct");
                    FillDropDown(dtproducts, ddlproductall, "ProductID", "Name", "--Select Product--");
                    deletebutton.Visible = true;
                }
                
                SetPreviousData();
            }
            if (e.CommandName == "delete")
            {
                GridViewRow grid = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                Label sno = grid.FindControl("lblSRNO") as Label;
                if (ViewState["record"] != null && ViewState["data"] != null)
                {
                    DataTable dt = (DataTable)ViewState["record"];
                    DataTable dtmain = (DataTable)ViewState["data"];
                    if (dt.Rows.Count > 1)
                    {
                        dt.Rows.Remove(dt.Rows[Convert.ToInt32(sno.Text)-1]);
                        dtmain.Rows.Remove(dtmain.Rows[Convert.ToInt32(sno.Text) - 1]);
                    }
                    gvSaleorderDetail.DataSource = dt;
                    gvSaleorderDetail.DataBind();
                }
                GridViewRow addrow = gvSaleorderDetail.Rows[gvSaleorderDetail.Rows.Count-1];
                LinkButton addbutton = (LinkButton)addrow.FindControl("lbadd");
                DropDownList ddlproduct = (DropDownList)addrow.FindControl("ddlproduct");
                FillDropDown(dtproducts, ddlproduct, "ProductID", "Name", "--Select Product--");
                addbutton.Visible = true;
                for (int i = 0; i < gvSaleorderDetail.Rows.Count - 1; i++)
                {
                    GridViewRow deleterow = gvSaleorderDetail.Rows[i];
                    LinkButton deletebutton = (LinkButton)deleterow.FindControl("lbdelete");
                    DropDownList ddlproductall = (DropDownList)deleterow.FindControl("ddlproduct");
                    FillDropDown(dtproducts, ddlproductall, "ProductID", "Name", "--Select Product--");
                    deletebutton.Visible = true;
                }
                SetPreviousData();
            }
        }

        protected void gvSaleorderDetail_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        private void SetPreviousData()
        {

            int rowIndex = 0;
            if (ViewState["record"] != null)
            {

                DataTable dt = (DataTable)ViewState["record"];
                if (dt.Rows.Count > 0)
                {
                   
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        TextBox box1 = (TextBox)gvSaleorderDetail.Rows[i].Cells[1].FindControl("txtCode");
                        DropDownList ddl1 = (DropDownList)gvSaleorderDetail.Rows[i].Cells[2].FindControl("ddlproduct");
                        TextBox box2 = (TextBox)gvSaleorderDetail.Rows[i].Cells[3].FindControl("txtQty");
                        TextBox box3 = (TextBox)gvSaleorderDetail.Rows[i].Cells[4].FindControl("txtUnitPrice");
                        TextBox box4 = (TextBox)gvSaleorderDetail.Rows[i].Cells[5].FindControl("txtDiscount");
                        TextBox box5 = (TextBox)gvSaleorderDetail.Rows[i].Cells[6].FindControl("txtTotal");

                        //DropDownList ddl1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[3].FindControl("DropDownList1");
                        //DropDownList ddl2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[4].FindControl("DropDownList2");

                        ////Fill the DropDownList with Data   
                        //FillDropDownList(ddl1);
                        //FillDropDownList(ddl2);

                        if (i < dt.Rows.Count - 1)
                        {

                            //Assign the value from DataTable to the TextBox   
                            box1.Text = dt.Rows[i]["Code"].ToString();
                            ddl1.SelectedValue = dt.Rows[i]["Product"].ToString();
                            box2.Text = dt.Rows[i]["Qty"].ToString();
                            box3.Text = dt.Rows[i]["UnitPrice"].ToString();
                            box4.Text = dt.Rows[i]["Discount"].ToString();
                            box5.Text = dt.Rows[i]["Total"].ToString();

                            //Set the Previous Selected Items on Each DropDownList  on Postbacks   
                            //ddl1.ClearSelection();
                            //ddl1.Items.FindByText(dt.Rows[i]["Column3"].ToString()).Selected = true;

                            //ddl2.ClearSelection();
                            //ddl2.Items.FindByText(dt.Rows[i]["Column4"].ToString()).Selected = true;

                        }
                        //ViewState["data"] = dt;
                        rowIndex++;
                    }
                }
            }
        }

        protected void lbsavecust_Click(object sender, EventArgs e)
        {
            try
            {
                SaleOrderDML SO = new SaleOrderDML();
                DataTable dt = SO.GetCustomer();
                string code = "";
                if (dt.Rows.Count > 0)
                {
                    string str = dt.Rows[dt.Rows.Count - 1]["CustomerCode"].ToString();
                    string split = str.Replace("CUS-", "");
                    int num = Convert.ToInt32(split) + 1;
                    string result = num.ToString("D6");
                    code = "CUS-" + result;
                }
                else
                {
                    code = "CUS-000001";
                }
                if (string.IsNullOrEmpty(txtcustname.Text))
                {
                    notification("Error", "Please enter Customer Name");
                    modalConfirm.Show();
                }
                else
                {
                    SO.InsertCustomer(code, txtcustname.Text, txtcustmobno.Text, txtcustemail.Text, txtresiadd.Text, txtpostadd.Text);
                    notification("Success", "Customer Added sucessfully");
                    UserRights();
                }
                binddropdowns();
            }
            catch (Exception ex)
            {
                divNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
            //modalConfirm.Show();
        }

        protected void lbcancelcust_Click(object sender, EventArgs e)
        {

        }

        protected void ddlcourier_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcourier.SelectedItem.Text == "Own Hire")
            {
                txtdeliverycharges.Text = "0";
            }
            else
            {
                txtdeliverycharges.Text = string.Empty;
            }
        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            pnlmain.Visible = true;
            ddlcustomer.SelectedIndex = 0;
            ddlcourier.SelectedIndex = 0;
            txtmobile.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtdeliverycharges.Text = string.Empty;
            txtshippingaddress.Text = string.Empty;
            Bindgridview();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            pnlmain.Visible = false;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {
                SaleOrderDML SO = new SaleOrderDML();
                DataTable dt = SO.bindmaingrid();
                string code = "";
                if (dt.Rows.Count > 0)
                {
                    string str = dt.Rows[dt.Rows.Count - 1]["Code"].ToString();
                    string split = str.Replace("SO-", "");
                    int num = Convert.ToInt32(split) + 1;
                    string result = num.ToString("D6");
                    code = "SO-" + result;
                }
                else
                {
                    code = "SO-000001";
                }
                if (ddlcustomer.SelectedIndex == 0)
                {
                    notification("Error", "Please select Customer Name");
                }
                else if (string.IsNullOrEmpty(txtmobile.Text))
                {
                    notification("Error", "Please enter Mobile Number");
                }
                else if (string.IsNullOrEmpty(txtemail.Text))
                {
                    notification("Error", "Please enter Email");
                }
                else if (ddlcourier.SelectedIndex == 0)
                {
                    notification("Error", "Please select Courier");
                }
                else if (string.IsNullOrEmpty(txtdeliverycharges.Text))
                {
                    notification("Error", "Please enter Delivery Charges");
                }
                else if (string.IsNullOrEmpty(txtshippingaddress.Text))
                {
                    notification("Error", "Please enter Shipping Address");
                }
                else
                {
                   int SaleOrderID =  SO.InsertSaleOrder(code, Convert.ToInt32(ddlcustomer.SelectedValue), txtmobile.Text, txtemail.Text, txtshippingaddress.Text, Convert.ToInt32(ddlcourier.SelectedValue), Convert.ToInt32(txtdeliverycharges.Text));
                    if (SaleOrderID > 0)
                    {
                        DataTable dtdetail = (DataTable)ViewState["data"];
                        foreach(DataRow drow in dtdetail.Rows)
                        {
                            if (drow["Product"].ToString() != "")
                            {
                                SO.InsertSaleOrderDetail(drow["Code"].ToString(), Convert.ToInt32(drow["Product"]), Convert.ToInt32(drow["Qty"]), Convert.ToInt32(drow["UnitPrice"]), Convert.ToInt32(drow["Discount"]), Convert.ToInt32(drow["Total"]), SaleOrderID);
                            }
                        }
                        notification("Success", "SaleOrder Added sucessfully");
                        bindSOgrid();
                        pnlmain.Visible = false;
                        UserRights();
                    }
                }
            }
            catch (Exception ex)
            {
                divNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }

        protected void ddlproduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            SaleOrderDML SO = new SaleOrderDML();
            DropDownList ddl = sender as DropDownList;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            DropDownList products = ((DropDownList)row.FindControl("ddlproduct"));
            TextBox code = (TextBox)row.FindControl("txtCode");
            TextBox unitprice = (TextBox)row.FindControl("txtUnitPrice");
            TextBox quantity = (TextBox)row.FindControl("txtQty");
            TextBox discount = (TextBox)row.FindControl("txtDiscount");
            TextBox Total = (TextBox)row.FindControl("txtTotal");
            DataTable dtproduct = SO.GetProductData("ProductID", products.SelectedValue);
            if (dtproduct.Rows.Count > 0)
            {
                code.Text = dtproduct.Rows[0]["Code"].ToString();
                unitprice.Text = dtproduct.Rows[0]["SalePrice"].ToString();
                quantity.Text = string.Empty;
                discount.Text = "0";
                Total.Text = "0";
            }

        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            SaleOrderDML SO = new SaleOrderDML();
            TextBox txt = sender as TextBox;
            GridViewRow row = (GridViewRow)txt.NamingContainer;
            TextBox code = (TextBox)row.FindControl("txtCode");
            DropDownList products = ((DropDownList)row.FindControl("ddlproduct"));            
            TextBox unitprice = (TextBox)row.FindControl("txtUnitPrice");
            TextBox quantity = (TextBox)row.FindControl("txtQty");
            TextBox discount = (TextBox)row.FindControl("txtDiscount");
            TextBox Total = (TextBox)row.FindControl("txtTotal");
            DataTable dtproduct = SO.GetProductData("Code", code.Text);
            if (dtproduct.Rows.Count > 0)
            {
                products.SelectedValue = dtproduct.Rows[0]["ProductID"].ToString();
                unitprice.Text = dtproduct.Rows[0]["SalePrice"].ToString();
                quantity.Text = string.Empty;
                discount.Text = "0";
                Total.Text = "0";
            }
        }

        protected void txtQty_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = sender as TextBox;
            GridViewRow row = (GridViewRow)txt.NamingContainer;
            TextBox quantity = (TextBox)row.FindControl("txtQty");
            TextBox unitprice = (TextBox)row.FindControl("txtUnitPrice");
            TextBox discount = (TextBox)row.FindControl("txtDiscount");
            TextBox Total = (TextBox)row.FindControl("txtTotal");
            Total.Text = (Convert.ToInt32(quantity.Text) * Convert.ToInt32(unitprice.Text)-Convert.ToInt32(discount.Text)).ToString();
        }

        protected void txtDiscount_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = sender as TextBox;
            GridViewRow row = (GridViewRow)txt.NamingContainer;
            TextBox discount = (TextBox)row.FindControl("txtDiscount");
            TextBox Total = (TextBox)row.FindControl("txtTotal");
            Total.Text = (Convert.ToInt32(Total.Text) - Convert.ToInt32(discount.Text)).ToString();
        }

        protected void gvsaleorder_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                modaldetail.Show();
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvsaleorder.Rows[index];
                SaleOrderDML SO = new SaleOrderDML();
                DataTable dtdetail = SO.getdetaildata(Convert.ToInt32(row.Cells[0].Text));
                gvdetail.DataSource = dtdetail;
                gvdetail.DataBind();
            }
            if (e.CommandName == "delete")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvsaleorder.Rows[index];
                SaleOrderDML SO = new SaleOrderDML();
                SO.DeleteSaleOrder(Convert.ToInt64(row.Cells[0].Text));
                SO.DeleteSaleOrderDetail(Convert.ToInt64(row.Cells[0].Text));
                bindSOgrid();
                UserRights();
            }
        }

        protected void gvsaleorder_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}