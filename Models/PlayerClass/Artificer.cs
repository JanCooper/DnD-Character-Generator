
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnDRandomCharacterGenerator.Models
{
	class Artificer : Spellcaster

	{
		/*********************************************************************************/
		// constructors
		/*********************************************************************************/
		public Artificer(int Level) : base(Level)
		{
		}

		/*********************************************************************************/
		// private variables
		/*********************************************************************************/

		private new List<String> ArmorProficiency = new List<String>()
		{
			"Light",
			"Medium",
			"Shields"
		};


		private new int HitDice = 8; // + constitution modifier
		private Hashtable InfusedItems;
		private Hashtable InfusionSpells;

		private new List<String> SavingThrows = new List<String>()
		{
			"Constitution",
			"Intelligence"
		};

		private new List<String> ToolProficiency = new List<String>()
		{
			"Thieves'",
			"Tinker's",
		}; // + 1 artisan's tools

		private new List<String> WeaponProficiency = new List<String>()
		{
			"Simple"
		};

		private const int WalkingSpeed = 30;

		/*********************************************************************************/
		// public variables
		/*********************************************************************************/
		public Hashtable infusedItems
		{
			get
			{
				return InfusedItems;
			}
			set
			{
				SetInfusedItems();
			}
		}

		public int lvlOneHitPoints
		{
			get
			{
				return HitDice + ConstitutionModifier;
			}
		}

		public List<String> savingThrows
		{
			get
			{
				return SavingThrows;
			}
		}

		public Hashtable statModifiers
		{
			get
			{
				return StatModifiers;
			}
			set
			{
				SetStatModifiers();
			}
		}

		public Hashtable stats
		{
			get
			{
				return Stats;
			}
			set
			{
				SetStats();
			}
		}

		/*********************************************************************************/
		// private methods
		/*********************************************************************************/

		private Hashtable GetInfusions()
		{
			Hashtable infusions = new Hashtable();
			// TODO get infusions from database

			return infusions;
		}

		private Hashtable GetInfusionCounts()
		{
			// TODO move infusions known up to GetInfusions
			// TODO create GetInfusedItems method

			Hashtable infusions = new Hashtable();

			if (Enumerable.Range(2, 5).Contains(Level))
			{
				infusions.Add("known", 4);
				infusions.Add("items", 2);
			}
			else if (Enumerable.Range(6, 9).Contains(Level))
			{
				infusions.Add("known", 6);
				infusions.Add("items", 3);
			}
			else if (Enumerable.Range(10, 13).Contains(Level))
			{
				infusions.Add("known", 8);
				infusions.Add("items", 4);
			}
			else if (Enumerable.Range(14, 17).Contains(Level))
			{
				infusions.Add("known", 10);
				infusions.Add("items", 5);
			}
			else if (Enumerable.Range(18, 20).Contains(Level))
			{
				infusions.Add("known", 12);
				infusions.Add("items", 6);
			}

			return infusions;
		}



		protected override List<String> GetStartingEquipment()
		{
			// TODO get 2 simple weapons (not light crossbow)

			List<String> equipment = new List<String>()
			{
				"Light Crossbow",
				"20 Light Crossbow Bolts",
				"Thieves' Tools"
			};

			int choice = Random.Next(1, 3);

			if (choice == 1)
			{
				equipment.Add("Studded Armor");
			}
			else
			{
				equipment.Add("Scale Mail");
			}

			SetPack(equipment, "dungeoneer");

			return equipment;
		}

		protected override Hashtable GetSpellSlots()
		{
			Hashtable slotsPerLvl = new Hashtable();

			if (new[] { 1, 2 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 2);
			} 
			else if (new[] { 3, 4 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 3);
			}
			else if (new[] { 5, 6 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 4);
				slotsPerLvl.Add(2, 2);
			}
			else if (new[] { 7, 8 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 4);
				slotsPerLvl.Add(2, 3);
			}
			else if (new[] { 9, 10 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 4);
				slotsPerLvl.Add(2, 3);
				slotsPerLvl.Add(3, 2);
			}
			else if (new[] { 11, 12 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 4);
				slotsPerLvl.Add(2, 3);
				slotsPerLvl.Add(3, 3);
			}
			else if (new[] { 13, 14 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 4);
				slotsPerLvl.Add(2, 3);
				slotsPerLvl.Add(3, 3);
				slotsPerLvl.Add(4, 1);
			}
			else if (new[] { 15, 16 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 4);
				slotsPerLvl.Add(2, 3);
				slotsPerLvl.Add(3, 3);
				slotsPerLvl.Add(4, 2);
			}
			else if (new[] { 17, 18 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 4);
				slotsPerLvl.Add(2, 3);
				slotsPerLvl.Add(3, 3);
				slotsPerLvl.Add(4, 3);
				slotsPerLvl.Add(5, 1);
			}
			else if (new[] { 19, 20 }.Contains(Level))
			{
				slotsPerLvl.Add(1, 4);
				slotsPerLvl.Add(2, 3);
				slotsPerLvl.Add(3, 3);
				slotsPerLvl.Add(4, 3);
				slotsPerLvl.Add(5, 2);
			}

			return slotsPerLvl;
		}

		private void setStats()
		{
			List<int> statRolls = GetStatRolls();
			statRolls.Sort();

			Hashtable stats = new Hashtable()
			{
				{ "Intelligence", statRolls[5] },
				{ "Constitution", statRolls[4] },
				{ "Dexterity", statRolls[3] }
			};

			statRolls.RemoveAt(5);
			statRolls.RemoveAt(4);
			statRolls.RemoveAt(3);

			List<String> remainingStats = new List<String>()
			{
				"Charisma",
				"Strength",
				"Wisdom"
			};

			List<int> remainingStatRolls = RandomizeStatSelection(statRolls);
			Hashtable setRemainingStats = SetRemainingStats(remainingStats, remainingStatRolls);

			ICollection keys = setRemainingStats.Keys;

			foreach (String statName in keys)
			{
				stats.Add(statName, setRemainingStats[statName]);
			}

			Stats = stats;
		}

		protected override void SetSkillProficiency()
		{
			List<String> skillOptions = new List<String>()
			{
				"Aracana",
				"History",
				"Investigation",
				"Medicine",
				"Nature",
				"Sleight of Hand"
			};

			List<String> skills = new List<String>()
			{
				"Perception"
			};

			int randomSkill = Random.Next(1, 7);

			skills.Add(skillOptions[randomSkill]);

			SkillProficiency =  skills;
		}



		/*********************************************************************************/
		// public methods
		/*********************************************************************************/


	}

}
