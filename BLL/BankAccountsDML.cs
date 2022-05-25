﻿using SqlDataAccess_BankAccounts;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BankAccountsDML
    {
        #region Members

        string bankaccountsdbname;


        string biltysystemdbname;

        #endregion

        #region Properties

        public string AccountsDBName
        {
            get
            {
                //accountsdbname = "BiltySystemAccounts";
                bankaccountsdbname = "SABiltySystemBankAccounts";
                return bankaccountsdbname;
            }
        }

        public string BiltySystemDBName
        {
            get
            {
                //accountsdbname = "BiltySystemAccounts";
                biltysystemdbname = "SABiltySystem_new";
                return biltysystemdbname;
            }
        }

        #endregion

        #region Get Methods

        public DataTable GetBankAccounts()
        {
            //Creating object of DAL class
            CommandData _commnadData = new CommandData();

            try
            {
                _commnadData._CommandType = CommandType.Text;
                _commnadData.CommandText = "SELECT acc.*, b.BankID FROM " + AccountsDBName + ".INFORMATION_SCHEMA.TABLES acc INNER JOIN " + BiltySystemDBName + ".dbo.Banks b ON b.Name = LEFT(TABLE_NAME, charindex('|', TABLE_NAME) - 1)  WHERE TABLE_TYPE = 'BASE TABLE' ";

                //opening connection
                _commnadData.OpenWithOutTrans();

                //Executing Query
                DataSet _ds = _commnadData.Execute(ExecutionType.ExecuteDataSet) as DataSet;

                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                //Console.WriteLine("No record found");
                throw ex;
            }
            finally
            {
                //Console.WriteLine("No ");
                _commnadData.Close();

            }
        }

        public DataTable GetAccounts(string TableName)
        {
            //Creating object of DAL class
            CommandData _commnadData = new CommandData();

            try
            {
                _commnadData._CommandType = CommandType.Text;
                _commnadData.CommandText = "SELECT * FROM " + AccountsDBName + ".INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME = '" + TableName + "'";

                //opening connection
                _commnadData.OpenWithOutTrans();

                //Executing Query
                DataSet _ds = _commnadData.Execute(ExecutionType.ExecuteDataSet) as DataSet;

                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                //Console.WriteLine("No record found");
                throw ex;
            }
            finally
            {
                //Console.WriteLine("No ");
                _commnadData.Close();

            }
        }

        public DataTable GetInAccounts(string AccountName, string OrderState)
        {
            //Creating object of DAL class
            CommandData _commnadData = new CommandData();

            try
            {
                _commnadData._CommandType = CommandType.Text;
                _commnadData.CommandText = "SELECT * FROM [" + AccountName + "] ORDER BY AccountID " + OrderState;

                //opening connection
                _commnadData.OpenWithOutTrans();

                //Executing Query
                DataSet _ds = _commnadData.Execute(ExecutionType.ExecuteDataSet) as DataSet;

                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                //Console.WriteLine("No record found");
                throw ex;
            }
            finally
            {
                //Console.WriteLine("No ");
                _commnadData.Close();

            }
        }

        public DataTable GetInAccountsAlonBankInfo(string AccountName, string OrderState)
        {
            //Creating object of DAL class
            CommandData _commnadData = new CommandData();

            try
            {
                _commnadData._CommandType = CommandType.Text;
                _commnadData.CommandText = "SELECT ba.*, b.BankID, b.AccountNo, b.AccountTitle, b.Name FROM [" + AccountName + "] ba INNER JOIN " + BiltySystemDBName + ".dbo.Banks b ON b.BankID = ba.BnkID ORDER BY AccountID " + OrderState;

                //opening connection
                _commnadData.OpenWithOutTrans();

                //Executing Query
                DataSet _ds = _commnadData.Execute(ExecutionType.ExecuteDataSet) as DataSet;

                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                //Console.WriteLine("No record found");
                throw ex;
            }
            finally
            {
                //Console.WriteLine("No ");
                _commnadData.Close();

            }
        }

        public DataTable GetInAccounts(string AccountName, DateTime DateFrom, DateTime DateTo)
        {
            //Creating object of DAL class
            CommandData _commnadData = new CommandData();

            try
            {
                _commnadData._CommandType = CommandType.Text;
                _commnadData.CommandText = "SELECT * FROM [" + AccountName + "] WHERE CONVERT(date, DateCreated) BETWEEN '" + DateFrom + "' AND '" + DateTo + "'";

                //opening connection
                _commnadData.OpenWithOutTrans();

                //Executing Query
                DataSet _ds = _commnadData.Execute(ExecutionType.ExecuteDataSet) as DataSet;

                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                //Console.WriteLine("No record found");
                throw ex;
            }
            finally
            {
                //Console.WriteLine("No ");
                _commnadData.Close();

            }
        }

        #endregion

        #region Insert

        public int CreateAccount(string Name)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = @"
                                            CREATE TABLE[dbo].[" + Name + @"](

                                                [AccountID][bigint] IDENTITY(1, 1) NOT NULL,

                                                [BnkID] [bigint] NULL,
	                                            [Item] [nvarchar] (250) NULL,
	                                            [Debit] [float] NULL,
	                                            [Credit] [float] NULL,
	                                            [Balance] [float] NULL,
                                                [TransactedBy] [nvarchar] (250) NULL,
                                                [TransactedFor] [nvarchar] (250) NULL,
	                                            [CreatedByID] [bigint] NULL,
	                                            [DateCreated] [datetime] NULL,
	                                            [ModifiedById] [bigint] NULL,
	                                            [DateModified] [datetime] NULL,
                                                CONSTRAINT[PK_" + Name + @"] PRIMARY KEY CLUSTERED
                                            (
                                                [AccountID] ASC
                                            )WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON[PRIMARY]
                                            ) ON[PRIMARY]
                                            
                                            ";

                commandData.AddParameter("@Name", Name);

                commandData.OpenWithOutTrans();

                Object valReturned = commandData.Execute(ExecutionType.ExecuteScalar);

                return Convert.ToInt32(valReturned);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                commandData.Close();
            }
        }

        public int InsertInAccount(string AccountName, Int64 BankID, string Description, double OpeningBalance, Int64 LoginID)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO [" + AccountName + "] (BnkID, Item, Balance, CreatedByID, DateCreated) VALUES (" + BankID + ", '" + Description + "', " + OpeningBalance + ", " + LoginID + ", GETDATE()); SELECT SCOPE_IDENTITY();";



                commandData.OpenWithOutTrans();

                Object valReturned = commandData.Execute(ExecutionType.ExecuteScalar);

                return Convert.ToInt32(valReturned);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                commandData.Close();
            }
        }

        public int InsertInAccount(string AccountName, Int64 BankID, string Description, double Debit, double Credit, double Balance, string TransactedBy, string TransactedFor, Int64 LoginID)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO [" + AccountName + "] (BnkID, Item, Debit, Credit, Balance, TransactedBy, Transactedfor, CreatedByID, DateCreated) VALUES (" + BankID + ", '" + Description + "', " + Debit + ", " + Credit + ", " + Balance + ", '" + TransactedBy + "', '" + TransactedFor + "', " + LoginID + ", GETDATE()); SELECT SCOPE_IDENTITY();";

                commandData.OpenWithOutTrans();

                Object valReturned = commandData.Execute(ExecutionType.ExecuteScalar);

                return Convert.ToInt32(valReturned);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                commandData.Close();
            }
        }

        #endregion
    }
}
