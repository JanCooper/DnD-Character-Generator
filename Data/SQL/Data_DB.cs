using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.Common;

namespace CharacterCreatorApp
{
	public static class Data_DB
	{
		private static string result;
		private static Dictionary<string, string> resultSet;
		internal const string connString = @"Server = DREAMER; Database = CharacterCreator; Trusted_Connection = True;";

		public static string GetStringData (string query, string param)
		{
			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			cmd.Parameters.Add(new SqlParameter("param", param));
			result = CallDB(conn, cmd);
			return result;
		}

		public static string GetStringData(string query, List<string> param)
		{
			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);

			for (int i = 0; i < param.Count; i++)
			{
				cmd.Parameters.Add(new SqlParameter("param", param[i]));
			}
			result = CallDB(conn, cmd);
			return result;
		}

		public static string GetStringData(string query, int param)
		{
			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			cmd.Parameters.Add(new SqlParameter("param", param));
			result = CallDB(conn, cmd);
			return result;
		}

		public static string GetStringData(string query, List<int> param)
		{
			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);

			for (int i = 0; i < param.Count; i++)
			{
				cmd.Parameters.Add(new SqlParameter("param", param[i]));
			}
			result = CallDB(conn, cmd);
			return result;
		}
		public static int GetIntData(string query, string param)
		{
			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			cmd.Parameters.Add(new SqlParameter("param", param));
			result = CallDB(conn, cmd);
			return Int32.Parse(result);
		}

		public static int GetIntData(string query, List<string> param)
		{
			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			cmd.Parameters.Add(new SqlParameter("param", param));
			result = CallDB(conn, cmd);
			return Int32.Parse(result);
		}

		public static Dictionary<string, string> GetDictionaryData (string query, string param)
		{
			resultSet = new Dictionary<string, string>();

			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			cmd.Parameters.Add(new SqlParameter("param", param));
			resultSet = CallDB(conn, cmd, resultSet);

			throw new NotImplementedException();
			// how does data come from db? String? Array? 
			// Need to parse into Dictionary
			//return resultSet;
		}
		public static Dictionary<string, string> GetDictionaryData(string query, List<string> param)
		{
			resultSet = new Dictionary<string, string>();

			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			cmd.Parameters.Add(new SqlParameter("param", param));
			resultSet = CallDB(conn, cmd, resultSet);

			throw new NotImplementedException();
			// how does data come from db? String? Array? 
			// Need to parse into Dictionary
			//return resultSet;
		}

		public static List<string> GetListData(string query, string param)
		{
			List<string> resultSet = new List<string>();

			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			cmd.Parameters.Add(new SqlParameter("param", param));
			resultSet = CallDB(conn, cmd, resultSet);
			return resultSet;
		}

		public static List<string> GetListData(string query, int param)
		{
			List<string> resultSet = new List<string>();

			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			cmd.Parameters.Add(new SqlParameter("param", param));
			resultSet = CallDB(conn, cmd, resultSet);
			return resultSet;
		}

		public static List<string> GetListData(string query)
		{
			List<string> resultSet = new List<string>();

			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			resultSet = CallDB(conn, cmd, resultSet);
			return resultSet;
		}

		public static List<string> GetListData(string query, List<string> param)
		{
			List<string> resultSet = new List<string>();

			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);

			for (int i = 0; i < param.Count; i++)
			{
				cmd.Parameters.Add(new SqlParameter("param", param[i]));
			}

			resultSet = CallDB(conn, cmd, resultSet);
			return resultSet;
		}

		public static string SaveData(string query)
		{
			SqlConnection conn = new SqlConnection(connString);
			SqlCommand cmd = new SqlCommand(query, conn);
			result = CallDB(conn, cmd);

			if (string.IsNullOrEmpty(result))
				return "Data saved";
			else
				return result;
		}

		private static string CallDB(SqlConnection conn, SqlCommand cmd)
		{
			try
			{
				using (conn)
				{
					conn.Open();
					SqlDataReader dr = cmd.ExecuteReader();
					dr.Close();

					if (string.IsNullOrEmpty(dr.GetString(0)))
						return "";
					else 
						return dr.GetString(0);
				}
			}
			catch (Exception ex)
			{
				return "Exception: " + ex.Message;
			}
		}

		private static Dictionary<string, string> CallDB(SqlConnection conn, SqlCommand cmd, Dictionary<string, string> resultSet)
		{
			try
			{
				using (conn)
				{
					conn.Open();
					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read())
					{
						resultSet.Add(dr.GetString(0), dr.GetString(1));
					}
					dr.Close();
					return resultSet;
				}
			} 
			catch (Exception ex)
			{
				resultSet.Add("Exception", ex.Message);
				return resultSet;
			}
		}

		private static List<string> CallDB(SqlConnection conn, SqlCommand cmd, List<string> resultSet)
		{
			try
			{
				using (conn)
				{
					conn.Open();
					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read())
					{
						resultSet.Add(dr.GetString(0));
					}
					dr.Close();
					return resultSet;
				}
			}
			catch (Exception ex)
			{
				resultSet.Add("Exception:" + ex.Message);
				return resultSet;
			}
		}
	}
}
