using System;
using System.Collections.Generic;
using System.Drawing;
using System.Runtime.Remoting.Messaging;
using System.Security;

namespace CharacterCreatorApp
{
	class DragonBorn : Race, IRace
	{
		/********************* Class Constructor *********************/
		public DragonBorn(string Race)
		{
			_name = Race;
		}

		/********************* Internal Values *********************/
		internal string _name { get; private set; }
		internal Random random = new Random();
		internal const int minAge = 15;
		internal const int maxAge = 85;

		/********************* Private Values *********************/
		private int _age { get { return Int32.Parse(_description["Age"]); } }
		private int _speed { get { return 30; } }

		private string _alignment { get { return GetAlignment(); } }
		private string _characterName
		{
			get
			{
				List<string> param = new List<string>()
				{
					_name,
					_gender
				};

				return GetRaceSpecificName(param);
			}
		}
		private string _gender { get { return _description["Gender"]; } } 
		private string _resistance { get { return _racialTraits["Draconic Ancestry Resistance"]; } }

		private List<string> _languages
		{ 
			get 
			{
				List<string> racialLanguages = new List<string>()
				{
					"Common",
					"Draconic"
				};
				return racialLanguages;
			} 
		}

		private List<string> _skillProficiency { get { return GetSkillProficiency(_name); } }

		private Dictionary<string, string> _description { get { return GetDescription(); } }

		private Dictionary<string, string> _racialTraits
		{ 
			get 
			{
				Dictionary<string, string> breathWeapon = GetAncestry(BodyDescription["Skin"]);
				Dictionary<string, string> racialTraits = new Dictionary<string, string>()
				{
					{ "Draconic Ancestry", String.Format("Breath Weapon: {0} of {1} damage ({2} save)", breathWeapon["Breath"], breathWeapon["DamageType"], breathWeapon["SaveType"])},
					{ "Draconic Ancestry Resistance", breathWeapon["DamageType"] },
				};

				return racialTraits; 
			} 
		}

		private Dictionary<string, int> _racialAbility
		{
			get 
			{
				Dictionary<string, int> abilityIncrease = new Dictionary<string, int>()
				{
					{ "Strength", 2},
					{ "Charisma", 1},
				};

				return abilityIncrease;
			}
		}




		/********************* Public Values *********************/
		public int Age { get { return _age; } }
		public int Speed { get { return _speed; } }

		public string Alignment { get { return _alignment; } }
		public string CharacterName { get { return _characterName; } }
		public string Gender { get { return _gender; } }
		public string Race { get { return _name; } }
		public string Resistance { get { return _resistance; } }

		public List<string> Languages { get { return _languages; } }
		public List<string> SkillProficiency { get { return _skillProficiency; } }

		public Dictionary<string, int> RacialAbility { get { return _racialAbility; } }

		public Dictionary<string, string> RacialTraits { get { return _racialTraits; } }
		public Dictionary<string, string> BodyDescription { get { return _description; } }




		/********************* Class Methods *********************/

		private Dictionary<string, string> GetDescription() 
		{
			string param = _name;
			string query =
				@"EXEC sp_GetDescription @param";

			Dictionary<string, string> description = Data_DB.GetDictionaryData(query, param);

			int oldAgeModifier = maxAge - minAge / 4;
			int thisAge = Int32.Parse(description["Age"]);

			if (thisAge > maxAge - oldAgeModifier)
			{
				description["HairColor"] = String.Concat("Faded, somewhat soft and loosely drooping ", description["HairStyle"]);
			}

			return description;
		}

		public override string GetAlignment()
		{
			int i = random.Next(0, 100);
			int value;

			if(i < 75)
			{
				int[] options = { 1, 2, 3, 7, 8 };
				int choice = random.Next(0, 5);
				value = options[choice];
			}
			else
			{
				int[] options = { 4, 5, 6 };
				int choice = random.Next(0, 3);
				value = options[choice];
			}

			return ((EnumAlignment)value).ToString();
		}

		private Dictionary<string, string> GetAncestry(string param) // skin color
		{
			string query =
				@"EXEC sp_GetDraconicAncestry @param";

			return Data_DB.GetDictionaryData(query, param);
		}

		/*
			public string HitDice { get; set; }
			public string DraconicAncestry { get { return GetDraconicAncestry(pallete); } }
			public string CharacterName { get; set; }
			public string Alignment { get; set; }
			public List<string> Resistance { get; set; }
			public List<string> Resilience { get; set; }
			public List<string> Language { get { return GetLanguage(race); } }
			public Dictionary<string, string> Sense { get; set; }
			public Dictionary<string, string> PhysicalDescription { get { return GetPhysicalDescription(race, pallete); } }
			public Dictionary<string, string> PassiveAbility { get; set; }
			public Dictionary<string, string> Movement { get; set; }
			public Dictionary<string, string> AbilityIncrease { get { return GetAbilityIncrease(race); } }
		*/

		/********************* Class Methods *********************/

		/*
		public Dictionary<string, string> GetBonusAbility(string race, string pallete)
		{
			throw new NotImplementedException();
		}

		public string GetDraconicAncestry(string param)
		{			
			string query = 
				@"SELECT T.Tint, DA.Type, Area, Ability"
				+ "FROM DraconicAncestry AS DA"
				+ "LEFT JOIN Tint AS T ON DA.ColorID = T.ID"
				+ "LEFT JOIN DamageType AS DT ON DA.DamageTypeID = DT.ID"
				+ "LEFT JOIN AreaOfEffect AS A ON DA.AreaOfAttackID = A.ID"
				+ "LEFT JOIN AbilityType AS AT ON DA.AbilitySaveID = AbilityType.ID"
				+ "WHERE T.Tint = $param";

			List<string> ancestry = Data_DB.GetListData(query, param);

			if(ancestry.Count < 1)
			{
				query =
					@"SELECT Tint"
					+ "FROM Tint";

				List<string> tintList = Data_DB.GetListData(query);
				param = Utils.GetRandomListItem(tintList);
			}

			query =
				@"SELECT T.Tint, DA.Type, Area, Ability"
				+ "FROM DraconicAncestry AS DA"
				+ "LEFT JOIN Tint AS T ON DA.ColorID = T.ID"
				+ "LEFT JOIN DamageType AS DT ON DA.DamageTypeID = DT.ID"
				+ "LEFT JOIN AreaOfEffect AS A ON DA.AreaOfAttackID = A.ID"
				+ "LEFT JOIN AbilityType AS AT ON DA.AbilitySaveID = AbilityType.ID"
				+ "WHERE T.Tint = $param";

			List<string> exhaleOptions = Data_DB.GetListData(query, param);
			string exhale = Utils.GetRandomListItem(exhaleOptions);

			return exhale;
		}

		public string GetPallete(string param)
		{
			string query =
				@"SELECT Color"
				+ "FROM Color as C"
				+ "LEFT JOIN SkinColor AS SC ON C.ID = SC.ColorID"
				+ "LEFT JOIN Race AS R ON SC.RaceID = R.ID"
				+ "WHERE R.Name = @param";

			List<string> result = Data_DB.GetListData(query, param);

			if (result.Count > 1)
				return Utils.GetRandomListItem(result);
			else
				return Convert.ToString(result);
		}

		private Dictionary<string, string> GetPhysicalDescription(string race, string pallete)
		{
			throw new NotImplementedException();
		}
		*/
	}
}
