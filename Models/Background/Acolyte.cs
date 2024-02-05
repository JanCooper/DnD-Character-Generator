using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
	class Acolyte : Background, IBackground
	{
		/********************* Class Constructor *********************/
		public Acolyte(string Background)
		{
			_name = Background;
		}

		/********************* Internal Values *********************/
		internal string _name { get; private set; }


		/********************* Private Values *********************/
		private string _feature { get { return GetFeature("Background",_name);  } }

		private List<string> _languages
		{
			get
			{
				List<string> languages = new List<string>()
				{
					"Choose 2"
				};
				return languages;
			}
		}

		private List<string> _skillProficiency
		{ 
			get
			{
				List<string> proficiency = new List<string>()
				{
					"Insight",
					"Religiion"
				};
				return proficiency;
			}
		}

		private List<string> _toolProficiency { get { return GetToolProficiency(_name); } }


		/********************* Public Values *********************/
		public string Background { get { return _name; } }
		public string Feature { get { return _feature; } }


		public List<string> Languages { get { return _languages; } }
		public List<string> SkillProficiency { get { return _skillProficiency; } }
		public List<string> ToolProficiency { get { return _toolProficiency; } }

		/********************* Class Methods *********************/



	}
}
