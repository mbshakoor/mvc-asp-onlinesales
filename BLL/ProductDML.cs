using SqlDataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProductDML
    {
        public DataTable GetTypes()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "SELECT * from Types";

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

        public DataTable GetSuppier()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "SELECT * from Suppliers";

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

        public DataTable GetCategory()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = @"WITH high(ID, Name, Generation, ParentID)
AS
(
    SELECT ID, Name, 0, ParentId
        FROM Category AS FirtGeneration
        WHERE ParentId = 0
    UNION ALL
    SELECT NextGeneration.Id, NextGeneration.Name, Parent.Generation + 1, Parent.ID
        FROM Category AS NextGeneration
        INNER JOIN high AS Parent ON NextGeneration.ParentId = Parent.ID
)
SELECT*
    FROM high Order by ID";

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

        public DataTable GetCategorychilds(int ParentID, int ID)
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "SELECT * from Category where ParentID="+ ParentID +" or ID="+ ID +"";

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

        public DataTable bindgrid()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "Select p.ProductID, p.Code, p.Name, t.Name as type, c.Name as category, s.Type as supplier, p.SalePrice, p.BuyingPrice, p.Description from Product p inner join Types t on t.ID=p.ProductType inner join Category c on c.ID=p.Category left join Suppliers s on s.ID=p.Supplier order by p.ProductID ASC";

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

        public DataTable getdropdownvalues(int ID)
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "Select Category, Supplier, ProductType from Product where ProductID="+ ID +"";

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

        public int InsertProduct(string code, string Name, int type, int category, string supplier, string saleprice, string buyingprice, string desc)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO Product (Code, Name, ProductType, Category, Supplier, SalePrice, Buyingprice, Description) VALUES ('" + code + "','" + Name + "', " + type + ", " + category + ", '" + supplier + "', '" + saleprice + "', '" + buyingprice + "', '"+ desc +"'); SELECT SCOPE_IDENTITY();";

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

        public int UpdateProduct(string Name, int type, int category, string supplier, string saleprice, string buyingprice, string desc, int ID)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "Update Product set Name='"+ Name +"', ProductType="+ type +", Category="+ category +", Supplier='"+ supplier +"', SalePrice='"+ saleprice +"', Buyingprice='"+ buyingprice +"', Description='"+ desc +"' where ProductID="+ ID +"";

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

        public int DeleteProduct(Int64 ID)
        {
            //Creating object of DAL class
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "DELETE FROM Product WHERE ProductID = " + ID;

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
