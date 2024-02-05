using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	class HalfElf : Race, IRace
	{
		/********************* Class Constructor *********************/
		public HalfElf(string Race)
		{
			_name = Race;
		}

		/********************* Internal Values *********************/
		internal string _name { get; private set; }
		internal Random _random = new Random();
		internal const int minAge = 18;
		internal const int maxAge = 200;

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

		private Dictionary<string, string> _description { get { return GetDescription(_name, minAge, maxAge); } }	


		private Dictionary<string, string> _racialTraits
		{
			get
			{
				Dictionary<string, string> racialTraits = new Dictionary<string, string>()
				{
					{ "Darkvision", "Can see in dim light within 60 feet as if in bright light, and in shades of grey in darkness as if in dim light."},
					{ "Fey Ancestry", "Advantage on saving throws against being charmed, and cannot be put to sleep by magic." }
				};

				return racialTraits;
			}
		}

		private Dictionary<string, int> _racialAbility
		{
			get
			{
				Dictionary<string, string> optionalAbilities = GetOptionalAbilities("Charisma", 2);

				Dictionary<string, int> abilityIncrease = new Dictionary<string, int>()
				{
					{ "Charisma", 2}
				};

				foreach(KeyValuePair<string,string> ability in optionalAbilities)
				{
					abilityIncrease.Add(ability.Key, Int32.Parse(ability.Value));
				}

				return abilityIncrease;
			}
		}

		/********************* Public Values *********************/
		public int Age { get { return _age; } }
		public int Speed { get { return _speed; } }

		public string Alignment { get { return _alignment; } }
		public string CharacterName { get { return _characterName; } }
		public string Gender { get { return _gender; } }
		public string Name { get { return _name; } }

		public List<string> Languages { get { return _languages; } }

		public Dictionary<string, int> RacialAbility { get { return _racialAbility; } }

		public Dictionary<string, string> RacialTraits { get { return _racialTraits; } }
		public Dictionary<string, string> BodyDescription { get { return _description; } }



		/********************* Class Methods *********************/
		public override string GetAlignment()
		{
			int i = _random.Next(0, 100);
			int value;

			if (i < 70)
			{
				int[] options = { 3, 6 };
				int choice = _random.Next(0, 2);
				value = options[choice];
			}
			else if (i > 70 && i < 90)
			{
				int[] options = { 1, 2, 4, 5 };
				int choice = _random.Next(0, 4);
				value = options[choice];
			}
			else
			{
				int[] options = { 7, 8 };
				int choice = _random.Next(0, 2);
				value = options[choice];
			}
			return ((EnumAlignment)value).ToString();
		}

		private Dictionary<string, string> GetOptionalAbilities(string known, int count) // known ability
		{
			List<string> param = new List<string>()
			{
				known,
				count.ToString()
			};

			string query =
				@"EXEC sp_GetAbility @param";

			List<string> resultSet = Data_DB.GetListData(query, param);
			Dictionary<string, string> abilityIncrease = resultSet.ToDictionary(x => x);		

			return abilityIncrease;
		}
	}
}
