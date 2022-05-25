using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAShahBiltySystem.Bilty
{
    public partial class WorkOrders : System.Web.UI.Page
    {
        #region Members

        int loginid;
        int gvInputRowBindingIndex;

        Random rnd = new Random();

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

        private string BiltiesSortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
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

        #endregion

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            notification();
            if (!IsPostBack)
            {
                GetWorkOrders();
                WorkOrderDML dml = new WorkOrderDML();
                DataTable dtParty = dml.GetPartyName();
                FillDropDown(dtParty, ddlPartyName, "CompanyID", "CompanyName", "-select-");
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

        //public void ConfirmSaveCompany(string Title, string Action)
        //{
        //    try
        //    {
        //        modalConfirmSaveNewCompany.Show();
        //        lblModalTitle.Text = Title;
        //        hfConfirmAction.Value = Action;
        //    }
        //    catch (Exception ex)
        //    {
        //        notification("Error", "Error confirming, due to: " + ex.Message);
        //    }
        //}

        public void GetWorkOrders(string sortExpression = "")
        {
            try
            {
                WorkOrderDML dml = new WorkOrderDML();
                DataTable dtWO = dml.GetWorkOrders_New();
                if (dtWO.Rows.Count > 0)
                {
                    gvResult.DataSource = dtWO;
                    if (BiltiesSortDirection != null)
                    {
                        DataView dv = dtWO.AsDataView();
                        this.BiltiesSortDirection = this.BiltiesSortDirection == "ASC" ? "DESC" : "ASC";
                        if (sortExpression != string.Empty)
                        {
                            dv.Sort = sortExpression + " " + this.BiltiesSortDirection;
                        }

                        gvResult.DataSource = dv;
                    }
                    else
                    {
                        gvResult.DataSource = dtWO;
                    }
                }
                else
                {
                    gvResult.DataSource = dtWO;
                }
                // gvResult.DataSource = dtWO.Rows.Count > 0 ? dtWO : null;
                gvResult.DataBind();
            }
            catch (Exception ex)
            {
                notification("Error", "Error Getting/Binding WorkOrders, due to: " + ex.Message);
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

        #endregion

        #region Events

        #region GridViews Events

        protected void gvResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "View")
                {
                    fillWorkOrderInputs(e);
                    toggleSenderInput(e.CommandName);
                }
                else if (e.CommandName == "change")
                {
                    fillWorkOrderInputs(e);
                    //toggleSenderInput(e.CommandName);
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public void fillWorkOrderInputs(GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow gvr = gvResult.Rows[index];
                Int64 WorkOrderID = Convert.ToInt64(gvResult.DataKeys[index]["WorkOrderID"]);
                Session["woID"] = WorkOrderID;
                if (e.CommandName == "change")
                {
                    Response.Redirect("CreateWorkOrder.aspx?ops=change");
                }
                else
                {
                    Response.Redirect("CreateWorkOrder.aspx");
                }

            }
            catch (Exception)
            {

                throw;
            }

        }

        public void toggleSenderInput(string operation)
        {
            try
            {
                Response.Redirect("CreateWorkOrder.aspx?ops=" + operation);
            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void gvResult_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[GetColumnIndexByName(e.Row, "DeliveryDate")].Text = ConvertDate(e.Row.Cells[GetColumnIndexByName(e.Row, "DeliveryDate")].Text, "dd-MMM-yyyy");
                    e.Row.Cells[GetColumnIndexByName(e.Row, "CreatedDate")].Text = ConvertDate(e.Row.Cells[GetColumnIndexByName(e.Row, "CreatedDate")].Text, "dd-MMM-yyyy");
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error binding rows, due to: " + ex.Message);
            }
        }

        #endregion

        #region LinkButtons Events

        protected void lnkAddNew_Click(object sender, EventArgs e)
        {
            try
            {
                Session["woID"] = string.Empty;
                Response.Redirect("CreateWorkOrder.aspx");
            }
            catch (Exception ex)
            {
                notification("Error", "Error redirecting to Create Work Order, due to: " + ex.Message);
            }
        }

        #endregion

        #endregion

        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            modalSearch.Show();
        }

        protected void lnkClose_Click(object sender, EventArgs e)
        {
            modalSearch.Hide();
        }

        protected void lnkSearchDetails_Click(object sender, EventArgs e)
        {
            try
            {
                string query = string.Empty;
                WorkOrderDML dml = new WorkOrderDML();
                DataTable dt = new DataTable();
                if (txtOrderNo.Text.Trim() == string.Empty && ddlPartyName.SelectedIndex == 0 && txtDeliveryDate.Text == string.Empty && txtCreateDateFrom.Text == string.Empty && txtCreateDateTo.Text == string.Empty)
                {
                    GetWorkOrders();
                }
                else
                {
                    if (txtOrderNo.Text != string.Empty)
                    {
                        query += "wo.WorkOrderNo like '%" + txtOrderNo.Text.Trim() + "%' and ";
                    }
                    if (ddlPartyName.SelectedIndex != 0)
                    {
                        query += "sc.CompanyName like '%" + ddlPartyName.SelectedItem.Text + "%' and ";
                    }
                    if (txtDeliveryDate.Text != string.Empty)
                    {
                        query += "DeliveryDate = '" + txtDeliveryDate.Text + "' and ";
                    }

                    if (txtCreateDateFrom.Text != string.Empty && txtCreateDateTo.Text != string.Empty)
                    {
                        query += "wo.CreatedDate BETWEEN '" + txtCreateDateFrom.Text + "' and '" + txtCreateDateTo.Text + "' and ";
                    }
                    else if (txtCreateDateFrom.Text != string.Empty && txtCreateDateTo.Text == string.Empty)
                    {
                        query += "wo.CreatedDate = '" + txtCreateDateFrom.Text + "' and ";

                    }
                    else if (txtCreateDateFrom.Text == string.Empty && txtCreateDateTo.Text != string.Empty)
                    {
                        query += "o.CreatedDate = '" + txtCreateDateTo.Text + "' and ";
                    }
                }
                query = query.Remove(query.Length - 5);
                dt = dml.getworkOrdersByKeyword(query, "ASC");
                gvResult.DataSource = dt;
                gvResult.DataBind();
                lnkClear.Visible = true;
            }
            catch (Exception ex)
            {
                notification("Error", "Unable to search due to: " + ex.Message);
            }
        }

        protected void lnkClear_Click(object sender, EventArgs e)
        {
            txtOrderNo.Text = string.Empty;
            txtCreateDateFrom.Text = string.Empty;
            txtCreateDateTo.Text = string.Empty;
            txtDeliveryDate.Text = string.Empty;
            ddlPartyName.SelectedIndex = 0;
            GetWorkOrders();
            lnkClear.Visible = false;
        }

        protected void gvResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvResult.PageIndex = e.NewPageIndex;
                this.GetWorkOrders();

            }
            catch (Exception ex)
            {
                notification("Error", "Error changing index of grid page, due to: " + ex.Message);
            }
        }

        protected void gvResult_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                this.GetWorkOrders(e.SortExpression);
            }
            catch (Exception ex)
            {
                notification("Error", "Error sorting bilties grid, due to: " + ex.Message);
            }
        }
    }
}