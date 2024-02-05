using System;
using System.Collections.Generic;

namespace CharacterCreatorApp
{
	interface IRace
	{
		int Age { get; }
		int Speed { get; }

		string Alignment { get; }
		string CharacterName { get; }
		string Gender { get; }
		string Race { get; }

		List<string> Languages { get; }
		List<string> SkillProficiency { get; }

		Dictionary<string, int> RacialAbility { get; }

		Dictionary<string, string> BodyDescription { get; }
	}
}
