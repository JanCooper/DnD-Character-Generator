using System;
using System.Collections.Generic;
using System.Drawing;

namespace CharacterCreatorApp
{
	class Monster : ICharacter
	{
		internal int level { get; private set; }
		private Random random = new Random();

		public Monster(int Level)
		{
			level = Level;
		}

		public string RaceName { get { return "Unnamed Monster"; } }
		public int Level { get { return level; } }
		/*
		private bool CastingClass { get; }
		private Dictionary<string, string> monster { get { return GetRandomMonster(level); } }

		public string Alignment { get { throw new NotImplementedException(); } }
		public string Armor => throw new NotImplementedException();
		public string CharacterName { get { return "Unnamed Monster"; } }
		public string ClassName { get { throw new NotImplementedException(); } } // MonsterType
		public string HitDice => throw new NotImplementedException();
		public string RaceName { get { throw new NotImplementedException(); } } // Monster
		public string Size => throw new NotImplementedException();

		public int Age { get { return 0; } }
		public int ArmorClass => throw new NotImplementedException();
		public int HitPoint => throw new NotImplementedException();
		public int InitiativeBonus => throw new NotImplementedException();
		public int ProficiencyBonus { get { throw new NotImplementedException(); } }
		public int SpellAttackModifier => throw new NotImplementedException();
		public int SpellSaveDC => throw new NotImplementedException();

		public int Charisma { get { throw new NotImplementedException(); } }
		public int Constitution { get { throw new NotImplementedException(); } }
		public int Dexterity { get { throw new NotImplementedException(); } }
		public int Intelligence { get { throw new NotImplementedException(); } }
		public int Strength { get { throw new NotImplementedException(); } }
		public int Wisdom { get { throw new NotImplementedException(); } }

		public int CharismaModifier { get { throw new NotImplementedException(); } }		
		public int ConstitutionModifier { get { throw new NotImplementedException(); } }		
		public int DexterityModifier { get { throw new NotImplementedException(); } }		
		public int IntelligenceModifier { get { throw new NotImplementedException(); } }		
		public int StrengthModifier { get { throw new NotImplementedException(); } }		
		public int WisdomModifier { get { throw new NotImplementedException(); } }

		public List<string> Equipment => throw new NotImplementedException();
		public List<string> Language { get { throw new NotImplementedException(); } }
		public List<string> Resistance => throw new NotImplementedException();
		public List<string> SavingThrow => throw new NotImplementedException();
		public List<string> Skill => throw new NotImplementedException();
		public List<string> Tool => throw new NotImplementedException();

		public Dictionary<string, string> AbilityIncrease => throw new NotImplementedException();
		public Dictionary<string, string> BaseAbilityScore => throw new NotImplementedException();
		public Dictionary<string, string> LegendaryAction => throw new NotImplementedException();
		public Dictionary<string, string> LairAction => throw new NotImplementedException();
		public Dictionary<string, string> Movement => throw new NotImplementedException();
		public Dictionary<string, string> PassiveAbility => throw new NotImplementedException();
		public Dictionary<string, string> PhysicalDescription { get { throw new NotImplementedException(); } }
		public Dictionary<string, string> Proficiency => throw new NotImplementedException();
		public Dictionary<string, string> Sense => throw new NotImplementedException();
		public Dictionary<string, string> SpecialAbility => throw new NotImplementedException();
		public Dictionary<string, string> Spells => throw new NotImplementedException();



		/********************************************************************************
		private string GetAlignment(string param) // race
		{
			string query =
				@"SELECT Alignment"
				+ "FROM Alignment AS A"
				+ "LEFT JOIN Monster AS M ON A.ID = M.AlignmentID"
				+ "WHERE Monster = @param";
			return Data.GetStringData(query, param);
		}

		private List<string> GetSavingThrow(IRace race, IClass characterClass)
		{
			throw new NotImplementedException();
		}

		private List<string> GetLanguage(string param)
		{
			throw new NotImplementedException();
		}

		private int GetWeight(string param) // race
		{
			string query =
				@"SELECT MinWeight, MaxHWeight" // in feet
				+ "FROM Size AS S"
				+ "LEFT JOIN Monster AS M ON S.ID = M.SizeID"
				+ "WHERE Monster = @param";
			return Data.GetIntData(query, param);
		}

		private int GetHeight(string param) // race
		{
			string query =
				@"SELECT MinHeight, MaxHeight" // in feet
				+ "FROM Size AS S"
				+ "LEFT JOIN Monster AS M ON S.ID = M.SizeID"
				+ "WHERE Monster = @param";
			return Data.GetIntData(query, param);
		}

		private Dictionary<string, string> GetSense(string param)
		{
			throw new NotImplementedException();
		}

		private Dictionary<string, string> GetRandomMonster(int level)
		{
			throw new NotImplementedException();
		}

		private Dictionary<string, string> GetPhysicalDescription(string race)
		{
			int height = GetHeight(race);
			int weight = GetWeight(race);
			throw new NotImplementedException();
		}

		private Dictionary<string, string> GetMovement(string race)
		{
			throw new NotImplementedException();
		}
		*/
	}
}
