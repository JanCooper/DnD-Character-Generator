using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	class Tiefling : Race, IRace
	{
		/********************* Class Constructor *********************/
		public Tiefling(string Race)
		{
			_name = Race;
		}

		/********************* Internal Values *********************/
		internal string _name { get; private set; }
		internal Random _random = new Random();
		internal const int minAge = 18;
		internal const int maxAge = 125;

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
		private string _resistance { get { return "Fire."; } }

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
					{ "Infernal Legacy", "Charisma for spellcasting -- Lvl 1: Thaumaturgy cantrip; Lvl 3: cast Lvl 2 Hellish Rebuke every long rest; Lvl 5: cast Darkness every long rest"}
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
		public string Name { get { return _name; } }
		public string Resistance { get { return _resistance; } }

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
				int[] options = { 5, 6, 7, 8 };
				int choice = _random.Next(0, 4);
				value = options[choice];
			}
			else
			{
				int[] options = { 1, 2, 3, 4 };
				int choice = _random.Next(0, 4);
				value = options[choice];
			}

			return ((EnumAlignment)value).ToString();
		}
	}
}
