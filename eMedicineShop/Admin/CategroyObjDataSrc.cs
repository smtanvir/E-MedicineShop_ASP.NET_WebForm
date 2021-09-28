using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace eMedicineShop.Models
{
   
        public static class CategroyObj
        {
            [DataObjectMethod(DataObjectMethodType.Select)]
            public static List<Category> GetCategories()
            {
                List<Category> categoryList = new List<Category>();
                string sqlCmd = "SELECT CategoryId, CategoryName FROM Categories";
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        Category category;
                        while (dr.Read())
                        {
                            category = new Category();
                            category.CategoryId = (int)dr["CategoryId"];
                            category.CategoryName = dr["CategoryName"].ToString();
                            categoryList.Add(category);
                        }
                        dr.Close();
                    }
                }
                return categoryList;
            }

            [DataObjectMethod(DataObjectMethodType.Insert)]
            public static void InsertCategory(Category category)
            {
                string sqlCmd = "INSERT INTO Categories (CategoryName) VALUES (@CategoryName)";
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
                    {
                        cmd.Parameters.AddWithValue("CategoryName", category.CategoryName);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }

            [DataObjectMethod(DataObjectMethodType.Delete)]
            public static void DeleteCategory(Category category)
            {
                //int id = 0;
                string sqlCmd = "DELETE FROM Categories WHERE CategoryId = @CategoryId";
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
                    {
                        cmd.Parameters.AddWithValue("CategoryId", category.CategoryId);
                        con.Open();
                        /*id= */
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                //return id;
            }

            [DataObjectMethod(DataObjectMethodType.Update)]
            public static void UpdateCategory(Category category)
            {
                string sql = "UPDATE Categories SET CategoryName = @CategoryName WHERE CategoryId = @CategoryId";
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("CategoryId", category.CategoryId);
                        cmd.Parameters.AddWithValue("CategoryName", category.CategoryName);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }

            private static string GetConnectionString()
            {
                return ConfigurationManager.ConnectionStrings
                    ["eMedicineShopCon"].ConnectionString;
            }
        }
    
}