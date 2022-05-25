using SqlDataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
  public  class SaleOrderDML
    {
        public DataTable GetCourier()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "SELECT * from Courier";

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

        public DataTable GetCustomer()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "SELECT CustomerID, CustomerName, CustomerCode from Customer";

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

        public DataTable GetProductData(string column, string keyword)
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "SELECT * from Product where "+ column +"='"+keyword+"'";

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

        public int InsertCustomer(string code, string name, string mobile, string email, string resiadd, string postadd)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO Customer (CustomerCode, CustomerName, Mobile, Email, ResidentialAddress, PostalAddress) VALUES ('" + code + "', '" + name + "', '" + mobile + "', '" + email + "', '" + resiadd + "', '"+postadd+"'); SELECT SCOPE_IDENTITY();";

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

        public DataTable bindmaingrid()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "Select so.SaleOrderID, so.Code, c.CustomerName, so.MobileNo, so.Email, cr.Name, so.DeliveryChargesAmount, so.ShippingAddress from SaleOrder so inner join Customer c on c.CustomerID=so.CustomerID inner join Courier cr on cr.CourierID=so.CourierID order by so.SaleOrderID ASC";

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

        public DataTable getcustomerdata(int customerid)
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "Select * from Customer where CustomerID="+customerid+"";

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

        public int InsertSaleOrder(string code, int CustomerID, string mobileno, string email, string shippingaddress, int CourierID, int DCA)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO SaleOrder (Code, CustomerID, MobileNo, Email, ShippingAddress, CourierID, DeliveryChargesAmount) VALUES ('"+ code +"'," + CustomerID + ", '" + mobileno + "', '" + email + "', '" + shippingaddress + "', " + CourierID + ", " + DCA + "); SELECT SCOPE_IDENTITY();";

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

        public int InsertSaleOrderDetail(string Code, int ProductID, int quantity, int UnitPrice, int Discount, int Total, int SaleOrderID)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO SaleOrderDetail (Code, ProductID, Quantity, UnitPrice, Discount, Total, SaleOrderID) VALUES ('" + Code + "', " + ProductID + ", " + quantity + ", " + UnitPrice + ", " + Discount + ", " + Total + ", "+SaleOrderID+"); SELECT SCOPE_IDENTITY();";

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

        public DataTable getdetaildata(int SaleOrderID)
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "Select so.Code as 'SaleOrder Code', sod.code as 'Product Code', p.Name, sod.Quantity, sod.UnitPrice, sod.Discount, sod.Total from SaleOrderDetail sod inner join SaleOrder so on so.SaleOrderID= sod.SaleOrderID inner join Product p on p.ProductID=sod.ProductID where so.SaleOrderID='" + SaleOrderID +"'";

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

        public int DeleteSaleOrder(Int64 ID)
        {
            //Creating object of DAL class
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "DELETE FROM SaleOrder WHERE SaleOrderID = " + ID;

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

        public int DeleteSaleOrderDetail(Int64 ID)
        {
            //Creating object of DAL class
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "DELETE FROM SaleOrderDetail WHERE SaleOrderID = " + ID;

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
