using System;
using System.Collections.Generic;

namespace CharacterCreatorApp
{
	class Dwarf : Race, IRace
	{ //  TODO: add subraces
		/********************* Class Constructor *********************/
		public Dwarf(string Race)
		{
			_name = Race;
		}

		/********************* Internal Values *********************/
		internal string _name { get; private set; }
		internal Random _random = new Random();
		internal const int minAge = 50;
		internal const int maxAge = 350;

		/********************* Private Values *********************/
		private int _age { get { return Int32.Parse(_description["Age"]); } }
		private int _speed { get { return 25; } }

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
					"Dwarvish"
				};
				return racialLanguages;
			}
		}

		private Dictionary<string, string> _description { get { return GetDescription(); } }

		private Dictionary<string, string> _racialTraits
		{
			get
			{
				Dictionary<string, string> racialTraits = new Dictionary<string, string>()
				{
					{ "Darkvision", "Can see in dim light within 60 feet as if in bright light, and in shades of grey in darkness as if in dim light."},
					{ "Dwarven Resilience", "Advantage on saving throws against poison and resistance to poison damage." },
					{ "Dwarven Combat Training", "Proficiency with battleaxe, handaxe, light hammer, and warhammer weapons."},
					{ "StoneCunning", "Add double proficiency bonus to history checks related to the origin of stonework."}
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
					{ "Constitution", 2}
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
		public string Name { get { return _name; } }

		public List<string> Languages { get { return _languages; } }

		public Dictionary<string, int> RacialAbility { get { return _racialAbility; } }

		public Dictionary<string, string> RacialTraits { get { return _racialTraits; } }
		public Dictionary<string, string> BodyDescription { get { return _description; } }

		
		/********************* Class Methods *********************/
		private Dictionary<string, string> GetDescription()
		{
			Dictionary<string, string> description = GetDescription(Race, maxAge, minAge);
			string gender = description["Gender"];			

			if (gender == "Female")
			{
				int i = _random.Next(0, 6);

				if(i == 0)
				{
					description["Face"] = String.Concat(description["Face"], "-shaped face, with a soft, downy peach fuzz covering the chin and jawline.");
				}					
				else if(i == 1)
				{
					description["Face"] = String.Concat(description["Face"], "-shaped face, with a 5 o'clock shadow covering the lower portion.");
				}
				else if(i == 2)
				{
					description["Face"] = String.Concat(description["Face"], "-shaped face, with soft, short little curls covering the chin, lower cheeks, and jawline.");
				}
			}

			return description;
		}

		public override string GetAlignment()
		{
			int i = _random.Next(0, 100);
			int value;

			if (i < 50)
			{
				int[] options = { 1, 4 };
				int choice = _random.Next(0, 2);
				value = options[choice];
			}
			else if (i > 50 && i < 80)
			{
				int[] options = { 2, 3, 5 };
				int choice = _random.Next(0, 3);
				value = options[choice];
			}
			else if (i > 80 && i < 95)
			{
				value = 6;
			}
			else
			{
				int[] options = { 7, 8 };
				int choice = _random.Next(0, 2);
				value = options[choice];
			}
			return ((EnumAlignment)value).ToString();
		}
	}
}

