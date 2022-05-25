using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Drawing;

namespace SAShahBiltySystem
{
    public partial class Menus : System.Web.UI.Page
    {
        #region Members

        int loginid;

        #endregion

        #region Properties

        //public int LoginID
        //{
        //    get
        //    {
        //        //if (Request.QueryString["lid"] != string.Empty && Request.QueryString["lid"] != null)
        //        if (Session["LoginID"] != string.Empty && Session["LoginID"] != null)
        //        {
        //            loginid = Convert.ToInt32(Session["LoginID"].ToString());
        //        }
        //        return loginid;

        //    }
        //}
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

        #endregion

        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginID > 0)
            {
                notification("", "");
                MenuDML menu = new MenuDML();
                if (!IsPostBack)
                {
                    this.Title = "Menus";
                    pnlmain.Visible = false;
                    BindGridview();
                    DataTable dtgroups = menu.GetGroups();
                    FillDropDown(dtgroups, ddlgroup, "GroupID", "Name", "--Select Group--");
                    UserRights();
                }
            }
        }
        #endregion

        #region CustomMethods

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

        private void BindGridview()
        {
            MenuDML menu = new MenuDML();
            DataTable dtgrid = menu.bindgrid();
            gvusers.DataSource = dtgrid;
            gvusers.DataBind();
        }

        private void UserRights()
        {
            MenuDML menu = new MenuDML();
            DataTable dtlevel = menu.checklevel(LoginID);
            if (dtlevel.Rows[0]["Level"].ToString() == "1")
            {
                btnaddnew.Visible = false;
                foreach (GridViewRow row in gvusers.Rows)
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
                foreach (GridViewRow row in gvusers.Rows)
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
                foreach (GridViewRow row in gvusers.Rows)
                {
                    LinkButton editbutton = (LinkButton)row.FindControl("lbedit");
                    LinkButton deletebutton = (LinkButton)row.FindControl("lbdelete");
                    editbutton.Visible = true;
                    deletebutton.Visible = true;
                }
            }
        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            pnlmain.Visible = true;
            btnsave.Visible = true;
            btnupdate.Visible = false;
            txtusername.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtpw.Text = string.Empty;
            ddlgroup.SelectedIndex = 0;
            txtpw.Enabled = true;
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            pnlmain.Visible = false;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {
                MenuDML menu = new MenuDML();
                if (string.IsNullOrEmpty(txtusername.Text))
                {
                    notification("Error", "Please Enter Username");
                }
                else if (string.IsNullOrEmpty(txtemail.Text))
                {
                    notification("Error", "Please Enter Email");
                }
                else if (string.IsNullOrEmpty(txtpw.Text))
                {
                    notification("Error", "Please Enter Password");
                }
                else if (ddlgroup.SelectedIndex == 0)
                {
                    notification("Error", "Please Select Group");
                }
                else
                {
                    menu.InsertUser(txtusername.Text, txtemail.Text, txtpw.Text, Convert.ToInt32(ddlgroup.SelectedValue), DateTime.Now);
                    pnlmain.Visible = false;
                    notification("Success", "User Added sucessfully");
                    BindGridview();
                    UserRights();
                }
            }
            catch (Exception ex)
            {
                divNotification.InnerHtml = "<div class=\"alert alert-danger\">" + ex.Message + "</div>";
            }
        }

        protected void gvusers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                btnupdate.Visible = true;
                btnsave.Visible = false;
                pnlmain.Visible = true;
                MenuDML menu = new MenuDML();
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvusers.Rows[index];
                txtusername.Text = row.Cells[1].Text;
                txtemail.Text = row.Cells[2].Text;
                txtpw.Enabled = false;
                //txtpw.Text = gvusers.DataKeys[row.RowIndex].Value.ToString();
                DataTable dt = menu.getdropdownvalue(Convert.ToInt32(row.Cells[0].Text));
                if (dt.Rows.Count > 0)
                {
                    ddlgroup.SelectedValue = dt.Rows[0]["GroupID"].ToString();
                }
                ViewState["ID"] = row.Cells[0].Text;
            }

            if (e.CommandName == "delete")
            {
                MenuDML menu = new MenuDML();
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvusers.Rows[index];
                string User = " " + row.Cells[1].Text + " ";
                menu.DeleteUser(Convert.ToInt32(row.Cells[0].Text));
                BindGridview();
                notification("Error", "User" + User + "Deleted");
            }
        }

        protected void gvusers_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvusers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                MenuDML menu = new MenuDML();
                if (string.IsNullOrEmpty(txtusername.Text))
                {
                    notification("Error", "Please Enter Username");
                }
                else if (string.IsNullOrEmpty(txtemail.Text))
                {
                    notification("Error", "Please Enter Email");
                }
                else if (ddlgroup.SelectedIndex == 0)
                {
                    notification("Error", "Please Select Group");
                }
                else
                {
                    menu.UpdateUser(txtusername.Text, txtemail.Text, Convert.ToInt32(ddlgroup.SelectedValue), Convert.ToInt32(ViewState["ID"]));
                    pnlmain.Visible = false;
                    notification("Success", "User Updated sucessfully");
                    BindGridview();
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