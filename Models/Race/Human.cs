using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	class Human : Race, IRace
	{
		/********************* Class Constructor *********************/
		public Human(string Race)
		{
			_name = Race;
		}

		/********************* Internal Values *********************/
		internal string _name { get; private set; }
		internal Random _random = new Random();
		internal const int minAge = 18;
		internal const int maxAge = 100;

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
					"Choose 1"
				};
				return racialLanguages;
			}
		}

		private Dictionary<string, string> _description { get { return GetDescription(_name, minAge, maxAge); } }

		private Dictionary<string, int> _racialAbility
		{
			get
			{
				Dictionary<string, int> abilityIncrease = new Dictionary<string, int>()
				{
					{ "Charisma", 1},
					{ "Constitution", 1},
					{ "Dexterity", 1},
					{ "Intellect", 1},
					{ "Strength", 1},
					{ "Wisdom", 1},
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

		public string RacialTraits { get { return "None."; } }
		public Dictionary<string, string> BodyDescription { get { return _description; } }



		/********************* Class Methods *********************/
		public override string GetAlignment()
		{
			int i = _random.Next(0, 100);
			int value;

			if (i < 35)
			{
				int[] options = { 1, 2, 3 };
				int choice = _random.Next(0, 3);
				value = options[choice];
			}
			else if (i > 35 && i < 70)
			{
				int[] options = { 4, 5, 6 };
				int choice = _random.Next(0, 3);
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


	}
}
