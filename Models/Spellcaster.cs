using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnDRandomCharacterGenerator.Models
{
	abstract class Spellcaster : PlayerClass
	{
		/*********************************************************************************/
		// constructors
		/*********************************************************************************/
		public Spellcaster(int Level) : base(Level)
		{

		}

		/*********************************************************************************/
		// private variables
		/*********************************************************************************/
		public Hashtable Cantrips
		{
			set
			{
				SetCantrips();
			}
		}

		private int CantripsKnown
		{
			get
			{
				int cantripsKnown = 0;

				if (Enumerable.Range(1, 9).Contains(Level))
				{
					cantripsKnown = 2;
				}
				else if (Enumerable.Range(10, 13).Contains(Level))
				{
					cantripsKnown = 3;
				}
				else if (Enumerable.Range(14, 20).Contains(Level))
				{
					cantripsKnown = 4;
				}

				return cantripsKnown;
			}
		}

		public Hashtable Spells
		{
			set
			{
				SetSpells(SpellSlots);
			}
		}
		public int SpellSaveDC
		{
			get
			{
				return GetSpellSaveDC();
			}
		}
		public Hashtable SpellSlots
		{
			get
			{
				return GetSpellSlots();
			}
		}

		/*********************************************************************************/
		// setters
		/*********************************************************************************/
		private int GetSpellSaveDC()
		{
			return GetProficiencyBonus() + (int)StatModifiers["Intelligence"] + 8;
		}

		protected abstract Hashtable GetSpellSlots();

		private void SetCantrips()
		{
			Hashtable cantrips = new Hashtable();
			int cantripsKnown = CantripsKnown;
			// TODO get cantrips from database

			Cantrips = cantrips;
		}

		private Hashtable SetSpells(Hashtable spellSlots)
		{
			Hashtable spells = new Hashtable();
			// TODO get spells from database

			return spells;
		}




	}
}
