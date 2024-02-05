using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	interface IBackground
	{
		string Feature { get; }
		string Background { get; }

		List<string> Languages { get; }
		List<string> SkillProficiency { get; }
		List<string> ToolProficiency { get; }
	}
}
