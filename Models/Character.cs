using System;
using System.Collections.Generic;
using System.Reflection;
using System.Runtime.Remoting.Activation;

namespace CharacterCreatorApp
{
	class Character
	{
		/********************* Class Constructor *********************/
		public Character(string CharacterType, int Level)
		{
			_level = Level;
			_characterType = CharacterType;
		}

		/********************* Internal Values *********************/
		internal int _level;
		internal string _characterType;

		/********************* Private Values *********************/
		private ICharacter _returnCharacter { get { return GetCharacter(_characterType, _level); } }
		private Dictionary<string, string> _characterDetail { get { return GetCharacterDetail(_returnCharacter); } }


		/********************* Public Values *********************/
		public int Level { get { return _level; } }
		public Dictionary<string, string> CharacterDetail { get { return _characterDetail; } }

		
		/********************* Class Methods *********************/
		private ICharacter GetCharacter(string option, int level)
		{
			ICharacter character;
			if (option == "Monster")
				character = new Monster(level);
			else
				character = new Player(level);
			return character;
		}

		private Dictionary<string, string> GetCharacterDetail(ICharacter returnCharacter)
		{
			Dictionary<string, string> details = new Dictionary<string, string>();

			Type returnCharacterType = returnCharacter.GetType();
			PropertyInfo[] properties = returnCharacterType.GetProperties();

			foreach (PropertyInfo prop in properties)
			{
				details.Add(prop.Name, prop.GetValue(returnCharacter, null).ToString());
			}

			return details;
		}
	}
}
