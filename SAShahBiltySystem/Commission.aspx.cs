using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAShahBiltySystem
{
    public partial class Commission : System.Web.UI.Page
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

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginID > 0)
            {
                if (!IsPostBack)
                {
                    pnlmain.Visible = false;
                    Bindgridview();
                    UserRights();
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
                foreach (GridViewRow row in gvcommission.Rows)
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
                foreach (GridViewRow row in gvcommission.Rows)
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
                foreach (GridViewRow row in gvcommission.Rows)
                {
                    LinkButton editbutton = (LinkButton)row.FindControl("lbedit");
                    LinkButton deletebutton = (LinkButton)row.FindControl("lbdelete");
                    editbutton.Visible = true;
                    deletebutton.Visible = true;
                }
            }
        }

        private void Bindgridview()
        {
            CommissionDML com = new CommissionDML();
            DataTable dt = com.bindmaingrid();
            gvcommission.DataSource = dt;
            gvcommission.DataBind();
        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            pnlmain.Visible = true;
            btnsave.Visible = true;
            btnupdate.Visible = false;
            txtMinAmount.Text = string.Empty;
            txtMaxAmount.Text = string.Empty;
            txtFixedAdditionalAmount.Text = string.Empty;
            txtPercentage.Text = string.Empty;
            txtCommissionAmount.Text = string.Empty;
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            pnlmain.Visible = false;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {
                CommissionDML com = new CommissionDML();
                if (string.IsNullOrEmpty(txtMinAmount.Text))
                {
                    notification("Error", "Please enter Min Order Amount");
                }
                else if (string.IsNullOrEmpty(txtMaxAmount.Text))
                {
                    notification("Error", "Please enter Max Order Amount");
                }
                else if (Convert.ToInt32(txtMinAmount.Text) > Convert.ToInt32(txtMaxAmount.Text))
                {
                    notification("Error", "Min Amount should be less than max Amount");
                }
                else if (string.IsNullOrEmpty(txtPercentage.Text) && string.IsNullOrEmpty(txtCommissionAmount.Text))
                {
                    notification("Error", "Please enter Percentage or Commission Amount");
                }
                else if (!string.IsNullOrEmpty(txtPercentage.Text) && !string.IsNullOrEmpty(txtCommissionAmount.Text))
                {
                    notification("Error", "Only one field will be used Percentage OR Commission Amount");
                }
                else if (!string.IsNullOrEmpty(txtPercentage.Text) && Convert.ToInt64(txtPercentage.Text) > 100)
                {
                    notification("Error", "Percentage should be between (0 to 100)");
                }
                else
                {
                    if (string.IsNullOrEmpty(txtFixedAdditionalAmount.Text))
                    {
                        txtFixedAdditionalAmount.Text = "0";
                    }
                    int percent = string.IsNullOrEmpty(txtPercentage.Text) ? 0 : Convert.ToInt32(txtFixedAdditionalAmount.Text) + (Convert.ToInt32(txtMaxAmount.Text) * Convert.ToInt32(txtPercentage.Text)) / 100;
                    int commAmount = string.IsNullOrEmpty(txtCommissionAmount.Text) ? 0 : Convert.ToInt32(txtFixedAdditionalAmount.Text) + Convert.ToInt32(txtCommissionAmount.Text);
                    com.InsertCommission(txtMinAmount.Text, txtMaxAmount.Text, txtFixedAdditionalAmount.Text, percent.ToString(), commAmount.ToString());
                    notification("Success", "Commission Added sucessfully");
                    pnlmain.Visible = false;
                    Bindgridview();
                    UserRights();
                }
            }
            catch (Exception ex)
            {
                divNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }

        protected void gvcommission_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                pnlmain.Visible = true;
                btnsave.Visible = false;
                btnupdate.Visible = true;
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvcommission.Rows[index];
                txtMinAmount.Text = row.Cells[1].Text;
                txtMaxAmount.Text = row.Cells[2].Text;
                if (Convert.ToInt64(row.Cells[3].Text) == 0)
                {
                    txtFixedAdditionalAmount.Text = string.Empty;
                }
                else
                {
                    txtFixedAdditionalAmount.Text = row.Cells[3].Text;
                }
                if (Convert.ToInt64(row.Cells[4].Text) == 0)
                {
                    txtPercentage.Text = string.Empty;
                }
                else
                {
                    if (Convert.ToInt64(row.Cells[3].Text) == 0)
                    {
                        int percent = (Convert.ToInt32(row.Cells[4].Text) * 100) / Convert.ToInt32(row.Cells[2].Text);
                        txtPercentage.Text = percent.ToString();
                    }
                    else
                    {
                        int percentvalue = Convert.ToInt32(row.Cells[4].Text) - Convert.ToInt32(row.Cells[3].Text);
                        int percent = (percentvalue * 100) / Convert.ToInt32(row.Cells[2].Text);
                        txtPercentage.Text = percent.ToString();
                    }
                }
                if (Convert.ToInt64(row.Cells[5].Text) == 0)
                {
                    txtCommissionAmount.Text = string.Empty;
                }
                else
                {
                    if (Convert.ToInt64(row.Cells[3].Text) == 0)
                    {
                        txtCommissionAmount.Text = row.Cells[5].Text;
                    }
                    else
                    {
                        int commAmount = Convert.ToInt32(row.Cells[5].Text) - Convert.ToInt32(row.Cells[3].Text);
                        txtCommissionAmount.Text = commAmount.ToString();
                    }
                }
                ViewState["ID"] = row.Cells[0].Text;
            }
            if (e.CommandName == "delete")
            {
                CommissionDML com = new CommissionDML();
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvcommission.Rows[index];
                com.DeleteCommission(Convert.ToInt32(row.Cells[0].Text));
                Bindgridview();
            }
        }

        protected void gvcommission_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvcommission_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                CommissionDML com = new CommissionDML();
                if (string.IsNullOrEmpty(txtMinAmount.Text))
                {
                    notification("Error", "Please enter Min Order Amount");
                }
                else if (string.IsNullOrEmpty(txtMaxAmount.Text))
                {
                    notification("Error", "Please enter Max Order Amount");
                }
                else if (Convert.ToInt32(txtMinAmount.Text) > Convert.ToInt32(txtMaxAmount.Text))
                {
                    notification("Error", "Min Amount should be less than max Amount");
                }
                else if (string.IsNullOrEmpty(txtPercentage.Text) && string.IsNullOrEmpty(txtCommissionAmount.Text))
                {
                    notification("Error", "Please enter Percentage or Commission Amount");
                }
                else if (!string.IsNullOrEmpty(txtPercentage.Text) && !string.IsNullOrEmpty(txtCommissionAmount.Text))
                {
                    notification("Error", "Only one field will be used Percentage OR Commission Amount");
                }
                else if (!string.IsNullOrEmpty(txtPercentage.Text) && Convert.ToInt64(txtPercentage.Text) > 100)
                {
                    notification("Error", "Percentage should be between (0 to 100)");
                }
                else
                {
                    if (string.IsNullOrEmpty(txtFixedAdditionalAmount.Text))
                    {
                        txtFixedAdditionalAmount.Text = "0";
                    }
                    int percent = string.IsNullOrEmpty(txtPercentage.Text) ? 0 : Convert.ToInt32(txtFixedAdditionalAmount.Text) + (Convert.ToInt32(txtMaxAmount.Text) * Convert.ToInt32(txtPercentage.Text)) / 100;
                    int commAmount = string.IsNullOrEmpty(txtCommissionAmount.Text) ? 0 : Convert.ToInt32(txtFixedAdditionalAmount.Text) + Convert.ToInt32(txtCommissionAmount.Text);
                    com.UpdateCommission(txtMinAmount.Text, txtMaxAmount.Text, txtFixedAdditionalAmount.Text, percent.ToString(), commAmount.ToString(), Convert.ToInt32(ViewState["ID"]));
                    notification("Success", "Commission Updated sucessfully");
                    pnlmain.Visible = false;
                    Bindgridview();
                }
            }
            catch (Exception ex)
            {
                divNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }
    }
}