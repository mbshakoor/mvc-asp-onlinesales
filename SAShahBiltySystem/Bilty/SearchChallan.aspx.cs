using BLL;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAShahBiltySystem.Bilty
{
    public partial class SearchChallan : System.Web.UI.Page
    {
        #region Members

        int loginid;

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

        #endregion

        #region Helper Methods

        private void CheckBoxList(DataTable dt, CheckBoxList _cbl, string _cblValue, string _cblText, string _cblDefaultText)
        {
            if (dt.Rows.Count > 0)
            {
                _cbl.DataSource = dt;

                _cbl.DataValueField = _cblValue;
                _cbl.DataTextField = _cblText;

                _cbl.DataBind();
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginID > 0)
            {
                if (!IsPostBack)
                {
                    GetChallan();
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        public void GetChallan()
        {
            try
            {
                ChallanDML dml = new ChallanDML();
                DataTable dt = dml.GetReportData();
                if (dt.Rows.Count > 0)
                {
                    gvResult.DataSource = dt;
                }
                else
                {
                    gvResult.DataSource = null;
                }
                gvResult.DataBind();
            }
            catch (Exception ex)
            {
                notification("Error", "Cannot Get Data Due To: " + ex.Message);
            }
        }

        #region Custom Methods

        public void GetBills()
        {
            try
            {
                InvoiceDML dml = new InvoiceDML();
                DataTable dtBills = dml.GetBill();
                DataTable dtBill = new DataTable();
                dtBill.Columns.Add("BillNo");
                dtBill.Columns.Add("CustomerCompany");
                dtBill.Columns.Add("Total");
                dtBill.Columns.Add("TotalBalance");
                dtBill.Columns.Add("CreatedDate");
                dtBill.Columns.Add("CreditLimit");
                dtBill.Columns.Add("isPaid");
                if (dtBills.Rows.Count > 0)
                {
                    foreach (DataRow _drBills in dtBills.Rows)
                    {
                        DateTime CreatedDate = Convert.ToDateTime(_drBills["CreatedDate"]);
                        dtBill.Rows.Add(_drBills["BillNo"].ToString(), _drBills["CustomerCompany"].ToString(), _drBills["Total"].ToString(), (_drBills["TotalBalance"] == DBNull.Value ? "0" : _drBills["TotalBalance"].ToString()), CreatedDate.ToString("dd/MM/yyyy"), _drBills["CreditLimit"], _drBills["isPaid"]);
                    }
                }

                //gvInvoice.DataSource = dtBill.Rows.Count > 0 ? dtBill : null;
                //gvInvoice.DataBind();
            }
            catch (Exception ex)
            {
                notification("Error", "Error getting/binding Invoices, due to: " + ex.Message);
            }
        }

        public void GetInvoices(string Query)
        {
            try
            {
                InvoiceDML dml = new InvoiceDML();
                DataTable dtInvoice = dml.GetBill();
                //gvInvoice.DataSource = dtInvoice.Rows.Count > 0 ? dtInvoice : null;
                //gvInvoice.DataBind();
            }
            catch (Exception ex)
            {
                notification("Error", "Error getting/binding Invoices, due to: " + ex.Message);
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


        public void BindGrid(GridView _gv, DataTable _dt)
        {
            try
            {
                _gv.DataSource = _dt.Rows.Count > 0 ? _dt : null;
                _gv.DataBind();
            }
            catch (Exception ex)
            {
                notification("Error", "Error binding grid, due to: " + ex.Message);
            }
        }


        public void GetSetPettyCashAccount(string AccountName)
        {
            try
            {
                AccountsDML dmlAccounts = new AccountsDML();
                DataTable dtPettyCashAccountCheck = dmlAccounts.GetAccounts(AccountName);
                if (dtPettyCashAccountCheck.Rows.Count <= 0)
                {
                    dmlAccounts.CreatePettyCashAccount(AccountName);
                    dmlAccounts.InsertBillToPettyCash(AccountName, "0", "Account created (Auto)", 0, 0, 0, LoginID);
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error getting/setting broker account, due to: " + ex.Message);
            }
        }

        public void GetSetBankAccount(string AccountName)
        {
            try
            {
                BankAccountsDML dmlBankAccounts = new BankAccountsDML();
                DataTable dtBankAccountCheck = dmlBankAccounts.GetAccounts(AccountName);
                if (dtBankAccountCheck.Rows.Count <= 0)
                {
                    dmlBankAccounts.CreateAccount(AccountName);
                    dmlBankAccounts.InsertInAccount(AccountName, 0, "Account created", 0, 0, 0, "0", "0", LoginID);
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error getting/setting broker account, due to: " + ex.Message);
            }
        }

        public void GetSetCustomerAccount(string AccountName)
        {
            try
            {
                AccountsDML dmlAccounts = new AccountsDML();
                DataTable dtAccountCheck = dmlAccounts.GetAccounts(AccountName);
                if (dtAccountCheck.Rows.Count <= 0)
                {
                    dmlAccounts.CreateAccount(AccountName);
                    dmlAccounts.InsertInAccount(AccountName, 0, "Account Created (Auto)", 0, 0, 0, LoginID);
                }
            }
            catch (Exception ex)
            {
                notification("Error", "Error getting/setting broker account, due to: " + ex.Message);
            }
        }


        #region Translate Number to Words

        public String changeNumericToWords(double numb)
        {

            String num = numb.ToString(); return changeToWords(num, false);
        }

        public String changeCurrencyToWords(String numb)
        {

            return changeToWords(numb, true);
        }

        public String changeNumericToWords(String numb)
        {

            return changeToWords(numb, false);
        }

        public String changeCurrencyToWords(double numb)
        {

            return changeToWords(numb.ToString(), true);
        }

        private String changeToWords(String numb, bool isCurrency)
        {

            String val = "", wholeNo = numb, points = "", andStr = "", pointStr = "";

            String endStr = (isCurrency) ? ("Only") : ("");
            try

            {

                int decimalPlace = numb.IndexOf("."); if (decimalPlace > 0)
                {

                    wholeNo = numb.Substring(0, decimalPlace);

                    points = numb.Substring(decimalPlace + 1);

                    if (Convert.ToInt32(points) > 0)
                    {

                        andStr = (isCurrency) ? ("and") : ("point");// just to separate whole numbers from points/cents

                        endStr = (isCurrency) ? ("Cents " + endStr) : ("");
                        pointStr = translateCents(points);

                    }

                }

                val = String.Format("{0} {1}{2} {3}", translateWholeNumber(wholeNo).Trim(), andStr, pointStr, endStr);
            }

            catch {; }
            return val;
        }

        private String translateWholeNumber(String number)
        {

            string word = "";

            try

            {

                bool beginsZero = false;//tests for 0XX

                bool isDone = false;//test if already translated

                double dblAmt = (Convert.ToDouble(number));
                //if ((dblAmt > 0) && number.StartsWith("0"))

                if (dblAmt > 0)
                {//test for zero or digit zero in a nuemric

                    beginsZero = number.StartsWith("0");
                    int numDigits = number.Length;

                    int pos = 0;//store digit grouping

                    String place = "";//digit grouping name:hundres,thousand,etc...

                    switch (numDigits)
                    {

                        case 1://ones' range

                            word = ones(number);

                            isDone = true;
                            break;

                        case 2://tens' range

                            word = tens(number);

                            isDone = true;
                            break;

                        case 3://hundreds' range

                            pos = (numDigits % 3) + 1;

                            place = " Hundred ";
                            break;

                        case 4://thousands' range

                        case 5:
                        case 6:
                            pos = (numDigits % 4) + 1;

                            place = " Thousand ";

                            break;
                        case 7://millions' range

                        case 8:
                        case 9:
                            pos = (numDigits % 7) + 1;

                            place = " Million ";

                            break;
                        case 10://Billions's range

                            pos = (numDigits % 10) + 1;

                            place = " Billion ";
                            break;

                        //add extra case options for anything above Billion...

                        default:
                            isDone = true;

                            break;
                    }

                    if (!isDone)
                    {//if transalation is not done, continue...(Recursion comes in now!!)

                        word = translateWholeNumber(number.Substring(0, pos)) + place + translateWholeNumber(number.Substring(pos));

                        //check for trailing zeros

                        if (beginsZero) word = " and " + word.Trim();
                    }

                    //ignore digit grouping names

                    if (word.Trim().Equals(place.Trim())) word = "";
                }

            }

            catch {; }
            return word.Trim();
        }

        private String tens(String digit)
        {

            int digt = Convert.ToInt32(digit);

            String name = null; switch (digt)
            {

                case 10:

                    name = "Ten";
                    break;

                case 11:
                    name = "Eleven";

                    break;
                case 12:

                    name = "Twelve";
                    break;

                case 13:
                    name = "Thirteen";

                    break;
                case 14:

                    name = "Fourteen";
                    break;

                case 15:
                    name = "Fifteen";

                    break;
                case 16:

                    name = "Sixteen";
                    break;

                case 17:
                    name = "Seventeen";

                    break;
                case 18:

                    name = "Eighteen";
                    break;

                case 19:
                    name = "Nineteen";

                    break;
                case 20:

                    name = "Twenty";
                    break;

                case 30:
                    name = "Thirty";

                    break;
                case 40:

                    name = "Fourty";
                    break;

                case 50:
                    name = "Fifty";

                    break;
                case 60:

                    name = "Sixty";
                    break;

                case 70:
                    name = "Seventy";

                    break;
                case 80:

                    name = "Eighty";
                    break;

                case 90:
                    name = "Ninety";

                    break;
                default:

                    if (digt > 0)
                    {

                        name = tens(digit.Substring(0, 1) + "0") + " " + ones(digit.Substring(1));
                    }

                    break;
            }

            return name;
        }

        private String ones(String digit)
        {

            int digt = Convert.ToInt32(digit);
            String name = "";

            switch (digt)
            {

                case 1:
                    name = "One";

                    break;
                case 2:

                    name = "Two";
                    break;

                case 3:
                    name = "Three";

                    break;
                case 4:

                    name = "Four";
                    break;

                case 5:
                    name = "Five";

                    break;
                case 6:

                    name = "Six";
                    break;

                case 7:
                    name = "Seven";

                    break;
                case 8:

                    name = "Eight";
                    break;

                case 9:
                    name = "Nine";

                    break;
            }

            return name;
        }

        private String translateCents(String cents)
        {

            String cts = "", digit = "", engOne = ""; for (int i = 0; i < cents.Length; i++)
            {

                digit = cents[i].ToString();

                if (digit.Equals("0"))
                {

                    engOne = "Zero";
                }

                else

                {

                    engOne = ones(digit);

                }

                cts += " " + engOne;
            }

            return cts;
        }

        #endregion

        #endregion

        #region Events
        protected void gvResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Print")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    Int64 ChallanID = Convert.ToInt64(gvResult.DataKeys[index]["ChallanID"]);

                    ChallanDML dml = new ChallanDML();
                    DataTable dtReport = dml.GetReportData(ChallanID);

                    //pnlChallan.Visible = false;
                    //pnlChallanPreview.Visible = true;
                    rwChallan.LocalReport.DataSources.Add(new ReportDataSource("ChallanWithDetailsDataSet", dtReport));
                    rwChallan.LocalReport.ReportPath = Server.MapPath("~/Bilty/ChallanWithDetailsReport.rdlc");
                    rwChallan.LocalReport.DisplayName = "Challan_" + dtReport.Rows[0]["ChallanNo"].ToString() + "_" + DateTime.Now;
                    pnlChallanPreview.Attributes.Add("style", "display: block");
                    pnlChallan.Attributes.Add("style", "display: none");
                }

            }
            catch (Exception ex)
            {
                notification("Error", ex.Message);
            }
        }

        #region Grid's Events


        #endregion

        #region Linkbutton

        protected void lnkGenerateInvoice_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Challan.aspx");
            }
            catch (Exception ex)
            {
                notification("Error", "Error redirecting to create new invoice, due to: " + ex.Message);
            }
        }

        protected void lnkSavePayment_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    if (rbPaymentMode.SelectedIndex == -1)
            //    {
            //        modalPayment.Show();
            //        PaymentNotification("Error", "Please select payment mode");
            //        rbPaymentMode.Focus();
            //    }
            //    else if (cbPettyCash.Checked == false && ddlBankAccounts.SelectedIndex == 0)
            //    {
            //        modalPayment.Show();
            //        PaymentNotification("Error", "Please select bank account");
            //        ddlBankAccounts.Focus();
            //    }
            //    else if (txtAmount.Text == string.Empty || Convert.ToDouble(txtAmount.Text) <= 0)
            //    {
            //        modalPayment.Show();
            //        PaymentNotification("Error", "Please enter valid amount");
            //        txtAmount.Focus();
            //    }
            //    else
            //    {
            //        if (rbPaymentMode.SelectedItem.Text == "Cheque" && txtDocumentNo.Text == string.Empty)
            //        {
            //            modalPayment.Show();
            //            PaymentNotification("Error", "Please enter Document No.");
            //            txtDocumentNo.Focus();
            //        }
            //        else
            //        {
            //            //string BillNo = hfSelectedBill.Value;
            //            //string CustomerName = hfSelectedBillCustomer.Value.Trim();
            //            string DocumentNo = txtDocumentNo.Text;
            //            string TransferTo = cbPettyCash.Checked ? "PettyCash|PC123" : ddlBankAccounts.SelectedItem.Value;
            //            string PaymentMode = rbPaymentMode.SelectedItem.Text;
            //            double Amount = Convert.ToDouble(txtAmount.Text);
            //            bool PettyCash = cbPettyCash.Checked ? true : false;

            //            string Description = CustomerName + " Paid " + Amount + " by " + PaymentMode + ",";
            //            Description += PaymentMode == "Cheque" ? " (Chueque# " + DocumentNo + ")" : string.Empty;
            //            Description += " transfered to " + TransferTo;

            //            InvoiceDML dmlBill = new InvoiceDML();
            //            dmlBill.MakePaymentByBill(BillNo, Amount, DocumentNo, TransferTo, PaymentMode, LoginID);
            //            AccountsDML dmlAcc = new AccountsDML();
            //            BankAccountsDML dmlBankAcc = new BankAccountsDML();
            //            string AccountName = TransferTo;

            //            Int64 PettyCashAccountID = 0;
            //            Int64 BankAccountID = 0;

            //            if (PettyCash)
            //            {
            //                //Debitting from Petty Cash
            //                GetSetPettyCashAccount(AccountName);
            //                DataTable dtPettyCashAccount = dmlAcc.GetInAccounts(AccountName);
            //                double PettyCashBalance = (double)dtPettyCashAccount.Rows[dtPettyCashAccount.Rows.Count - 1]["Balance"];
            //                double PettyCashDebit = Amount;
            //                double PettyCashCredit = 0;

            //                PettyCashBalance = PettyCashBalance - PettyCashCredit + PettyCashDebit;
            //                PettyCashAccountID = dmlAcc.InsertBillToPettyCash(AccountName, BillNo, Description, PettyCashDebit, PettyCashCredit, PettyCashBalance, LoginID);
            //            }
            //            else
            //            {
            //                //Debitting from Bank Account
            //                Int64 BankID = 0;
            //                string[] BankAccountName = AccountName.Split('|');
            //                BanksDML dmlBank = new BanksDML();
            //                DataTable dtBank = dmlBank.GetBankByName(BankAccountName[0]);
            //                if (dtBank.Rows.Count > 0)
            //                {
            //                    BankID = Convert.ToInt64(dtBank.Rows[0]["BankID"]);
            //                    GetSetBankAccount(AccountName);
            //                    DataTable dtBankAccount = dmlBankAcc.GetInAccounts(AccountName, "ASC");
            //                    double BankAccountBalance = (double)dtBankAccount.Rows[dtBankAccount.Rows.Count - 1]["Balance"];
            //                    double BankAccountDebit = Amount;
            //                    double BankAccountCredit = 0;

            //                    BankAccountBalance = BankAccountBalance - BankAccountCredit + BankAccountDebit;
            //                    BankAccountID = dmlBankAcc.InsertInAccount(AccountName, BankID, Description, BankAccountDebit, BankAccountCredit, BankAccountBalance, "Automatic Payment System", "Transfering amount to bank after receiving Payment from Customer", LoginID);
            //                }
            //            }

            //            //Crediting from Customer Account
            //            if (PettyCashAccountID > 0 || BankAccountID > 0)
            //            {
            //                Int64 CompanyID = 0;
            //                string CompanyName = hfSelectedBillCustomer.Value.Trim();
            //                CompanyDML dmlCompany = new CompanyDML();
            //                DataTable dtCompany = dmlCompany.GetCompany(CompanyName);
            //                if (dtCompany.Rows.Count > 0)
            //                {
            //                    CompanyID = Convert.ToInt64(dtCompany.Rows[0]["CompanyID"]);
            //                    string CompanyCode = dtCompany.Rows[0]["CompanyCode"].ToString();
            //                    string CompanyAccountName = CompanyName + "|" + CompanyCode;
            //                    GetSetCustomerAccount(CompanyAccountName);
            //                    DataTable dtBankAccount = dmlAcc.GetInAccounts(CompanyAccountName);
            //                    double CustomerAccountBalance = (double)dtBankAccount.Rows[dtBankAccount.Rows.Count - 1]["Balance"];
            //                    double CustomerAccountDebit = 0;
            //                    double CustomerAccountCredit = Amount;

            //                    CustomerAccountBalance = CustomerAccountBalance - CustomerAccountCredit + CustomerAccountDebit;
            //                    Int64 CustomerAccountID = dmlAcc.InsertInAccount(CompanyAccountName, CompanyID, Description, CustomerAccountDebit, CustomerAccountCredit, CustomerAccountBalance, LoginID);
            //                }

            //            }

            //            notification("Success", Description);
            //            ResetPaymentFields();
            //            GetBills();
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    PaymentNotification("Error", "Error saving payment, due to: " + ex.Message);
            //    modalPayment.Show();
            //}
        }

        #endregion

        #endregion

        protected void lnkClose_Click(object sender, EventArgs e)
        {
            modalReport.Hide();
        }

        protected void lnkClosePrview_Click(object sender, EventArgs e)
        {
            try
            {
                pnlChallan.Attributes.Add("style", "display: block");
                pnlChallanPreview.Attributes.Add("style", "display: none");

            }
            catch (Exception ex)
            {
                notification("Error", "Error closing challan preview, due to: " + ex.Message);
            }
        }
    }
}