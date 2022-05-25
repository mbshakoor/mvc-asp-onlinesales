using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using BLL;

namespace SAShahBiltySystem
{
    public partial class Products : System.Web.UI.Page
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

        public void categorychild(int parentid, string Space)
        {
            ProductDML pro = new ProductDML();
            DataTable dt = pro.GetCategorychilds(parentid, parentid);

            string sp = new string(Space.ToCharArray());
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (parentid - 1 > 0)
                    {
                        ListItem li = new ListItem(string.Concat(Enumerable.Repeat(sp, parentid)) + dt.Rows[i]["Name"].ToString(), dt.Rows[i]["ParentID"].ToString());
                        ddlcategory.Items.Add(li);
                    }
                    else
                    {
                        ListItem li = new ListItem(string.Concat(Enumerable.Repeat(sp, parentid)) + dt.Rows[i]["Name"].ToString(), dt.Rows[i]["ParentID"].ToString());
                        ddlcategory.Items.Add(li);
                    }

                    // categorychild(Convert.ToInt32(dt.Rows[i]["ParentID"].ToString()), "----" + sp);

                }
            }
        }

        public void categoryparent()
        {
            ProductDML pro = new ProductDML();
            DataTable dt = pro.GetCategory();
            ddlcategory.Items.Add("--Select Category--");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i]["ParentID"].ToString() == "0")
                    {
                        ListItem li = new ListItem(dt.Rows[i]["Name"].ToString(), dt.Rows[i]["ParentID"].ToString());
                        ddlcategory.Items.Add(li);
                    }

                    // if (i == Convert.ToInt32(dt.Rows[i]["ParentID"].ToString()))
                    // {
                    categorychild(i + 1, "--");
                    // }
                }
            }


        }

        private void UserRights()
        {
            MenuDML menu = new MenuDML();
            DataTable dtlevel = menu.checklevel(LoginID);
            if (dtlevel.Rows[0]["Level"].ToString() == "1")
            {
                btnaddnew.Visible = false;
                foreach (GridViewRow row in gvproduct.Rows)
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
                foreach (GridViewRow row in gvproduct.Rows)
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
                foreach (GridViewRow row in gvproduct.Rows)
                {
                    LinkButton editbutton = (LinkButton)row.FindControl("lbedit");
                    LinkButton deletebutton = (LinkButton)row.FindControl("lbdelete");
                    editbutton.Visible = true;
                    deletebutton.Visible = true;
                }
            }
        }

        private void filldata()
        {
            ProductDML pro = new ProductDML();
            dtPowerTree = pro.GetCategory();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");
        }

        private DataTable dtPowerTree = new DataTable();
        private DataTable dt = new DataTable();

        private void blTreeDataTable(int _ParentId, int _Gen)
        {
            
            string filter = "ParentID=" + _ParentId;
            string sort = "ID ASC";
            DataRow[] drs = dtPowerTree.Select(filter, sort);
            for (int i = 0; i < drs.Length; i++)
            {
                if (Convert.ToInt32(drs[i][3]) == _ParentId)
                {
                    int Id = Convert.ToInt32(drs[i][0]);
                    int gen = Convert.ToInt32(drs[i][2]) + 1;
                    string PowerName = drs[i][1].ToString();

                    if (_ParentId != 0)
                    {
                        //ddlcategory.Items.Add(new ListItem(string.Concat(Enumerable.Repeat("┣", + _Gen)) + PowerName, Id.ToString()))┣;
                        dt.Rows.Add(Id.ToString(), string.Concat(Enumerable.Repeat("--", +_Gen)) + PowerName);
                    }
                    else
                    {
                        //ddlcategory.Items.Add(new ListItem(PowerName, Id.ToString()));
                        dt.Rows.Add(Id.ToString(), PowerName);
                    }
                    blTreeDataTable(Id, gen);
                }
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

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginID > 0)
            {
                if (!IsPostBack)
                {
                    ProductDML pro = new ProductDML();
                    DataTable dttype = pro.GetTypes();
                    DataTable dtsupplier = pro.GetSuppier();
                    DataTable dtcat = pro.GetCategory();
                    FillDropDown(dttype, ddltype, "ID", "Name", "--Select Type--");
                    FillDropDown(dtsupplier, ddlsupplier, "ID", "Type", "--Select Supplier--");                   
                    filldata();
                    blTreeDataTable(0, 0);
                    dtPowerTree.Clear();
                    FillDropDown(dt, ddlcategory, "ID", "Name", "--Select Category--");
                    Bindgridview();
                    pnlmain.Visible = false;
                    UserRights();
                }
            }
        }

        private void Bindgridview()
        {
            ProductDML pro = new ProductDML();
            DataTable dtgrid = pro.bindgrid();
            gvproduct.DataSource = dtgrid;
            gvproduct.DataBind();
        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            pnlmain.Visible = true;
            btnsave.Visible = true;
            btnupdate.Visible = false;
            txtname.Text = string.Empty;
            ddlcategory.SelectedIndex = 0;
            ddltype.SelectedIndex = 0;
            ddlsupplier.SelectedIndex = 0;
            txtsaleprice.Text = string.Empty;
            txtbuyingprice.Text = string.Empty;
            txtdesc.Text = string.Empty;
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            pnlmain.Visible = false;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        { 
            try
            {
                ProductDML pro = new ProductDML();
                DataTable dt = pro.bindgrid();
                string code = "";
                if (dt.Rows.Count > 0)
                {
                    string str = dt.Rows[dt.Rows.Count - 1]["Code"].ToString();
                    string split = str.Replace("P-", "");
                    int num = Convert.ToInt32(split) + 1;
                    string result = num.ToString("D6");
                    code = "P-" + result;
                }
                else
                {
                    code = "P-000001";
                }
                if (string.IsNullOrEmpty(txtname.Text))
                {
                    notification("Error", "Please Enter Product name");
                }
                else if (string.IsNullOrEmpty(txtsaleprice.Text))
                {
                    notification("Error", "Please Enter Sale Price");
                }
                else if (string.IsNullOrEmpty(txtbuyingprice.Text))
                {
                    notification("Error", "Please Enter Buying Price");
                }
                else if (ddltype.SelectedIndex == 0)
                {
                    notification("Error", "Please select Type");
                }
                else if (ddlcategory.SelectedIndex == 0)
                {
                    notification("Error", "Please select Category");
                }
                else
                {
                    string supplier = (ddlsupplier.SelectedIndex == 0 ? null : ddlsupplier.SelectedValue);
                   int ProductID = pro.InsertProduct(code, txtname.Text, Convert.ToInt32(ddltype.SelectedValue), Convert.ToInt32(ddlcategory.SelectedValue), supplier, txtsaleprice.Text, txtbuyingprice.Text, txtdesc.Text);
                    if (ProductID > 0)
                    {
                        notification("Success", "Product Added sucessfully");
                        Bindgridview();
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

        protected void gvproduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                btnupdate.Visible = true;
                btnsave.Visible = false;
                pnlmain.Visible = true;
                ProductDML pro = new ProductDML();
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvproduct.Rows[index];
                txtname.Text = row.Cells[2].Text;
                txtsaleprice.Text = row.Cells[6].Text;
                txtbuyingprice.Text = row.Cells[7].Text;
                txtdesc.Text = gvproduct.DataKeys[row.RowIndex].Value.ToString();
                DataTable dt = pro.getdropdownvalues(Convert.ToInt32(row.Cells[0].Text));
                if (dt.Rows.Count > 0)
                {
                    ddlcategory.SelectedValue = dt.Rows[0]["Category"].ToString();
                    ddltype.SelectedValue = dt.Rows[0]["ProductType"].ToString();
                    if (dt.Rows[0]["Supplier"].ToString() == null || dt.Rows[0]["Supplier"].ToString() == "" || dt.Rows[0]["Supplier"].ToString() == "0")
                    {
                        ddlsupplier.SelectedIndex = 0;

                    }
                    else
                    {
                        ddlsupplier.SelectedValue = dt.Rows[0]["Supplier"].ToString();
                    }
                }
                ViewState["ProductID"] = row.Cells[0].Text;
            }

            if (e.CommandName == "delete")
            {
                ProductDML pro = new ProductDML();
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvproduct.Rows[index];
                string product = " "+row.Cells[1].Text+" ";
                pro.DeleteProduct(Convert.ToInt64(row.Cells[0].Text));
                Bindgridview();
                notification("Error", "Product"+ product +"Deleted");
            }
        }

        protected void gvproduct_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvproduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                ProductDML pro = new ProductDML();
                if (string.IsNullOrEmpty(txtname.Text))
                {
                    notification("Error", "Please Enter Product name");
                }
                else if (string.IsNullOrEmpty(txtsaleprice.Text))
                {
                    notification("Error", "Please Enter Sale Price");
                }
                else if (string.IsNullOrEmpty(txtbuyingprice.Text))
                {
                    notification("Error", "Please Enter Buying Price");
                }
                else if (ddltype.SelectedIndex == 0)
                {
                    notification("Error", "Please select Type");
                }
                else if (ddlcategory.SelectedIndex == 0)
                {
                    notification("Error", "Please select Category");
                }
                else
                {
                    string supplier = (ddlsupplier.SelectedIndex == 0 ? null : ddlsupplier.SelectedValue);
                    pro.UpdateProduct(txtname.Text, Convert.ToInt32(ddltype.SelectedValue), Convert.ToInt32(ddlcategory.SelectedValue), supplier, txtsaleprice.Text, txtbuyingprice.Text, txtdesc.Text, Convert.ToInt32(ViewState["ProductID"]));
                    notification("Success", "Product Updated sucessfully");
                    Bindgridview();
                    pnlmain.Visible = false;
                    UserRights();
                }
            }
            catch (Exception ex)
            {
                divNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }
    }
}