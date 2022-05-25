using SqlDataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CommissionDML
    {
        public DataTable bindmaingrid()
        {
            CommandData _CommandData = new CommandData();
            try
            {
                _CommandData._CommandType = CommandType.Text;
                _CommandData.CommandText = "Select * from Commission order by CommissionID ASC";

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

        public int InsertCommission(string min, string max, string fixedamount, string percent, string commAmount)
        {
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "INSERT INTO Commission (MinAmount, MaxAmount, FixedAdditionalAmount, Percentage, CommissionAmount) VALUES ('" + min + "','" + max + "', '" + fixedamount + "', '" + percent + "', '" + commAmount + "'); SELECT SCOPE_IDENTITY();";

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

        public int UpdateCommission(string min, string max, string fixedamount, string percent, string commAmount, int ID)
        {
            //Creating object of DAL class
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "UPDATE Commission SET MinAmount = '" + min + "', MaxAmount = '" + max + "', FixedAdditionalAmount = '" + fixedamount + "', Percentage = '"+ percent +"', CommissionAmount = '"+ commAmount +"'  WHERE CommissionID = " + ID + ";";


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

        public int DeleteCommission(Int64 ID)
        {
            //Creating object of DAL class
            CommandData commandData = new CommandData();

            try
            {
                commandData._CommandType = CommandType.Text;
                commandData.CommandText = "DELETE FROM Commission WHERE CommissionID = " + ID;

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
