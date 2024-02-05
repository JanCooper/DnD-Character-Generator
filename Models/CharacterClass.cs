using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	class CharacterClass  
	{
		/********************* Class Constructor *********************/



		/********************* Internal Values *********************/



		/********************* Private Values *********************/




		/********************* Public Values *********************/



		/********************* Class Methods *********************/

		public string GetFeature(string idType, string featureType, int Lvl) 
		{
			List<string> param = new List<string>()
			{
				idType,
				featureType, 
				Lvl.ToString()
			};

			string query =
				@"EXEC sp_GetFeature @param";

			return Data_DB.GetStringData(query, param);
		}


	}
}
