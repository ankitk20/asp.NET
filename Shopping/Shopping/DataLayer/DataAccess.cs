using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Shopping.DataLayer
{
    public class DataAccess
    {
        public static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Shopping"].ConnectionString.ToString();
            }
        }
        public static SqlParameter AddParameter( string parameterName, object value, SqlDbType DbType, int size )
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = parameterName;
            param.Value = value.ToString();
            param.SqlDbType = DbType;
            param.Size = size;
            param.Direction = ParameterDirection.Input;

            return param;
        }
        public static DataTable ExecuteDTByProcedure(string ProcedureName,SqlParameter[] Params)
        {
            string connString = ConfigurationManager.ConnectionStrings["Shopping"].ConnectionString;
            SqlConnection connection = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = ProcedureName;
            cmd.Parameters.AddRange(Params);                           
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dTable = new DataTable();

            try
            {
                adapter.Fill(dTable);
            }
            catch( Exception ex)
            {

            }
            finally
            {
                //disposing objects
                adapter.Dispose();
                cmd.Parameters.Clear();
                cmd.Dispose();
                connection.Dispose();
            }

            return dTable;
        }

    }
}