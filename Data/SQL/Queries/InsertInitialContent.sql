INSERT INTO dbo.Ability (
	AbilityName ,
	AbilityDetail ,
	AbilityLevel
)
VALUES (
	('Stonecunning', 'On History checks related to stonework, add double proficiency bonus to the check instead of normal proficiency bonus.', 0)
);

INSERT INTO Classes.AbilityScoreImprovement (
	ClassID,
	Lvl
)
VALUES(

);

INSERT INTO Races.AbilityScoreImprovement (
	RaceID,
	SkillTypeID,
  Improvement
)
VALUES(

);

INSERT INTO Classes.Actions (
	ClassID,
	ActionTypeID,
	ActionName,
	ActionDetail
)
VALUES(

);

INSERT INTO Races.Actions (
	RaceID,
	ActionTypeID,
	ActionName,
	ActionDetail
)
VALUES(

);

INSERT INTO Monsters.Actions (
	MonsterID,
	ActionTypeID,
	AttackID
)
VALUES(

);

INSERT INTO Characters.Actions (
	CharacterID,
	ActionTypeID,
	AttackID
)
VALUES(

);

INSERT INTO Classes.Actions (
	ClassID,
	ActionTypeID,
	AttackID
)
VALUES(

);

INSERT INTO Racees.Actions (
	RaceID,
	ActionTypeID,
	AttackID
)
VALUES(

);

INSERT INTO dbo.ActionType (
	ActionType
)
VALUES (
	'Attack',
	'Cast a Spell',
	'Dash',
  'Disengage',
  'Dodge',
  'Help',
  'Hide',
  'Ready',
  'Search',
  'Use an Object'
);

INSERT INTO Classes.AdDisAdvantage (
	ClassID,
	AdDisAdvantageTypeID,
	SkillTypeID,
	AttackID,
	AdvantageFlag,
	DisadvantageFlag
)
VALUES (
	
);

INSERT INTO Monsters.AdDisAdvantage (
	MonsterID,
	AdDisAdvantageTypeID,
	SkillTypeID,
	AttackID,
	AdvantageFlag,
	DisadvantageFlag
)
VALUES (
	
);

INSERT INTO Races.AdDisAdvantage (
	RaceID,
	AdDisAdvantageTypeID,
	SkillTypeID,
	AttackID,
	AdvantageFlag,
	DisadvantageFlag
)
VALUES (
	
);

INSERT INTO Characters.AdDisAdvantage (
	CharacterID,
	AdDisAdvantageTypeID,
	SkillTypeID,
	AttackID,
	AdvantageFlag,
	DisadvantageFlag
)
VALUES (
	
)

INSERT INTO dbo.AdDisAdvantageType ( 
	AdDisAdvantageType
)
VALUES (

);

INSERT INTO dbo.Alignment (
	Alignment
)
VALUES (
	('Lawful Good'),
	('Neutral Good'),
	('Chaotic Good'),
	('Lawful Neutral'),
	('Neutral'),
	('Chaotic Neutral'),
	('Lawful Evil'),
	('Neutral Evil'),
	('Chaotic Evil')
);

INSERT INTO dbo.AreaOfEffect ( 
	Area
)
VALUES (
	'One target',
  '60 foot radius'
);

INSERT INTO Monsters.ArmorType ( 
	ArmorType
)
VALUES (
	'Natural'
);

INSERT INTO Classes.ArmorType ( -- cloth, leather, etc.
	ArmorType,
	BaseAC,
	ArmorCategoryID
)
VALUES (
	('Padded', '11 + DexterityModifier', 1),
	('Leather', '11 + DexterityModifier', 1),
	('Studded Leather', '12 + DexterityModifier', 1),
	('Hide', '12 + DexterityModifier (max 2)', 2),
	('Chain Shirt', '13 + DexterityModifier (max 2)', 2),
	('Scale Mail', '14 + DexterityModifier (max 2)', 2),
	('Breastplate', '14 + DexterityModifier (max 2)', 2),
	('Half Plate', '15 + DexterityModifier (max 2)', 2),
	('Ring Mail', '14', 3),
	('Chain Mail', '16', 3),
	('Splint', '17', 3),
	('Plate', '18', 3),
	('Shield', '+2', ),
	('Mage Armor Spell)', '13 + DexterityModifier', ),
	('Barbarian Unarmored Defense Ability', '10 + DexterityModifier + ConstitutionModifier', ),
	('Monk Unarmored Defense Ability', '10 + DexterityModifier + WisdomModifier', ),
	('Sorcerer Draconic Resilience Ability', '13 + DexterityModifier', )
);

