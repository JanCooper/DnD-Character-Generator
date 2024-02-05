using AngleSharp.Html.Dom;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CharacterCreatorApp
{
	/// <summary>
	/// Generates all details for a randomly generated player, non-monster character
	/// </summary>
	/// <returns> ICharacter </returns>
	/// 
	class Player : ICharacter, IBackground, IRace, IClass
	{
		/********************* Class Constructor *********************/
		public Player(int Level)
		{
			_level = Level;
		}

		/********************* Internal Values *********************/
		internal int _level { get; private set; }
		internal Random _random = new Random();

		/********************* Private Values *********************/
		private IRace _race { get { return GetRace(); } }
		private IClass _characterClass { get { return GetClass(_level); } }
		private IBackground _background { get { return GetBackground(_characterClass.CharacterClass); } }

		private List<string> _languages { get { return GetLanguages(_race.Languages, _characterClass.Languages, _background.Languages); } }
		private List<string> _skillProficiency { get { return GetSkillProficiency(_background.SkillProficiency, _characterClass.SkillProficiency, _race.SkillProficiency); } }
		private List<string> _toolProficiency { get { return GetToolProficiency(_background.ToolProficiency, _characterClass.ToolProficiency); } }






		/********************* Public Values *********************/
		public int Age { get { return _race.Age; } }
		public int Level { get { return _level; } }
		public int Speed { get { return _race.Speed; } }

		public string Alignment { get { return _race.Alignment; } }
		public string Background { get { return _background.Background; } }
		public string CharacterClass { get { return _characterClass.CharacterClass; } }
		public string CharacterName { get { return _race.CharacterName; } }
		public string Feature { get { return _background.Feature; } }
		public string Gender { get { return _race.Gender; } }
		public string Race { get { return _race.Race; } }

		public List<string> Languages { get { return _languages; } }
		public List<string> SkillProficiency { get { return _skillProficiency; } }
		public List<string> ToolProficiency { get { return _toolProficiency; } }

		public Dictionary<string, int> RacialAbility { get { return _race.RacialAbility; } } // adds to stats

		public Dictionary<string, string> BodyDescription { get { return _race.BodyDescription; } } 



		/********************* Class Methods *********************/
		private IRace GetRace()
		{
			int i = _random.Next(0, 13);
			string race = ((EnumRace)i).ToString();

			IRace character;

			switch (race)
			{
				case "DragonBorn":
					character = new DragonBorn("Dragonborn");
					break;
				case "Dwarf":
					character = new Dwarf("Dwarf");
					break;
				case "Elf":
					character = new Elf("Elf");
					break;
				case "Gnome":
					character = new Gnome("Gnome");
					break;
				case "Half-Elf":
					character = new HalfElf("HalfElf");
					break;
				case "Halfling":
					character = new Halfling("Halfling");
					break;
				case "Half-Orc":
					character = new HalfOrc("HalfOrc");
					break;
				case "Tiefling":
					character = new Tiefling("Tiefling");
					break;
				default:
					character = new Human("Human");
					break;
			}

			return character;
		}

		private IClass GetClass(int level)
		{
			int i = _random.Next(0, 13);
			string className = ((EnumClass)i).ToString();

			IClass character;

			switch (className)
			{
				case "Artificer":
					character = new Artificer("Artificer", level);
					break;
				case "Barbarian":
					character = new Barbarian("Barbarian", level);
					break;
				case "Bard":
					character = new Bard("Bard", level);
					break;
				case "Blood_Hunter":
					character = new Blood_Hunter("Blood_Hunter", level);
					break;
				case "Cleric":
					character = new Cleric("Cleric", level);
					break;
				case "Druid":
					character = new Druid("Druid", level);
					break;
				case "Fighter":
					character = new Fighter("Fighter", level);
					break;
				case "Monk":
					character = new Monk("Monk", level);
					break;
				case "Paladin":
					character = new Paladin("Paladin", level);
					break;
				case "Ranger":
					character = new Ranger("Ranger", level);
					break;
				case "Rogue":
					character = new Rogue("Rogue", level);
					break;
				case "Sorcerer":
					character = new Sorcerer("Sorcerer", level);
					break;
				case "Warlock":
					character = new Warlock("Warlock", level);
					break;
				default:
					character = new Wizard("Wizard", level);
					break;
			}
			return character;
		}

		private IBackground GetBackground(string characterClass)
		{
			// TODO: weighted choice by character class
			int i = _random.Next(0, 13);
			string backgroundName = ((EnumBackground)i).ToString();

			IBackground background;

			switch (backgroundName)
			{
				case "Acolyte":
					background = new Acolyte("Acolyte");
					break;
				case "Charlatan":
					background = new Charlatan("Charlatan");
					break;
				case "Criminal":
					background = new Criminal("Criminal");
					break;
				case "Entertainer":
					background = new Entertainer("Entertainer");
					break;
				case "Folk Hero":
					background = new FolkHero("FolkHero");
					break;
				case "Gladiator":
					background = new Gladiator("Gladiator");
					break;
				case "GuildMerchant":
					background = new GuildMerchant("GuildMerchant");
					break;
				case "Hermit":
					background = new Hermit("Hermit");
					break;
				case "Knight":
					background = new Knight("Knight");
					break;
				case "Noble":
					background = new Noble("Noble");
					break;
				case "Outlander":
					background = new Outlander("Outlander");
					break;
				case "Pirate":
					background = new Pirate("Pirate");
					break;
				case "Sage":
					background = new Sage("Sage");
					break;
				case "Sailor":
					background = new Sailor("Sailor");
					break;
				case "Soldier":
					background = new Soldier("Soldier");
					break;
				default:
					background = new Urchin("Urchin");
					break;
			}

			return background;
		}

		private List<string> GetEquipment(string Class, string Background)
		{
			List<string> param = new List<string>()
			{
				Class,
				Background
			};

			string query =
				@"EXEC sp_GetEquipment @param";

			return Data_DB.GetListData(query, param);
		}

		private List<string> GetLanguages(List<string> racialLanguages, List<string> backgroundLanguages, List<string> classLanguages)
		{
			List<string> param = new List<string>();

			foreach (string language in racialLanguages)
			{
				param.Add(language);
			}

			if(null != backgroundLanguages)
			{
				foreach (string language in backgroundLanguages)
				{
					param.Add(language);
				}
			}

			if(null != classLanguages)
			{
				foreach (string language in classLanguages)
				{
					param.Add(language);
				}
			}

			string query =
			@"EXEC sp_GetLanguage @param";

			return Data_DB.GetListData(query, param);
		}

		public List<string> GetSkillProficiency(List<string> backgroundSkills, List<string> classSkills, List<string> raceSkills)
		{
			List<string> skillProficiencies = new List<string>();

			if(null != backgroundSkills)
			{
				foreach(string skill in backgroundSkills)
				{
					if(!skillProficiencies.Contains(skill))
						skillProficiencies.Add(skill);
				}
			}

			if (null != classSkills)
			{
				foreach (string skill in classSkills)
				{
					if (!skillProficiencies.Contains(skill))
						skillProficiencies.Add(skill);
				}
			}

			if (null != raceSkills)
			{
				foreach (string skill in raceSkills)
				{
					if (!skillProficiencies.Contains(skill))
						skillProficiencies.Add(skill);
				}
			}

			return skillProficiencies;
		}

		public List<string> GetToolProficiency(List<string> backgroundTools, List<string> classTools)
		{
			int count;
			string ranges;

			if (null != backgroundTools && null != classTools)
			{
				count = Int32.Parse(backgroundTools[0]) + Int32.Parse(classTools[0]);
				ranges = String.Format("{0},{1}", backgroundTools[1], classTools[1]);
			}
			else if (null != backgroundTools && null == classTools)
			{
				count = Int32.Parse(backgroundTools[0]);
				ranges = backgroundTools[1];
			}
			else if (null == backgroundTools && null != classTools)
			{
				count = Int32.Parse(classTools[0]);
				ranges = classTools[1];
			}
			else
			{
				count = 0;
				ranges = "";
			}

			List<string> param = new List<string>()
			{
				count.ToString(),
				ranges
			};

			string query =
				@"EXEC sp_GetToolProficiency @param";

			return Data_DB.GetListData(query, param);
		}
















		/*
		

		private Random random = new Random();

		private bool _isCastingClass { get { return characterClass.IsCastingClass; } }
		
		private int _armorClass { get { return GetArmorClass(Int32.Parse(abilityMod["Dex"]), characterClass.Armor); } }
		private int _classLanguageCount { get { return characterClass.ClassLanguageCount; } }
		private int _spellAttackModifier
		{
			get
			{
				if (_isCastingClass == true)
					return ProficiencyBonus + WisdomModifier;
				else
					return 0;
			}
		}
		private int _spellSaveDC
		{
			get
			{
				if (_isCastingClass == true)
					return ProficiencyBonus + WisdomModifier + 8;
				else
					return 0;
			}
		}
		
		private int _HitPoint { get { return GetHitPoint(race, characterClass); } }

		private List<string> _language { get { return GetLanguage(race, _classLanguageCount); } }
		private List<string> _tool { get { return GetTool(race, characterClass); } }

		private Dictionary<string, string> abilityMod { get { return GetAbilityMod(race, characterClass, abilityScore); } }
		private Dictionary<string, string> abilityScore { get { return GetAbilityScore(race, characterClass); } }
		private Dictionary<string, string> abilitySave { get { return GetAbilitySave(race, characterClass, abilityMod); } } // GetSavingThrow
		private Dictionary<string, string> _passiveAbilities { get { return GetPassiveAbility(race, characterClass, abilityMod); } }
		private Dictionary<string, string> _profciency{ get { return GetProficiency(race, characterClass); } }
		private Dictionary<string, string> _sense { get { return GetSense(race, characterClass); } }
		private Dictionary<string, string> _specialAbility { get { return GetSpecialAbility(race, characterClass); } }
		private Dictionary<string, string> _spells { get { return GetSpells(race, characterClass, _isCastingClass); } }


		public string Alignment { get { return race.Alignment; } }
		public string Size { get { return race.Size; } }
		public string Armor { get { return characterClass.Armor; } }
		public string CharacterName { get { return race.CharacterName; } }
		public string ClassName { get { return characterClass.ClassName; } }
		public string HitDice { get { return race.HitDice; } }
		public string RaceName { get { return race.RaceName; } }

		public int Charisma { get { return Int32.Parse(abilityScore["Cha"]); } }
		public int Constitution { get { return Int32.Parse(abilityScore["Con"]); } }
		public int Dexterity { get { return Int32.Parse(abilityScore["Dex"]); } }
		public int Intelligence { get { return Int32.Parse(abilityScore["Int"]); } }
		public int Strength { get { return Int32.Parse(abilityScore["Str"]); } }
		public int Wisdom { get { return Int32.Parse(abilityScore["Wis"]); } }

		public int CharismaModifier { get { return Int32.Parse(abilityMod["Cha"]); } }
		public int ConstitutionModifier { get { return Int32.Parse(abilityMod["Con"]); } }
		public int DexterityModifier { get { return Int32.Parse(abilityMod["Dex"]); } }
		public int IntelligenceModifier { get { return Int32.Parse(abilityMod["Int"]); } }
		public int StrengthModifier { get { return Int32.Parse(abilityMod["Str"]); } }
		public int WisdomModifier { get { return Int32.Parse(abilityMod["Wis"]); } }

		public int CharismaSave { get { return Int32.Parse(abilitySave["Cha"]); } }
		public int ConstitutionSave { get { return Int32.Parse(abilitySave["Con"]); } }
		public int DexteritySave { get { return Int32.Parse(abilitySave["Dex"]); } }
		public int IntelligenceSave { get { return Int32.Parse(abilitySave["Int"]); } }
		public int StrengthSave { get { return Int32.Parse(abilitySave["Str"]); } }
		public int WisdomSave { get { return Int32.Parse(abilitySave["Wis"]); } }

		public int Age { get { return race.Age; } }
		public int ArmorClass { get { return _armorClass; } }
		public int HitPoint { get { return _HitPoint; } }
		public int InitiativeBonus { get { return DexterityModifier; } }
		public int ProficiencyBonus { get { return characterClass.ProficiencyBonus; } }
		public int SpellAttackModifier { get { return _spellAttackModifier; } }
		public int SpellSaveDC { get { return _spellSaveDC; } }

		public List<string> Equipment { get { return characterClass.Equipment; } }		
		public List<string> Skill { get { return characterClass.Skill; } }		
		public List<string> Tool { get { return _tool; } }
		public List<string> Language { get { return _language; } }
		public List<string> Resistance { get { return race.Resistance; } }

		public Dictionary<string, string> BaseAbilityScore { get { return characterClass.BaseAbilityScore; } }
		public Dictionary<string, string> PassiveAbility { get { return _passiveAbilities; } }
		public Dictionary<string, string> Proficiency { get { return _profciency; } }
		public Dictionary<string, string> Sense { get { return _sense; } }
		public Dictionary<string, string> SpecialAbility { get { return _specialAbility; } }
		public Dictionary<string, string> Spells { get { return _spells; } }
		public Dictionary<string, string> Movement { get { return race.Movement; } }
		public Dictionary<string, string> PhysicalDescription { get { return race.PhysicalDescription; } }

		/********************************************************************************
		
		
		// close comment block




		
			
		 
		 // close comment block
		 
		 
		 
			return character;
		}

		
			

		// close comment block



			return character;
		}

		private int GetArmorClass(int dexModifier, string armor)
		{
			throw new NotImplementedException();
		}

		private int GetHitPoint(IRace race, IClass characterClass)
		{
			throw new NotImplementedException();
		}

		private int GetProficiencyBonus(int level)
		{
			string param = "Lvl" + level.ToString();

			string query =
			@"SELECT @param"
				+ "FROM ProficiencyBonus";

			string result = Data.GetStringData(query, param);
			return Int32.Parse(result);
		}

		private List<string> GetLanguage(IRace race, int languageCount)
		{
			// choose # Language from list not including racial Language
			// return above + racial Language
			throw new NotImplementedException();
		}

		private List<string> GetSavingThrow(IRace race, IClass characterClass)
		{
			throw new NotImplementedException();
		}

		private Dictionary<string, string> GetSense(IRace race, IClass characterClass)
		{
			throw new NotImplementedException();
		}

		private List<string> GetTool(IRace race, IClass characterClass)
		{
			throw new NotImplementedException();
		}

		private Dictionary<string, string> GetAbilityMod(Dictionary<string, string> abilityScore)
		{
			Dictionary<string, string> abilityMod = new Dictionary<string, string>();

			for (int i = 0; i < abilityScore.Count; i++)
			{
				int mod = (Int32.Parse(abilityScore.ElementAt(i).Value) - 10) / 2;
				abilityMod.Add(abilityScore.ElementAt(i).Key, mod.ToString());
			}
			return abilityMod;
		}

		private Dictionary<string, string> GetAbilityScore(IRace race, IClass characterClass)
		{
			List<string> abilities = new List<string>()
						{
							"Cha",
							"Con",
							"Dex",
							"Int",
							"Str",
							"Wis"
						};

			List<int> scores = new List<int>();
			for (int i = 0; i < 7; i++)
			{
				scores.Add(random.Next(1, 21));
			}

			Dictionary<string, string> abilityScores = new Dictionary<string, string>();
			foreach (string stat in abilities)
			{
				throw new NotImplementedException();
				// get stat priority from characterClass
				// get stat bonuses from race
				// get stat bonuses from characterClass
			}
			return abilityScores;
		}

		private Dictionary<string, string> GetPassiveAbility(IRace race, IClass characterClass, Dictionary<string, string> abilityMod)
		{
			throw new NotImplementedException();
			// 10 + all modifiers that normally apply to the check
			// with advantage add 5
			// plus racial traits and class features
		}

		private Dictionary<string, string> GetProficiency(IRace race, IClass characterClass)
		{
			throw new NotImplementedException();
			// Druid Wild Shape
		}

		private Dictionary<string, string> GetSpecialAbility(IRace race, IClass characterClass)
		{
			throw new NotImplementedException();
			// Druid Wild Shape
		}

		private Dictionary<string, string> GetSpells(IRace race, IClass characterClass, bool isCastingClass)
		{
			throw new NotImplementedException();
		}
		*/
	}
	}
 