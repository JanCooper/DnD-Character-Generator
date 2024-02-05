using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	class HalfOrc : Race, IRace
	{
		/********************* Class Constructor *********************/
		public HalfOrc(string Race) 
		{
			_name = Race;
		}

		/********************* Internal Values *********************/
		internal string _name { get; private set; }
		internal Random _random = new Random();
		internal const int minAge = 14;
		internal const int maxAge = 80;

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
		private string _proficiency { get { return "Intimidation"; } }

		private List<string> _languages
		{
			get
			{
				List<string> racialLanguages = new List<string>()
				{
					"Common",
					"Orc"
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
					{ "Relentless Endurance", "1x every long rest, can drop to 1 hit point when reduced to 0 hitpoints but not killed outright, ." },
					{ "Savage Attacks", "When scoring a crit with a melee weapon, add 1 additional damage dice." },
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
					{ "Constitution", 1},
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
		public string Proficiency { get { return _proficiency; } }
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
				value = 6;
			}
			else if (i > 70 && i < 90)
			{
				int[] options = { 3, 4, 5 };
				int choice = _random.Next(0, 3);
				value = options[choice];
			}
			else
			{
				int[] options = { 1, 2, 7, 8 };
				int choice = _random.Next(0, 4);
				value = options[choice];
			}

			return ((EnumAlignment)value).ToString();
		}
	}
}
