using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnDRandomCharacterGenerator.Models
{
	/// <summary>
	/// 
	/// </summary>
	abstract class PlayerClass
	{
		/*********************************************************************************/
		// constructors
		/*********************************************************************************/
		public PlayerClass(int Level)
		{
			Level = Level;
		}

		/*********************************************************************************/
		// variables
		/*********************************************************************************/
		public Hashtable Armor
		{
			set => GetArmor();
		}
		public List<String> ArmorProficiency;
		public int Charisma;
		public int CharismaModifier;
		public int Constitution;
		public int ConstitutionModifier;
		public int Dexterity;
		public int DexterityModifier;
		public Hashtable Features
		{
			set
			{
				SetFeatures();
			}
		}
		public int HitDice;
		public int Intelligence;
		public int IntelligenceModifier;
		public int Level;

		public int LvlOneHitPoints = 8; // + constitution modifier
		public int ProficiencyBonus
		{
			get
			{
				return GetProficiencyBonus();
			}
		}
		public Random Random = new Random();
		public List<String> SavingThrows;
		public List<String> SkillProficiency
		{
			set
			{
				SetSkillProficiency();
			}
		}
		public Hashtable StatModifiers;
		public Hashtable Stats;
		public int Strength;
		public int StrengthModifier;
		public List<String> ToolProficiency;
		public List<String> WeaponProficiency;
		public int WalkingSpeed = 30;
		public int Wisdom;
		public int WisdomModifier;

		/*********************************************************************************/
		// public methods
		/*********************************************************************************/

		public void GetArmor()
		{
			Hashtable armor = new Hashtable();
			int proficiency = Random.Next(0, ArmorProficiency.Count);

			// TODO get armor from database

			Armor = armor;
		}

		public int GetProficiencyBonus()
		{
			int proficiency = 0;

			if ( new[] { 1, 2, 3, 4 }.Contains(Level) )
			{
				proficiency = 2;
			} 
			else if ( new[] { 5, 6, 7, 8 }.Contains(Level) )
			{
				proficiency = 3;
			}
			else if ( new[] { 9, 10, 11, 12 }.Contains(Level) )
			{
				proficiency = 4;
			}
			else if ( new[] { 13, 14, 15, 16 }.Contains(Level) )
			{
				proficiency = 5;
			}
			else
			{
				proficiency = 6;
			}

			return proficiency;
		}

		protected abstract List<String> GetSkillProficiency();

		protected abstract List<String> GetStartingEquipment();

		public int GetStatModifier(int score)
		{
			int modifier = -100;

			switch (score)
			{
				case 1: modifier = -5;
					break;
				case 2:
					break;
				case 3: modifier = -4;
					break;
				case 4:
					break;
				case 5: modifier = -3;
					break;
				case 6:
					break;
				case 7: modifier = -2;
					break;
				case 8:
					break;
				case 9: modifier = -1;
					break;
				case 10: 
					break;
				case 11: modifier = 0;
					break;
				case 12: 
					break;
				case 13: modifier = 1;
					break;
				case 14:
					break;
				case 15: modifier = 2;
					break;
				case 16:
					break;
				case 17: modifier = 3;
					break;
				case 18:
					break;
				case 19: modifier = 4;
					break;
				case 20:
					break;
				case 21: modifier = 5;
					break;
				case 22:
					break;
				case 23: modifier = 6;
					break;
				case 24:
					break;
				case 25: modifier = 7;
					break;
				case 26:
					break;
				case 27: modifier = 8;
					break;
				case 28:
					break;
				case 29: modifier = 9;
					break;
				default: modifier = 10;
					break;
			}
			return modifier;
		}

		public List<int> GetStatRolls()
		{
			List<int> stats = new List<int>();

			for (int i = 0; i <= 6; i++)
			{
				stats[i] = Random.Next(1, 21);
			}

			return stats;
		}

		public List<String> GetWeapons(List<String> equipment, String weaponType)
		{
			List<String> weapons = new List<String>();
			// TODO get weaponType from database

			return weapons;
		}

		public List<int> RandomizeStatSelection(List<int> stats)
		{
			List<int> newStatList = new List<int>();

			while (stats.Count > 0)
			{
				int index = Random.Next(0, stats.Count);
				newStatList.Add(stats[index]);
				stats.RemoveAt(index);
			}

			return newStatList;
		}

		public Hashtable SetFeatures(String playerClass)
		{
			Hashtable features = new Hashtable();
			// TODO get class features from database

			return features;
		}

		public List<String> SetPack(List<String> equipment, String packType)
		{
			// TODO get pack from database

			return equipment;
		}

		public Hashtable SetRemainingStats(List<String> remainingStats, List<int> remainingStatRolls)
		{
			Hashtable statList = new Hashtable();

			for (int i = 0; i < remainingStats.Count; i++)
			{
				statList.Add(remainingStats[i], remainingStatRolls[i]);
			}

			return statList;
		}

		protected abstract void SetSkillProficiency();

		public void SetStatModifiers(Hashtable stats)
		{
			ICollection keys = stats.Keys;
			Hashtable modifiers = new Hashtable();

			foreach (String key in keys)
			{
				String modifierName = key + "Modifier";
				int stat = (int)stats[key];
				int modifier = GetStatModifier(stat);
				modifiers.Add(modifierName, modifier);
			}

			StatModifiers = modifiers;
		}

	}
}