INSERT INTO Classes.ArmorProficiency ( 
	ArmorTypeID,
	ClassID
)
VALUES (
	
);

INSERT INTO Races.ArmorProficiency ( 
	ArmorTypeID,
	RaceID
)
VALUES (
	
);

INSERT INTO Characters.ArmorProficiency ( 
	ArmorTypeID,
	CharacterID
)
VALUES (
	
);

INSERT INTO dbo.Attack ( 
  Attack,
	AttackTypeID, 
  DamageTypeID,
	Detail,
  ToHitBonus,
	Requirement,
  Damage,
	Modifier,
  AreaOfEffectID,
  SaveStatTypeID,
  SaveDC,
  SaveFail,
  SaveSuccess,
  RangeID,
	Reach
)
VALUES (
	

);

INSERT INTO Monsters.Attack ( 
  Attack,
	AttackTypeID, 
  DamageTypeID,
	Detail,
  ToHitBonus,
	Requirement,
  Damage,
	Modifier,
  AreaOfEffectID,
  SaveStatTypeID,
  SaveDC,
  SaveFail,
  SaveSuccess,
  RangeID,
	Reach,
	Recharge,
  LegendaryFlag
)
VALUES (
	

);

INSERT INTO dbo.AttackType ( 
	AttackType
)
VALUES (
  'Melee',
  'Ranged'
  
);

INSERT INTO Monsters.AttackType ( 
	AttackType
)
VALUES (
  'Breath Weapon',
  'MultiAttack',
  
);

INSERT INTO Races.BodyType (
	BodyType,
	Detail
)
VALUES (
	('Ectomorph', 'Often tall. Skinny with narrow shoulders, small joints, and long, thin muscles' ),
	('Ecto-Mesomorph', 'Skinny with wirey muscles' ),
	('Meso-EctoMorph', 'Thin with some muscle structure' ),
	('Mesomorph', 'Thick, strong bones with natural athletic muscle structure' ),
	('Meso-Endomorph', 'Heavily muscled with thick, strong bones' ),
	('Endo-Mesomorph', 'Heavily muscled with some body fat' ),
	('Endomorph', 'Chunky or obese, with a solid but soft body' )
);

INSERT INTO Classes.BonusAction ( 
	ClassID,
  BonusAction,
	Detail
)
VALUES (

);

INSERT INTO Monsters.BonusAction ( 
	MonsterID,
  BonusAction,
	Detail
)
VALUES (

);

INSERT INTO Classes.Class ( 
	ClassName,
	StatPriority,
	CastingClassFlag
)
VALUES (

);

INSERT INTO Characters.CharacterDetail ( 
	Age,
	AlignmentID,
	ArmorTypeID,
	CharacterName,
	ClassID,
	AbilityScores_JSON VARCHAR(MAX),
	AbilityModifiers_JSON VARCHAR(MAX),
	AbilitySavingThrows_JSON VARCHAR(MAX),
	Description_JSON VARCHAR(MAX),
  SkillBonuses_JSON VARCHAR(MAX),
  SkillProficiencies_JSON VARCHAR(MAX),
  PackID,
	HitDiceID,
	HitPoints,
	Initiative,
	Lvl,
	RaceID,
	SpellAttackModifier,
	SpellSaveDC
)
VALUES (

);

INSERT INTO dbo.Color (
	Color,
	TintID,
	HTML
)
VALUES (

);

INSERT INTO dbo.Condition ( /* blindness, etc. */
	Condition
)
VALUES (

);

INSERT INTO dbo.DamageType ( /* poison etc. */
	DamageType
)
VALUES (
	'Slashing',
	'Piercing',
	'Poison'
);

INSERT INTO dbo.Dialect ( 
	Dialect
)
VALUES (
	'Common',
	'Aarakocra',
	'Auran',
	'Dwarvish',
	'Draconian'
);

INSERT INTO Characters.Dialect 
	CharacterID,
	DialectID
)
VALUES (

)

INSERT INTO Monsters.Dialect 
	MonsterID,
	DialectID	
)
VALUES (

);

INSERT INTO Races.Dialect 
	RaceID,
	DialectID	
)
VALUES (

);

INSERT INTO Classes.Dialect 
	ClassID,
	DialectID	
)
VALUES (

);

