using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	class Halfling : Race, IRace
	{
		/********************* Class Constructor *********************/
		public Halfling(string Race) 
		{
			_name = Race;
		}

		/********************* Internal Values *********************/
		internal string _name { get; private set; }
		internal Random _random = new Random();
		internal const int minAge = 20;
		internal const int maxAge = 275;

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
					"Halfling"
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
					{ "Lucky", "Can reroll when rolling a 1 on a D20 for attack, ability check, or saving throw. Must use new roll."},
					{ "Brave", "Advantage on saving throws against being frightened." },
					{ "Halfling Nimbleness", "Can move through the space of any larger creature."}
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
					{ "Dexterity", 2}
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
		public override string GetAlignment()
		{
			int i = _random.Next(0, 100);
			int value;

			if (i < 70)
			{
				value = 1;
			}
			else if (i > 70 && i < 90)
			{
				value = 4;
			}
			else
			{
				int[] options = { 2, 3, 5, 6, 7, 8 };
				int choice = _random.Next(0, 6);
				value = options[choice];
			}
			return ((EnumAlignment)value).ToString();
		}
	}
}
