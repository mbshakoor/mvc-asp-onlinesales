using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace SAShahBiltySystem.Bilty
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        #region Members

        int loginid = 0;
        int employeeid = 0;
        DataTable loggedindata = new DataTable();

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



        public int EmployeeID
        {
            get
            {
                if (Session["LoggedInUserData"] != null)
                {
                    DataTable dt = (DataTable)Session["LoggedInUserData"];
                    if (dt.Rows[0]["EmployeeID"].ToString() != null)
                    {
                        employeeid = Convert.ToInt32(dt.Rows[0]["EmployeeID"]);
                    }
                    return employeeid;
                }
                else
                {
                    return employeeid;
                }
            }
        }



        public DataTable LoggedInData
        {
            get
            {
                //if (Request.QueryString["lid"] != string.Empty && Request.QueryString["lid"] != null)
                if (Session["LoggedInUserData"] != null && Session["LoggedInUserData"] != null)
                {
                    loggedindata = Session["LoggedInUserData"] as DataTable;
                }
                return loggedindata;

            }
        }

        #endregion

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoggedInData.Rows.Count > 0 && Session["LoggedInUserData"] != null)
            {
                LeftSideBar.InnerHtml = string.Empty;
                try
                {
                    if (LoggedInData.Rows.Count > 0)
                    {
                        UsersDML dmlUsers = new UsersDML();
                        DataTable dtUsers = dmlUsers.GetUserForHome(LoginID);
                        //if (dtUsers.Rows.Count > 0)
                        //{
                        lblLeftuserName.Text = LoggedInData.Rows[0]["UserName"].ToString();
                        //string imageUrl = LoggedInData.Rows[0]["Data"].ToString() == string.Empty ? "assets/images/DefaultUserImage.jpg" : ("data:image/jpg;base64," + Convert.ToBase64String((byte[])LoggedInData.Rows[0]["Data"]));
                        //LeftUserImage.ImageUrl = imageUrl;
                        //imgRightUserImage.ImageUrl = imageUrl;

                        try
                        {
                            NaviDML dml = new NaviDML();
                            DataTable dtMainMenus = LoggedInData.Rows[0]["UserName"].ToString() == "SuperAdmin" ? dml.GetMainMenus() : dml.GetMainMenus(EmployeeID);

                            if (dtMainMenus.Rows.Count > 0)
                            {
                                //LeftSideBar.InnerHtml += "<li class=\"\">";
                                //LeftSideBar.InnerHtml += "<a href = \"../Dashboard.aspx?lid=" + LoginID + "\">";
                                //LeftSideBar.InnerHtml += "<i class=\"fas fa-tachometer-alt\"></i>";
                                //LeftSideBar.InnerHtml += "<span class=\"title\">Dashboard</span>";
                                //LeftSideBar.InnerHtml += "</a>";
                                //LeftSideBar.InnerHtml += "</li>";
                                for (int i = 0; i < dtMainMenus.Rows.Count; i++)
                                {
                                    Int64 MenuID = Convert.ToInt64(dtMainMenus.Rows[i]["MenuID"]);
                                    string MenuIcon = dtMainMenus.Rows[i]["Icon"].ToString();
                                    DataTable dtSubMenues = new DataTable();
                                    if (LoggedInData.Rows[0]["UserName"].ToString() == "SuperAdmin")
                                    {

                                        dtSubMenues = dml.GetSubMenus(MenuID);
                                        //dtSubMenues = dml.GetSubMenus(MenuID, EmployeeID);
                                        if (dtSubMenues.Rows.Count > 0)
                                        {


                                            LeftSideBar.InnerHtml += "<li>";
                                            LeftSideBar.InnerHtml += "<a href=\"#\" class=\"sidebar-nav-menu\"><i class=\"fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide\"></i><i class=\"" + MenuIcon + " sidebar-nav-icon\"></i><span class=\"sidebar-nav-mini-hide\">" + dtMainMenus.Rows[i]["MenuName"].ToString() + "</span></a>";

                                            LeftSideBar.InnerHtml += "<ul class=\"sub-menu\">";
                                            for (int j = 0; j < dtSubMenues.Rows.Count; j++)
                                            {
                                                string SubmenuIcon = dtSubMenues.Rows[j]["icon"].ToString();
                                                if (dtSubMenues.Rows[j]["FormName"].ToString() == "User Account" || dtSubMenues.Rows[j]["FormName"].ToString() == "Navigation Menu" || dtSubMenues.Rows[j]["FormName"].ToString() == "Adjustment" || dtSubMenues.Rows[j]["FormName"].ToString() == "Forced Attendance")
                                                {
                                                    if (LoggedInData.Rows[0]["UserName"].ToString() == "SuperAdmin")
                                                    {
                                                        LeftSideBar.InnerHtml += "</li>";
                                                        LeftSideBar.InnerHtml += "<a href=\"" + Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "/" + dtSubMenues.Rows[j]["url"].ToString() + "\" target=\"" + dtSubMenues.Rows[j]["formTarget"].ToString() + "\">" + dtSubMenues.Rows[j]["FormName"].ToString() + "</a>";
                                                        LeftSideBar.InnerHtml += "</li>";
                                                    }
                                                }
                                                else
                                                {
                                                    LeftSideBar.InnerHtml += "</li>";
                                                    LeftSideBar.InnerHtml += "<a href=\"" + Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "/" + dtSubMenues.Rows[j]["url"].ToString() + "\" target=\"" + dtSubMenues.Rows[j]["formTarget"].ToString() + "\">" + dtSubMenues.Rows[j]["FormName"].ToString() + "</a>";
                                                    LeftSideBar.InnerHtml += "</li>";
                                                }
                                            }
                                            LeftSideBar.InnerHtml += " </ul>";
                                            LeftSideBar.InnerHtml += "</li>";
                                        }
                                        else
                                        {
                                            LeftSideBar.InnerHtml += "<a href=\"index.html\" class=\" \"><i class=\"" + MenuIcon + " sidebar-nav-icon\"></i><span class=\"sidebar-nav-mini-hide\">" + dtMainMenus.Rows[i]["MenuName"].ToString() + "</span></a>";
                                        }
                                    }
                                    else
                                    {
                                        dtSubMenues = dml.GetSubMenus(MenuID, EmployeeID);
                                        if (dtSubMenues.Rows.Count > 0)
                                        {


                                            LeftSideBar.InnerHtml += "<li>";
                                            LeftSideBar.InnerHtml += "<a href=\"#\" class=\"sidebar-nav-menu\"><i class=\"fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide\"></i><i class=\"" + MenuIcon + " sidebar-nav-icon\"></i><span class=\"sidebar-nav-mini-hide\">" + dtMainMenus.Rows[i]["MenuName"].ToString() + "</span></a>";

                                            LeftSideBar.InnerHtml += "<ul class=\"sub-menu\">";
                                            for (int j = 0; j < dtSubMenues.Rows.Count; j++)
                                            {
                                                string SubmenuIcon = dtSubMenues.Rows[j]["icon"].ToString();
                                                if (dtSubMenues.Rows[j]["FormName"].ToString() == "User Account" || dtSubMenues.Rows[j]["FormName"].ToString() == "Navigation Menu")
                                                {
                                                    if (LoggedInData.Rows[0]["UserName"].ToString() == "SuperAdmin")
                                                    {
                                                        LeftSideBar.InnerHtml += "</li>";
                                                        LeftSideBar.InnerHtml += "<a href=\"" + Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "/" + dtSubMenues.Rows[j]["url"].ToString() + "\" target=\"" + dtSubMenues.Rows[j]["formTarget"].ToString() + "\">" + dtSubMenues.Rows[j]["FormName"].ToString() + "</a>";
                                                        LeftSideBar.InnerHtml += "</li>";
                                                    }
                                                }
                                                else
                                                {
                                                    LeftSideBar.InnerHtml += "</li>";
                                                    LeftSideBar.InnerHtml += "<a href=\"" + Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "/" + dtSubMenues.Rows[j]["url"].ToString() + "\" target=\"" + dtSubMenues.Rows[j]["formTarget"].ToString() + "\">" + dtSubMenues.Rows[j]["FormName"].ToString() + "</a>";
                                                    LeftSideBar.InnerHtml += "</li>";
                                                }
                                            }
                                            LeftSideBar.InnerHtml += " </ul>";
                                            LeftSideBar.InnerHtml += "</li>";
                                        }
                                        else
                                        {
                                            LeftSideBar.InnerHtml += "<a href=\"index.html\" class=\" \"><i class=\"" + MenuIcon + " sidebar-nav-icon\"></i><span class=\"sidebar-nav-mini-hide\">" + dtMainMenus.Rows[i]["MenuName"].ToString() + "</span></a>";
                                        }
                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            throw;
                        }
                        //}
                    }
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
            else
            {

                Response.Redirect("Login.aspx");
            }
        }

        #endregion

        #region Events

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("LoggedInUserData");
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        #endregion
    }
}