INSERT INTO Races.DraconicAncestry (
	TintID,
	DamageTypeID,
	AreaofAttackID,
	SaveStatTypeID
)
VALUES (

);

INSERT INTO dbo.Ear (
	Shape,
	Lobe,
	Tilt	
)
VALUES (

);

INSERT INTO Races.Ear (
  RaceID,
  EarID
)
VALUES (

);

INSERT INTO Characters.Ear (
  CharacterID,
  EarID
)
VALUES (

);

INSERT INTO dbo.Equipment (
  Item
)
VALUES (

);

INSERT INTO Classes.Equipment (
	ClassID,
  EquipmentID
)
VALUES (

);

INSERT INTO Characters.Equipment (
	CharacterID,
  EquipmentID
)
VALUES (

);

INSERT INTO Races.Equipment (
	RaceID,
  EquipmentID
)
VALUES (

);

INSERT INTO dbo.Eyebrow (
	ArchHeight,
	ArchPlacement,
	Angle,
	Depth,
	Thickness,	
	HairLength
)
VALUES (

);

INSERT INTO Races.Eyebrow (
  RaceID,
  EyebrowID
)
VALUES (

);

INSERT INTO dbo.Eyelash (
	Curl,
	LashLength,
	Thickness
)
VALUES (

);

INSERT INTO Races.Eyelash (
  RaceID,
  EyelashID
)
VALUES (

);

INSERT INTO dbo.Eye (
	Shape,
	Eyelid
)
VALUES (

);

INSERT INTO Races.Eye (
  RaceID,
  EyeID
)
VALUES (

);

INSERT INTO dbo.FaceShape (
	FaceShape
)
VALUES (

);

INSERT INTO Races.FaceShape (
	RaceID,
  FaceShapeID
)
VALUES (

);

INSERT INTO dbo.Feature ( 
  Feature,
  Detail
)
VALUES (

);

INSERT INTO Classes.Feature ( 
	ClassID,
  FeatureID,
  Lvl
)
VALUES (

);

INSERT INTO dbo.Gender (
	Gender
)
VALUES (
  'Male',
  'Female',
  'Agender',
  'Bigender',
  'Demigender',
  'Genderfluid',
  'Transfeminine',
  'Transmasculine'  
);

INSERT INTO Races.HairColor (
	RaceID,
  TintID
)
VALUES (

);

INSERT INTO dbo.HairStyle ( -- Dragonborn add beaded barbs, tied back with a clasp, floating freely
	Style,				-- Orc, Tiefling have horns -- Dwarves and Humans have beards
)
VALUES (

);

INSERT INTO Races.HairStyle ( -- Dragonborn add beaded barbs, tied back with a clasp, floating freely
	StyleID,
  GenderID,
  RaceID -- Orc, Tiefling have horns
)
VALUES (

);


INSERT INTO dbo.HairTexture ( -- Dragonborn multiple descriptions of barbs framing the face
	Texture,
)
VALUES (

);

INSERT INTO Races.HairTexture ( -- Dragonborn multiple descriptions of barbs framing the face
	TextureID,
  RaceID
)
VALUES (

);

INSERT INTO dbo.HitDice (
  HitDice
)
VALUES (

);

INSERT INTO Classes.ImmunityOrResistance (
	ClassID,
	ImmunityOrResistanceTypeID,
	ConditionID,
	DamageTypeID
)
VALUES(
	
);

INSERT INTO Characters.ImmunityOrResistance (
	CharacterID,
	ImmunityOrResistanceTypeID,
	ConditionID,
	DamageTypeID
)
VALUES(
	
);

INSERT INTO Races.ImmunityOrResistance (
	RaceID,
	ImmunityOrResistanceTypeID,
	ConditionID,
	DamageTypeID
)
VALUES(
	
);

INSERT INTO Monsters.ImmunityOrResistance (
	MonsterID,
	ImmunityOrResistanceTypeID,
	ConditionID,
	DamageTypeID
)
VALUES(
	
);

INSERT INTO dbo.ImmunityOrResistanceType (
	ImmunityOrResistanceType
)
VALUES(
	'Immunity',
  'Resistance'
);

INSERT INTO Characters.Inventory (
	CharacterID,
	JsonContent
)
VALUES (

);

INSERT INTO Races.IrisColor (
	RaceID,
	TintID
)
VALUES (

);

INSERT INTO dbo.IrisShape (
	Shape
)
VALUES (

);

INSERT INTO Races.IrisShape (
	Shape
)
VALUES (

);

