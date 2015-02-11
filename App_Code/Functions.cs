using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Data.SqlClient;


    public sealed class Functions
    {
        static SqlConnection con = null;

        static Functions()
        {
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        }

        public static DataTable ExecuteSelectCommand(string CommandName)
        {
            SqlCommand cmd = null;
            DataTable table = new DataTable();

            cmd = con.CreateCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = CommandName;

            try
            {
                con.Open();

                SqlDataAdapter da = null;
                using (da = new SqlDataAdapter(cmd))
                {
                    da.Fill(table);
                }
                con.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                cmd = null;
            }

            return table;
        }

        public static DataTable ExecuteParamerizedSelectCommand(string CommandName, SqlParameter[] param)
        {
            SqlCommand cmd = null;
            DataTable table = new DataTable();

            cmd = con.CreateCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = CommandName;
            cmd.Parameters.AddRange(param);

            try
            {
                con.Open();

                SqlDataAdapter da = null;
                using (da = new SqlDataAdapter(cmd))
                {
                    da.Fill(table);
                }
                con.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                cmd = null;
            }

            return table;
        }

        public static long ExecuteNonQuery(string CommandName, SqlParameter[] pars)
        {
            SqlCommand cmd = null;
            int res = 0;

            cmd = con.CreateCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = CommandName;
            cmd.Parameters.AddRange(pars);

            try
            {
                con.Open();

                res = cmd.ExecuteNonQuery();

                con.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                cmd = null;
            }

            //if (res >= 1)
            //{
            //    return true;
            //}
            return res;
        }
    }
