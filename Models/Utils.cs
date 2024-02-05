using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Security;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	public static class Utils
	{
		internal static Random _random = new Random();

		public static string GetRandomListItem(List<string> list)
		{
			int i = _random.Next(list.Count);
			return list[i];
		}

		public static string GetRandomDictionaryItem(Dictionary<string, string> dictionary)
		{
			int i = _random.Next(dictionary.Count);

			return String.Format("{0}: {1}", dictionary.Keys.ElementAt(i), dictionary.Values.ElementAt(i));				
		}

		public static Dictionary<string, string> GetObjectProperties(Object obj)
		{
			Dictionary<string, string> result = new Dictionary<string, string>();

			Type objType = obj.GetType();
			IList<PropertyInfo> properties = new List<PropertyInfo>(objType.GetProperties());

			foreach(PropertyInfo prop in properties)
			{
				result.Add(prop.ToString(), prop.GetValue(obj, null).ToString());
			}

			return result;
		}

		public static int GetRandomInt(int min, int max)
		{
			return _random.Next(min, max + 1);
		}


	}
}