INSERT INTO ItemType ( /* armor, weapon, etc. */
	ItemType
)
VALUES (

);

INSERT INTO Monsters.LegendaryAction ( 
	MonsterID,
	ActionID,
	Cost
)
VALUES(
	
);

INSERT INTO Monsters.LegendaryResistance ( 
	MonsterID,
	TimesPerDay
);

INSERT INTO dbo.MagicalItem (
	Item,
  ItemClassID,
  ItemTypeID,
	AttunementFlag,
	BonusStatTypeID,
	BonusStatPlus,
  ImmunityOrResistanceID,
  ImmunityOrResistanceTypeID,
	RarityID,
	Detail
)
VALUES (

);

INSERT INTO Monsters.Monster (
	Monster,
	MonsterTypeID,
	AlignmentID,
	ArmorClass,
  ArmorType,
  MovementID,
  InitiativeBonus,
	ChallengeLevel,
	Detail,
	HitDiceID,
	HitPoints,
	SizeID,
	StatsID,
  SavingThrows,
	LairActionFlag,
  LegendaryActionFlag,
  EnvironmentID
)
VALUES (
	()
);

INSERT INTO Monsters.MonsterType (
	MonsterType
)
VALUES (
	'Aberration',
	'Beast',
	'Celestial',
	'Construct',
	'Dragon',
	'Elemental',
	'Fey',
	'Fiend',
	'Giant',
	'Humanoid',
	'Monstrosity',
	'Ooze',
	'Plant',
	'Undead'
);

INSERT INTO dbo.MouthShape ( 
	Shape,
)
VALUES (

);

INSERT INTO Races.MouthShape ( 
	RaceID,
  ShapeID
)
VALUES (

);

INSERT INTO Monsters.Movement (
	MonsterID,
  MovementTypeID,
  Speed
)
VALUES (
);

INSERT INTO Characters.Movement (
	CharacterID,
  MovementTypeID,
  Speed
)
VALUES (
);

INSERT INTO Races.Movement (
	RaceID,
  MovementTypeID,
  Speed
)
VALUES (
);

INSERT INTO Classes.Movement (
	ClassID,
  MovementTypeID,
  Speed,
  Lvl
)
VALUES (
);

INSERT INTO dbo.MovementType (
	MovementType
)
VALUES (
	'Walking',
	'Flying'
);

INSERT INTO dbo.Nose (
	Shape
)
VALUES (

);

INSERT INTO Races.Nose (
	RaceID,
  ShapeID,
	SizeID
)
VALUES (

);

INSERT INTO dbo.Pack (
  PackType,
  EquipmentIDs
)
VALUES (

);

INSERT INTO Classes.Pack (
  ClassID,
  PackID
)
VALUES (

);

INSERT INTO Characters.Pack (
  CharacterID,
  PackID
)
VALUES (

);

INSERT INTO Race.Pack (
  RaceID,
  PackID
)
VALUES (

);

INSERT INTO Classes.PassiveSkill (
  ClassID,
  SkillID
)
VALUES (

);

INSERT INTO Characters.PassiveSkill (
  CharacterID,
  SkillID
)
VALUES (

);
INSERT INTO Monsters.PassiveSkill (
  MonsterID,
  SkillID
)
VALUES (

);

INSERT INTO Races.PassiveSkill (
  RaceID,
  SkillID
)
VALUES (

);

INSERT INTO dbo.ProficiencyBonus (
	Lvl1,
	Lvl2,
	Lvl3,
	Lvl4,
	Lvl5,
	Lvl6,
	Lvl7,
	Lvl8,
	Lvl9,
	Lvl10,
	Lvl11,
	Lvl12,
	Lvl13,
	Lvl14,
	Lvl15,
	Lvl16,
	Lvl17,
	Lvl18,
	Lvl19,
	Lvl20
)
VALUES (
	2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6
);

INSERT INTO dbo.PupilColor (
	RaceID,
	TintID
)
VALUES (

);

INSERT INTO dbo.PupilShape (
	Shape
)
VALUES (

);

INSERT INTO Races.PupilShape (
	RaceID,
	ShapeID
)
VALUES (

);

INSERT INTO Races.Race (
	Race,
	MinAge,
	MaxAge,
	SizeID,
	StatIncrease,
	StatTypeID,
	MovementID,
	NumToolProficiencies
)
VALUES (
	
);

INSERT INTO Races.RacialName (
	RaceID,
  RacialName
)
VALUES (

);

