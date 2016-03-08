using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using Shopping.DataLayer;
using System.Configuration;

namespace Shopping.BusinessLayer
{
    public class ShoppingCart
    {
        public string CategoryName;
        public int CategoryID;
        public string ProductName;
        public string ProductImage;
        public string ProductPrice;
        public string ProductDescription;

        public void AddNewCategory()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@CategoryName", CategoryName, SqlDbType.VarChar ,200);
            DataTable dt  = DataAccess.ExecuteDTByProcedure("SP_AddNewCategory",parameters);
        }
        
        public void AddNewProduct()
        {
            SqlParameter[] parameters = new SqlParameter[5];
            parameters[0] = DataAccess.AddParameter("@ProductName",ProductName,SqlDbType.VarChar,300);
            parameters[1] = DataAccess.AddParameter("@ProductDescription", ProductDescription, SqlDbType.VarChar, 1000);
            parameters[2] = DataAccess.AddParameter("@ProductPrice", ProductPrice,SqlDbType.Int, 100);
            parameters[3] = DataAccess.AddParameter("@ProductImage", ProductImage,SqlDbType.VarChar,500);
            parameters[4] = DataAccess.AddParameter("@CategoryID", CategoryID,SqlDbType.Int, 100);

            string connString = ConfigurationManager.ConnectionStrings["Shopping"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connString) )
            {
                SqlCommand cmd = new SqlCommand("insert into products (Name,Description,Price,ImageUrl,CategoryID) values (@ProductName,@ProductDescription,@ProductPrice,@ProductImage,@CategoryID)",connection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddRange(parameters);
                connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public DataTable GetCategories()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetAllCategories", parameters);

            return dt;
        }

    }
}