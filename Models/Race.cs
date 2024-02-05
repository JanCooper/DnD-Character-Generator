using System;
using System.Collections.Generic;
using System.Linq;

namespace CharacterCreatorApp
{
	abstract class Race
	{
		// Returns random Age
		public int GetAge(int minAge, int maxAge)
		{
			return Utils.GetRandomInt(minAge, maxAge);
		}
		
		// Returns a race and gender specific name 
		public string GetRaceSpecificName(List<string> param) // race, gender
		{
			string query =
				@"EXEC sp_GetRaceSpecificName @param";

			return Data_DB.GetStringData(query, param);
		}
		
		// Returns height, weight, and body type description
		public Dictionary<string, string> GetDescription(string param, int maxAge, int minAge) // race
		{
			string query =
				@"EXEC sp_GetDescription @param";			 

			Dictionary<string, string> description = Data_DB.GetDictionaryData(query, param);

			description.Add("Age", GetAge(minAge, maxAge).ToString());
			
			int oldAgeModifier = maxAge - minAge / 4;
			int thisAge = Int32.Parse(description["Age"]);

			if (thisAge > maxAge - oldAgeModifier)
			{
				description["HairColor"] = String.Concat("White, wirey, ", description["HairColor"]);
				description["Face"] = String.Concat("loose-skinned, ", description["Face"], "-shaped face.");
			}

			return description;
		}

		public abstract string GetAlignment();

		public List<string> GetSkillProficiency(string race) // race
		{
			List<string> param = new List<string>()
			{ 
				"Race",
				race
			};

			string query =
				@"EXEC sp_SkillProficiency @param";

			return Data_DB.GetListData(query, param);
		}
	





		/*
		public Dictionary<string, string> GetAbilityIncrease(string param)
		{
			string query =
			@"SELECT StatIncrease, StatType"
			+ "FROM Race AS R"
			+ "LEFT JOIN SubRace AS SR ON R.ID = SR.RaceID"
			+ "LEFT JOIN StatType AS S ON R.StatID = S.ID"
			+ "WHERE Race = @param";

			return Data_DB.GetDictionaryData(query, param);
		}

		public Dictionary<string, string> GetAbilityIncrease(string race, string subrace) 
		{
			List<string> param = new List<string>()
			{
				race,
				subrace
			};

			string query =
			@"SELECT StatIncrease, StatType"
			+ "FROM Race AS R"
			+ "LEFT JOIN SubRace AS SR ON R.ID = SR.RaceID"
			+ "LEFT JOIN StatType AS S ON R.StatID = S.ID"
			+ "WHERE Race = @param[0]"
			+ "AND IF EXISTS( "
			+ "SELECT SubRace FROM SubRace"
			+ "WHERE SubRace = @param[1])";

			return Data_DB.GetDictionaryData(query, param);
		}

		public int GetAge(string race, Random random) 
		{
			string param = race;

			string query =
			@"SELECT MinAge, MaxAge"
			+ "FROM Race"
			+ "WHERE Race = @param";

			List<string> ageRange = Data_DB.GetListData(query, param);
			int minAge = Int32.Parse(ageRange.ElementAt(0));
			int maxAge = Int32.Parse(ageRange.ElementAt(1));

			return _random.Next(minAge, maxAge + 1);
		}

		public string GetAlignment(Random random)
		{
			List<string> alignment = new List<string>()
			{
				"Lawful Good",
				"Neutral Good",
				"Chaotic Good",
				"Lawful Neutral",
				"Neutral",
				"Chaotic Neutral"
			};

			int resultIndex = _random.Next(alignment.Count);

			return alignment.ElementAt(resultIndex);
		}

		

		public Dictionary<string, string> GetBonusAbility(string race)
		{
			Dictionary<string, string> result = new Dictionary<string, string>()
			{
				{"return", "Not Implemented" }
			};
			return result;
		}

		private int GetHeight(string param) // race
		{
			string query =
				@"SELECT MinHeight, MaxHeight" // in feet
				+ "FROM RacialSize AS S"
				+ "LEFT JOIN Race AS R ON S.ID = R.SizeID"
				+ "WHERE Race = @param";

			return Data_DB.GetIntData(query, param);
		}

		public string GetHitDice(string param) // race
		{
			string query =
				@"SELECT HitDice"
				+ "FROM Size AS S"
				+ "LEFT JOIN Race AS R ON S.ID = R.SizeID"
				+ "WHERE Race = @param";

			return Data_DB.GetStringData(query, param);
		}

		public int GetHitPoint(string race)
		{
			Dictionary<string, string> result = new Dictionary<string, string>()
			{
				{"return", "Not Implemented" }
			};
			return -1;
		}

		public List<string> GetLanguage(string param) // race
		{
			string query =
			@"SELECT Dialect"
			+ "FROM Dialect AS D"
			+ "LEFT JOIN Race AS R ON D.RaceID = R.ID"
			+ "WHERE Race = @param";

			return Data_DB.GetListData(query, param);
		}

		public Dictionary<string, string> GetMovement(string param) // race
		{
			string query =
			@"SELECT MovementType, Speed"
			+ "FROM Movement AS Move"
			+ "LEFT JOIN MovementType AS MT ON Move.MovementTypeID = MT.ID"
			+ "LEFT JOIN Race AS R ON Move.RaceID = R.ID"
			+ "WHERE Race = @param";

			return Data_DB.GetDictionaryData(query, param);
		}

		public Dictionary<string, string> GetPhysicalDescription(string race)
		{
			string bodyType = GetBodyType(race);
			int height = GetHeight(race);
			int weight = GetWeight(race);
			string face;
			string hair;
			string eyes;
			string nose;
			string mouth;

			Dictionary<string, string> result = new Dictionary<string, string>()
			{
				{"return", "Not Implemented" }
			};
			return result;
		}

		public List<string> GetResistance(string param) // race
		{
			string query =
			@"SELECT Resistance"
			+ "FROM Resistance AS Res"
			+ "LEFT JOIN Race AS R ON Res.RaceID = R.ID"
			+ "WHERE Race = @param";

			return Data_DB.GetListData(query, param);
		}

		public List<string> GetSense(string race)
		{
			List<string> result = new List<string>()
			{
				"Not Implemented" 
			};
			return result;
		}

		

		public string GetSubRace(string race, Random random) // race
		{
			string param = race;
			string query =
				@"SELECT Subrace"
				+ "FROM Subrace AS S"
				+ "LEFT JOIN Race AS R ON S.RaceID = R.ID"
				+ "WHERE Race = @param";

			List<string> dbResult = Data_DB.GetListData(query, param);
			string result = "";

			if(null != dbResult)
			{
				if (dbResult.Count > 1)
				{
					int i = _random.Next(1, dbResult.Count);
					result = dbResult.ElementAt(i);
				}
				else
				{
					result = dbResult.ElementAt(0);
				}
			}		

			return result;
		}

		private int GetWeight(string param) // race
		{
			string query =
				@"SELECT MinWeight, MaxHWeight" // in feet
				+ "FROM RacialSize AS S"
				+ "LEFT JOIN Race AS R ON S.RaceID = R.ID"
				+ "WHERE Race = @param";

			return Data_DB.GetIntData(query, param);
		}
		*/
	}
}