INSERT INTO dbo.Rarity (
	Rarity
)
VALUES (

);

INSERT INTO Races.Sclera (
	RaceID,
	TintID
)
VALUES (

);

INSERT INTO dbo.Sense (
	Sense,
  Detail,
  RangeID
)
VALUES ( 
);

INSERT INTO Classes.Sense (
  ClassID,
  SenseID
)
VALUES (

);

INSERT INTO Characters.Sense (
  CharacterID,
  SenseID
)
VALUES (

);
INSERT INTO Monsters.Sense (
  MonsterID,
  SenseID
)
VALUES (

);

INSERT INTO Races.Sense (
  RaceID,
  SenseID
)
VALUES (

);

INSERT INTO dbo.Sizes (
	Sizes,
	HeightOrLength,
	AvgWeight,
	HitDice
)
VALUES (
	('Tiny', '1-2 ft.', '1-8 lb.' 'd4'),
	('Small', '2-4 ft.','8-60 lb.', 'd6'),
	('Medium', '4-8 ft.', '60-500 lb.', 'd8'),
	('Large', '8-16 ft.', '500-4,000 lb.', 'd10'),
	('Huge', '16-32 ft.', '4,000-32,000 lb.', 'd12'),
	('Gargantuan', '32-64 ft.', '32,000-250,000 lb.', 'd20')
);

INSERT INTO Races.Sizes (
	RaceID,
	SizeID,
	MinHeight,
	MaxHeight,
	MinWeight,
	MaxWeight
)
VALUES (
	(1,3,48,60,125,200)
);.

INSERT INTO Races.SkinColor (
	RaceID,
	TintID
)
VALUES (

);

INSERT INTO dbo.SkinTexture (
	Texture
)
VALUES (

);

INSERT INTO Races.SkinTexture (
	RaceID,
  TextureID
)
VALUES (

);

INSERT INTO Races.SpecialAbility (
	RaceID,
  AbilityID
)
VALUES (

);

INSERT INTO Classes.SpecialAbility (
	ClassID,
  AbilityID
)
VALUES (

);

INSERT INTO Monsters.SpecialAbility (
	MonsterID,
  AbilityID
)
VALUES (

);

INSERT INTO Characters.SpecialAbility (
	CharacterID,
  AbilityID
)
VALUES (

);

INSERT INTO dbo.Spell (
	Spell,
  AreaOfEffectID, 
  BonusAction,
  ConcentrationFlag,
  Effect,
  GestureFlag,
  Lvl,
  MaterialRequirements,
  NumAffected,
  OnSaveImmunity,
  RangeID,
  RestrictToMaxSizeID,
  SaveStatTypeID,
  SpellCastTimeID,
  SpellDamageID,
  SpellDurationID,
  SpellRecoveryID,
  SpellSchoolID,
  SpellTypeID,
  VerbalFlag  
)
VALUES (

);

INSERT INTO Classes.Spell (
	ClassID,
  SpellID
)
VALUES (

);

INSERT INTO Monsters.Spell (
	MonsterID,
  SpellID
)
VALUES (

);

INSERT INTO Characters.Spell (
	CharacterID,
  SpellID
)
VALUES (

);

INSERT INTO Races.Spell (
	RaceID,
  SpellID
)
VALUES (

);

INSERT INTO dbo.SpellCastTime (
  CastTime
)
VALUES (
  '1 Action',
  '1 hour'
);

INSERT INTO dbo.SpellDamage (
  SpellID,
  DamageTypeID,
  Damage,
  OnFailedSave,
  OnSave,
  AtHigherLevel
)
VALUES (
  'Instantaneous',
  '10 Days'
);

INSERT INTO dbo.SpellDuration (
  Duration
)
VALUES (
  'Instantaneous',
  '10 Days'
);

INSERT INTO dbo.SpellRecovery (
  SpellID,
  SpellRecovery
)
VALUES (
  'Short Rest',
  'Long Rest',
  '1 Week'
);

INSERT INTO dbo.SpellSchool (
  SpellID,
  School
)
VALUES (
  'Enchantment',
  'Necromancy'
);


INSERT INTO Classes.SpellSlot (
	ClassID,
	CantripSlotCount,
	FirstLvlSlotCount,
	SecondLvlSlotCount,
	ThirdLvlSlotCount,
	FourthLvlSlotCount,
	FifthLvlSlotCount,
	SixthLvlSlotCount,
	SeventhLvlSlotCount,
	EightLvlSlotCount,
	NinthLvlSlotCount
)
VALUES (

);

