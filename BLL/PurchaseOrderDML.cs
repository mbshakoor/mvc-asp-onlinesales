using SqlDataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class PurchaseOrderDML
    {
        public DataTable GetVendor()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "SELECT VendorID, VendorName, VendorCode from Vendor";

                _CommandData.OpenWithOutTrans();

                DataSet _ds = _CommandData.Execute(ExecutionType.ExecuteDataSet) as DataSet;
                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _CommandData.Close();
            }
        }

        public DataTable GetProduct()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "SELECT * from Product";

                _CommandData.OpenWithOutTrans();

                DataSet _ds = _CommandData.Execute(ExecutionType.ExecuteDataSet) as DataSet;
                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _CommandData.Close();
            }
        }

        public DataTable getvendordata(int vendorid)
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "Select * from Vendor where VendorID=" + vendorid + "";

                _CommandData.OpenWithOutTrans();

                DataSet _ds = _CommandData.Execute(ExecutionType.ExecuteDataSet) as DataSet;
                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _CommandData.Close();
            }
        }

        public int InsertVendor(string code, string name, string mobile, string email, string shopno)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO Vendor (VendorCode, VendorName, Mobile, Email, ShopNo) VALUES ('" + code + "', '" + name + "', '" + mobile + "', '" + email + "', '" + shopno + "'); SELECT SCOPE_IDENTITY();";

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

        public DataTable GetProductData(string column, string keyword)
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "SELECT * from Product where " + column + "='" + keyword + "'";

                _CommandData.OpenWithOutTrans();

                DataSet _ds = _CommandData.Execute(ExecutionType.ExecuteDataSet) as DataSet;
                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _CommandData.Close();
            }
        }

        public DataTable bindmaingrid()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "Select po.PurchaseOrderID, po.Code, v.VendorName, po.MobileNo, po.Email, po.ShopNo from PurchaseOrder po inner join Vendor v on v.VendorID=po.VendorID order by po.PurchaseOrderID ASC";

                _CommandData.OpenWithOutTrans();

                DataSet _ds = _CommandData.Execute(ExecutionType.ExecuteDataSet) as DataSet;
                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _CommandData.Close();
            }
        }

        public int InsertPurchaseOrder(string code, int VendorID, string mobileno, string email, string Shopno)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO PurchaseOrder (Code, VendorID, MobileNo, Email, ShopNo) VALUES ('" + code + "'," + VendorID + ", '" + mobileno + "', '" + email + "', '" + Shopno + "'); SELECT SCOPE_IDENTITY();";

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

        public int InsertPurchaseOrderDetail(string Code, int ProductID, int quantity, int UnitPrice, int Discount, int Total, int PurchaseOrderID)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO PurchaseOrderDetail (Code, ProductID, Quantity, UnitPrice, Discount, Total, PurchaseOrderID) VALUES ('" + Code + "', " + ProductID + ", " + quantity + ", " + UnitPrice + ", " + Discount + ", " + Total + ", " + PurchaseOrderID + "); SELECT SCOPE_IDENTITY();";

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

        public DataTable getdetaildata(int PurchaseOrderID)
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "Select po.Code as 'PurchaseOrder Code', pod.code as 'Product Code', p.Name, pod.Quantity, pod.UnitPrice, pod.Discount, pod.Total from PurchaseOrderDetail pod inner join PurchaseOrder po on po.PurchaseOrderID = pod.PurchaseOrderID inner join Product p on p.ProductID = pod.ProductID where po.PurchaseOrderID ='" + PurchaseOrderID + "'";

                _CommandData.OpenWithOutTrans();

                DataSet _ds = _CommandData.Execute(ExecutionType.ExecuteDataSet) as DataSet;
                return _ds.Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _CommandData.Close();
            }
        }

        public int DeletePurchaseOrder(Int64 ID)
        {
            //Creating object of DAL class
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "DELETE FROM PurchaseOrder WHERE PurchaseOrderID = " + ID;

                //commandData.AddParameter("@BrokerID", BrokerID);

                //opening connection
                commandData.OpenWithOutTrans();

                //Executing Query
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

        public int DeletePurchaseOrderDetail(Int64 ID)
        {
            //Creating object of DAL class
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "DELETE FROM PurchaseOrderDetail WHERE PurchaseOrderID = " + ID;

                //commandData.AddParameter("@BrokerID", BrokerID);

                //opening connection
                commandData.OpenWithOutTrans();

                //Executing Query
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
    }
}
