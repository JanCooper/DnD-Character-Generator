using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	interface IClass
	{
		string CharacterClass { get; }

		List<string> Languages { get; }
		List<string> SkillProficiency { get; }
		List<string> ToolProficiency { get; }
		/*
		bool IsCastingClass { get ; }

		string Armor { get; }
		string ClassName { get; }

		int ArmorClass { get; }
		int ClassLanguageCount { get; }
		int HitPoint { get; }
		int ProficiencyBonus { get; }

		List<string> AbilityScoreImprovement { get; }
		List<string> Equipment { get; }
		List<string> SavingThrow { get; }
		List<string> Skill { get; }
		List<string> StatPriority { get; }

		Dictionary<string, string> AbilityIncrease { get; }
		Dictionary<string, string> BaseAbilityScore { get; }
		Dictionary<string, string> SpecialAbilities { get; }
		Dictionary<string, List<string>> Proficiency { get; }
		Dictionary<string, string> Sense{ get; }
		*/
	}
}