INSERT INTO Races.SpellSlot ( -- REFACTOR
	RaceID,
	CantripSlotCount,
	FirstLvlSlotCount,
	SecondLvlSlotCount,
	ThirdLvlSlotCount,
	FourthLvlSlotCount,
	FifthLvlSlotCount,
	SixthLvlSlotCount,
	SeventhLvlSlotCount,
	EightLvlSlotCount,
	NinthLvlSlotCount
)
VALUES (

);

INSERT INTO SpellType (
	SpellType
)
VALUES (
  'Debuff',
  'Damage'
);

INSERT INTO Monsters.Stat (
	MonsterID,
	Charisma,
	CharismaMod,
	Constitution,
	ConstitutionMod,
	Dexterity,
	DexterityMod,
	InitiativeBonus,
	Intellect,
	IntellectMod,
  SpellAttackDC,
  SpellModifier,
	Strength,
	StrengthMod,
  ToHitModifier,
	Wisdom,
	WisdomMod,
)
VALUES (
	()
);

INSERT INTO Characters.Stat (
	CharacterID,
	Charisma,
	CharismaMod,
	Constitution,
	ConstitutionMod,
	Dexterity,
	DexterityMod,
	InitiativeBonus,
	Intellect,
	IntellectMod,
  SpellAttackDC,
  SpellModifier,
	Strength,
	StrengthMod,
	Wisdom,
	WisdomMod,
)
VALUES (
	
);

INSERT INTO StatType (
	StatType
)
VALUES (
	('Charisma'),
	('CharismaMod'),
	('CharismaSave'),
	('Constitution'),
	('ConstitutionMod'),
	('ConstitutionSave'),
	('Dexterity'),
	('DexterityMod'),
	('DexteritySave'),
	('Intellect'),
	('IntellectMod'),
	('IntellectSave'),
	('SpellSaveDC'),
	('SpellAttackModifier'),
	('Strength'),
	('StrengthMod'),
	('StrengthSave'),
	('Wisdom'),
	('WisdomMod'),
	('WisdomSave')
);

INSERT INTO Tint (
	Tint
)
VALUES (

);

INSERT INTO Tool (
	Tool
)
VALUES (
	'Alchemist''s supplies',
	'Brewer''s supplies',
	'Calligrapher''s Supplies',
	'Carpenter''s tools',
	'Cartographer''s tools',
	'Cobbler''s tools',
	'Cook''s utensils',
	'Glassblower''s tools',
	'Jeweler''s tools',
	'Leatherworker''s tools',
	'Mason''s tools',
	'Painter''s supplies',
	'Potter''s tools',
	'Smith''s tools',
	'Tinker''s tools',
	'Weaver''s tools',
	'Woodcarver''s tools',
	'Dice set',
	'Playing card set',
	'Bagpipes',
	'Drum',
	'Dulcimer',
	'Flute',
	'Lute',
	'Lyre',
	'Horn',
	'Pan flute',
	'Shawm',
	'Viol',
	'Navigator''s tools',
	'Thieves’ tools'
);

INSERT INTO Classes.ToolProficiency (
	ToolID,
	ClassID
)
VALUES (
);

INSERT INTO Races.ToolProficiency (
	ToolID,
	RaceID
)
VALUES (
	(14,1,),
	(2,1,),
	(11,1,)
);

INSERT INTO Characters.ToolProficiency (
	ToolID,
	CharacterID
)
VALUES (

);

INSERT INTO Weapon (
	Weapon,
	WeaponClassID,
	Damage,
	DamageTypeID,
	Properties,
	RangeID,
	RarityID,
	AttunementFlag
)
VALUES (

);

INSERT INTO Characters.WeaponProficiency (
	CharacterID,
	WeaponClassID
)
VALUES (

);
INSERT INTO Classes.WeaponProficiency (
	ClassID,
	WeaponClassID
)
VALUES (

);
INSERT INTO Races.WeaponProficiency (
	RaceID,
	WeaponClassID
)
VALUES (

);
INSERT INTO Monsters.WeaponProficiency (
	MonsterID,
	WeaponClassID
)
VALUES (

);

INSERT INTO dbo.WeaponType (
	WeaponType,
  WeaponClassID
)
VALUES (
  'Handaxe',
  'Warhammer'
);

INSERT INTO Races.WeaponType (
	RaceID,
  WeaponTypeID
)
VALUES (
  'Handaxe',
  'Warhammer'
);