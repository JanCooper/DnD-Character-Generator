/*
DROP TABLE IF EXISTS Characters.Actions;  
CREATE TABLE Characters.Actions (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	ActionTypeID INT NOT NULL,
	AttackID INT
);
DROP TABLE IF EXISTS Characters.AdvantageDisAdvantage -- ability check, saving throw, attack roll
CREATE TABLE Characters.AdvantageDisAdvantage (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	AdvantageDisAdvantageID INT NOT NULL,
	SkillTypeID INT,
	AttackID INT,
	AdvantageFlag INT,
	DisadvantageFlag INT
);
DROP TABLE IF EXISTS Characters.ArmorProficiency;
CREATE TABLE Characters.ArmorProficiency ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ArmorTypeID INT NOT NULL,
	CharacterID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.Background;
CREATE TABLE Characters.Background ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Background VARCHAR NOT NULL,
	FeatureID INT 
	Detail VARCHAR
);
DROP TABLE IF EXISTS Characters.BackgroundProficiency;
CREATE TABLE Characters.Background ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	BackgroundID INT NOT NULL,
	SkillID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.CharacterDetail;
CREATE TABLE CharacterDetail (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Age INT,
	AlignmentID INT,
	ArmorTypeID INT NOT NULL,
	CharacterName VARCHAR NOT NULL,
	ClassID INT NOT NULL,
	StatID INT NOT NULL,
	AbilityScores_JSON VARCHAR(MAX),
	AbilityModifiers_JSON VARCHAR(MAX),
	AbilitySavingThrows_JSON VARCHAR(MAX),
	Description_JSON VARCHAR(MAX),
	SkillBonuses_JSON VARCHAR(MAX),
	SkillProficiencies_JSON VARCHAR(MAX),
	PackID INT,
	HitDiceID INT NOT NULL,
	HitPoints INT NOT NULL,
	Initiative INT NOT NULL,	
	Lvl INT NOT NULL,
	RaceID INT NOT NULL,
	SpellAttackModifier INT,
	SpellSaveDC INT
);
DROP TABLE IF EXISTS Characters.Dialect;
CREATE TABLE  Characters.Dialect (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL, 
	DialectID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.Ear;
CREATE TABLE Characters.Ear (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	EarID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.Equipment;
CREATE TABLE Characters.Equipment (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	EquipmentID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.ImmunityOrResistance;
CREATE TABLE Characters.ImmunityOrResistance (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID  INT NOT NULL,
	ImmunityOrResistanceID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.Inventory;
CREATE TABLE Characters.Inventory (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterDetailID INT NOT NULL,
	JsonContent NVARCHAR(MAX)
);
DROP TABLE IF EXISTS Characters.Movement;
CREATE TABLE Characters.Movement (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL, 
	MovementTypeID INT NOT NULL,
	Speed INT NOT NULL
);
DROP TABLE IF EXISTS Characters.Pack;
CREATE TABLE Characters.Pack (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	PackID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.PassiveSkill;
CREATE TABLE Characters.PassiveSkill (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	SkillID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.SavingThrowProficiency;
CREATE TABLE Characters.SavingThrowProficiency ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	StatTypeID INT NOT NULL,
	StatPlus INT NOT NULL
);
DROP TABLE IF EXISTS Characters.Sense;
CREATE TABLE Characters.Sense (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	SenseID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.SkillProficiency;
CREATE TABLE Characters.SkillProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	SkillID INT NOT NULL,
	SkillPlus INT NOT NULL
);
DROP TABLE IF EXISTS Characters.SpecialAbility;
CREATE TABLE Characters.SpecialAbility (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	AbilityID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.Spell;
CREATE TABLE Characters.Spell (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	SpellID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.Stat;
CREATE TABLE Characters.Stats(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	Charisma INT NOT NULL,
	CharismaMod INT NOT NULL,
	Constitution INT NOT NULL,
	ConstitutionMod INT NOT NULL,
	Dexterity INT NOT NULL,
	DexterityMod INT NOT NULL,
	InitiativeBonus INT,
	Intellect INT NOT NULL,
	IntellectMod INT NOT NULL,
	SpellAttackDC INT,
	SpellModifier INT,
	Strength INT NOT NULL,
	StrengthMod INT NOT NULL,
	Wisdom INT NOT NULL,
	WisdomMod INT NOT NULL,
);
DROP TABLE IF EXISTS Characters.ToolProficiency;
CREATE TABLE Characters.ToolProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ToolID INT NOT NULL,
	CharacterID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.Trait;
CREATE TABLE Characters.Trait (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	TraitID INT NOT NULL
);
DROP TABLE IF EXISTS Characters.WeaponProficiency;
CREATE TABLE Characters.WeaponProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterID INT NOT NULL,
	WeaponTypeID INT NOT NULL
);

DROP TABLE IF EXISTS Classes.Actions;  
CREATE TABLE Classes.Actions (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	ActionTypeID INT NOT NULL,
	AttackID INT
);
DROP TABLE IF EXISTS Classes.AdvantageDisAdvantage -- ability check, saving throw, attack roll
CREATE TABLE Classes.AdvantageDisAdvantage (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	AdvantageDisAdvantageID INT NOT NULL,
	SkillTypeID INT,
	AttackID INT,
	AdvantageFlag INT,
	DisadvantageFlag INT
);
DROP TABLE IF EXISTS Classes.ArmorProficiency;
CREATE TABLE Classes.ArmorProficiency ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	ArmorTypeID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.ArmorType;  -- cloth, leather, etc.
CREATE TABLE Classes.ArmorType ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ArmorType VARCHAR NOT NULL,
	BaseAC VARCHAR NOT NULL, 
	ArmorCategoryID INT
);
DROP TABLE IF EXISTS Classes.Background;
CREATE TABLE Classes.Background ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	BackgroundID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.BonusAction; 
CREATE TABLE Classes.BonusAction (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	ActionTypeID INT NOT NULL,
	AttackID INT,
	SpellID INT
);
DROP TABLE IF EXISTS Classes.ClassType;
CREATE TABLE Classes.ClassType; ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassName VARCHAR NOT NULL,
	StatPriority VARCHAR NOT NULL
	SpellcastingStatID INT
);
DROP TABLE IF EXISTS Classes.Dialect;
CREATE TABLE  Classes.Dialect (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL, 
	DialectID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.Equipment;
CREATE TABLE Classes.Equipment (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	EquipmentID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.Feature;
CREATE TABLE Classes.Feature ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	FeatureID INT NOT NULL,
	Lvl INT NOT NULL,
	Die INT
);
DROP TABLE IF EXISTS Classes.ImmunityOrResistance;
CREATE TABLE Classes.ImmunityOrResistance (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	ImmunityOrResistanceID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.Movement;
CREATE TABLE Classes.Movement (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL, 
	MovementTypeID INT NOT NULL,
	Speed INT NOT NULL,
	Lvl INT
);
DROP TABLE IF EXISTS Classes.Pack;
CREATE TABLE Classes.Pack (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	PackID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.Paths;
CREATE TABLE Classes.Paths (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	Paths VARCHAR NOT NULL
);
DROP TABLE IF EXISTS Classes.PathFeature;
CREATE TABLE Classes.PathFeature (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Feature VARCHAR NOT NULL
);
DROP TABLE IF EXISTS Classes.PathFeatureLvl;
CREATE TABLE Classes.PathFeatureLvl (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	Lvl INT NOT NULL,
	PathID INT NOT NULL,
	PathFeatureID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.PassiveSkill;
CREATE TABLE Classes.PassiveSkill (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	SkillID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.SavingThrowProficiency;
CREATE TABLE Classes.SavingThrowProficiency ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	StatTypeID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.Sense;
CREATE TABLE Classes.Sense (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	SenseID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.SkillProficiency;
CREATE TABLE Classes.SkillProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	SkillID INT NOT NULL,
	SkillPlus INT NOT NULL
);
DROP TABLE IF EXISTS Classes.SpecialAbility;
CREATE TABLE Classes.SpecialAbility (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	AbilityID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.Spell;
CREATE TABLE Classes.Spell (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	SpellID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.SpellSlot;
CREATE TABLE Classes.SpellSlot (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	TotalSpells INT NOT NULL,
	Cantrips INT NOT NULL,
	FirstLvl INT NOT NULL,
	SecondLvl INT,
	ThirdLvl INT,
	FourthLvl INT,
	FifthLvl INT,
	SixthLvl INT,
	SeventhLvl INT,
	EightLvl INT,
	NinthLvl INT,
);
DROP TABLE IF EXISTS Classes.Tool;
CREATE TABLE Classes.Tool (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	ToolID INT NOT NULL	
);
DROP TABLE IF EXISTS Classes.ToolProficiency;
CREATE TABLE Classes.ToolProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	ToolID INT NOT NULL
);
DROP TABLE IF EXISTS Classes.WeaponProficiency;
CREATE TABLE Classes.WeaponProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT NOT NULL,
	WeaponClassID INT NOT NULL
);
*/
/********************************************************************************
DROP TABLE IF EXISTS dbo.Ability; -- Class/Monster abilities
CREATE TABLE dbo.Ability (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Ability VARCHAR NOT NULL,
	Detail VARCHAR,
	Lvl INT,
);
DROP TABLE IF EXISTS dbo.ActionType; -- https://5thsrd.org/combat/actions_in_combat/ 
CREATE TABLE dbo.ActionType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ActionType VARCHAR NOT NULL, 
	Detail VARCHAR,
);
DROP TABLE IF EXISTS dbo.AdvantageDisAdvantage; -- ability check, saving throw, attack roll
CREATE TABLE dbo.AdvantageDisAdvantage (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	AdvantageDisAdvantageType VARCHAR NOT NULL
);
********************************************************************************/
DROP TABLE IF EXISTS dbo.Alignment;
CREATE TABLE dbo.Alignment (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Alignment VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.AreaOfEffect; -- RE: attacks
CREATE TABLE dbo.AreaOfEffect ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Area VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.ArmorCategory;
CREATE TABLE dbo.ArmorCategory ( -- light, medium, heavy
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ArmorCategory VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Background;
CREATE TABLE dbo.Background (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Background VARCHAR NOT NULL,
	FeatureID INT NOT NULL,
	Proficiency1 INT NOT NULL,
	Proficiency2 INT NOT NULL,
	ToolCount INT,
	LanguageCount INT,
	ToolTypeIDs VARCHAR
);
DROP TABLE IF EXISTS dbo.BackgroundEquipment;
CREATE TABLE dbo.BackgroundEquipment (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	BackgroundID INT NOT NULL,
	EquipmentID INT NOT NULL
);
DROP TABLE IF EXISTS dbo.BodyType; -- ectomorph
CREATE TABLE Races.BodyType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	BodyType VARCHAR NOT NULL,
	Detail VARCHAR
);
DROP TABLE IF EXISTS dbo.Color;
CREATE TABLE dbo.Color (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Color VARCHAR NOT NULL,
	TintID INT NOT NULL,
	HTML VARCHAR
);
DROP TABLE IF EXISTS dbo.Condition;
CREATE TABLE dbo.Condition ( /* blindness, etc. */
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Condition VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.DamageType;
CREATE TABLE dbo.DamageType ( /* poison etc. */
	ID INT IDENTITY(1,1) PRIMARY KEY,
	DamageType VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Dialect; -- Languages
CREATE TABLE dbo.Dialect ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Dialect VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Ear;
CREATE TABLE dbo.Ear (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Shape VARCHAR,
	Lobe VARCHAR,
	Tilt VARCHAR
);
DROP TABLE IF EXISTS dbo.Equipment;
CREATE TABLE dbo.Equipment (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Item VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Eye;
CREATE TABLE dbo.Eye (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Shape VARCHAR,
	Eyelid VARCHAR
);
DROP TABLE IF EXISTS dbo.Eyebrow;
CREATE TABLE dbo.Eyebrow (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ArchHeight VARCHAR,
	ArchPlacement VARCHAR,
	Angle VARCHAR,
	Density VARCHAR,
	Thickness VARCHAR,
	HairLength VARCHAR
);
DROP TABLE IF EXISTS dbo.Eyelash;
CREATE TABLE dbo.Eyelash (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Curl VARCHAR,
	LashLength VARCHAR,
	Thickness VARCHAR
);
DROP TABLE IF EXISTS dbo.FaceShape;
CREATE TABLE dbo.FaceShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	FaceShape VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Feature; 
CREATE TABLE dbo.Feature ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Feature VARCHAR NOT NULL,
	Detail VARCHAR NOT NULL,
);
DROP TABLE IF EXISTS dbo.HairStyle; 
CREATE TABLE dbo.HairStyle ( -- Dragonborn add beaded barbs, tied back with a clasp, floating freely
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Style VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.HairTexture;
CREATE TABLE dbo.HairTexture ( -- Dragonborn multiple descriptions of barbs framing the face
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Texture VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.HitDie;
CREATE TABLE dbo.HitDie ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	HitDie INT NOT NULL
);
DROP TABLE IF EXISTS dbo.ImmunityOrResistance;
CREATE TABLE dbo.ImmunityOrResistance (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ImmunityOrResistanceTypeID INT, -- "Immunity" or "Resistance"
	ConditionID INT,
	DamageTypeID INT
);
DROP TABLE IF EXISTS dbo.ImmunityOrResistanceType;
CREATE TABLE dbo.ImmunityOrResistanceType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ImmunityOrResistanceType VARCHAR  NOT NULL-- "Immunity" or "Resistance"
);
DROP TABLE IF EXISTS dbo.IrisShape;
CREATE TABLE dbo.IrisShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Shape VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.ItemClass; -- for magical items
CREATE TABLE dbo.ItemClass ( /* Weapon, Wondrous Item, Armor */
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ItemClass VARCHAR NOT NULL
	);
DROP TABLE IF EXISTS dbo.ItemType; -- for magical items
CREATE TABLE dbo.ItemClass ( /* Shield, Jewelry, Instrument */
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ItemType VARCHAR NOT NULL
	);
DROP TABLE IF EXISTS dbo.MagicalItem;
CREATE TABLE dbo.MagicalItem (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Item VARCHAR NOT NULL,
	AttunementFlag INT NOT NULL,
	BonusStatPlus INT, 
	BonusStatTypeID INT,
	Detail VARCHAR
	ImmunityOrResistanceID INT,
	ImmunityOrResistanceTypeID INT,
	ItemClassID INT,
	ItemTypeID INT,
	RarityID INT NOT NULL,
);
DROP TABLE IF EXISTS dbo.Monster;
CREATE TABLE dbo.Monster (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Monster VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.MouthShape;
CREATE TABLE dbo.MouthShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Shape VARCHAR NOT NULL,
);
DROP TABLE IF EXISTS dbo.MovementType;
CREATE TABLE dbo.Movement (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MovementType VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Nose;
CREATE TABLE dbo.Nose (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Shape VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Pack;
CREATE TABLE dbo.Pack (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	PackType VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.PackContents;
CREATE TABLE dbo.Pack (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	PackTypeID INT NOT NULL,
	EquipmentID INT NOT NULL
);
DROP TABLE IF EXISTS dbo.ProficiencyBonus;
CREATE TABLE dbo.ProficiencyBonus (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Lvl INT NOT NULL,
	Bonus INT NOT NULL
);
DROP TABLE IF EXISTS dbo.PupilShape;
CREATE TABLE dbo.PupilShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Shape VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Rarity;
CREATE TABLE dbo.Rarity (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Rarity VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Reaction; 
CREATE TABLE dbo.Reaction (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Reaction VARCHAR NOT NULL, 
	Detail VARCHAR
);
DROP TABLE IF EXISTS dbo.Sense;
CREATE TABLE dbo.Sense (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Sense VARCHAR NOT NULL,
	Detail VARCHAR NOT NULL,
	RangeID INT NOT NULL
);
DROP TABLE IF EXISTS dbo.Sizes;
CREATE TABLE dbo.Sizes (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Sizes VARCHAR NOT NULL,
	HeightOrLength VARCHAR NOT NULL,
	AvgWeight VARCHAR,
	HitDiceID INT
);
DROP TABLE IF EXISTS dbo.Skill;
CREATE TABLE dbo.Skill (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Skill VARCHAR NOT NULL,
	ModifierStatTypeID INT
);
DROP TABLE IF EXISTS dbo.SkinTexture;
CREATE TABLE dbo.SkinTexture (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Texture VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Spell;
CREATE TABLE dbo.Spell (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Spell VARCHAR NOT NULL,
	Lvl INT
);
DROP TABLE IF EXISTS dbo.StatType;
CREATE TABLE dbo.StatType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	StatType VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Tint;
CREATE TABLE dbo.Tint (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Tint VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.Tool;
CREATE TABLE dbo.Tool (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Tool VARCHAR NOT NULL,
);
DROP TABLE IF EXISTS dbo.Trait;
CREATE TABLE dbo.Trait (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Trait VARCHAR NOT NULL,
	TraitTypeID INT NOT NULL
);
DROP TABLE IF EXISTS dbo.TraitType;
CREATE TABLE dbo.TraitType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TraitType VARCHAR NOT NULL,
);
DROP TABLE IF EXISTS dbo.Weapon;
CREATE TABLE dbo.Weapon (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Weapon VARCHAR NOT NULL,
	WeaponClassID INT,
	Damage VARCHAR NOT NULL,
	DamageTypeID INT NOT NULL,
	Properties VARCHAR,
	RangeID INT,
	RarityID INT NOT NULL,
	AttunementFlag INT NOT NULL
);
DROP TABLE IF EXISTS dbo.WeaponClass; -- simple weapon, melee weapon
CREATE TABLE dbo.WeaponClass (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	WeaponClass VARCHAR NOT NULL
);
DROP TABLE IF EXISTS dbo.WeaponType; -- battleaxe, handaxe, warhammer
CREATE TABLE dbo.WeaponType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	WeaponType VARCHAR NOT NULL,
	WeaponClassID INT
);
DROP TABLE IF EXISTS Races.AbilityScoreImprovement;  -- Races sometimes have an ability score improvement
CREATE TABLE Races.AbilityScoreImprovement (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	SkillTypeID INT NOT NULL,
	Improvement INT NOT NULL
);
DROP TABLE IF EXISTS Races.Actions;  
CREATE TABLE Races.Actions (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	ActionTypeID INT NOT NULL,
	AttackID INT
);
DROP TABLE IF EXISTS Races.AdvantageDisAdvantage -- ability check, saving throw, attack roll
CREATE TABLE Races.AdvantageDisAdvantage (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	AdvantageDisAdvantageID INT NOT NULL,
	SkillTypeID INT,
	AttackID INT,
	AdvantageFlag INT,
	DisadvantageFlag INT
);
DROP TABLE IF EXISTS Races.ArmorProficiency;
CREATE TABLE Races.ArmorProficiency ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ArmorTypeID INT NOT NULL,
	RaceID INT NOT NULL
);

DROP TABLE IF EXISTS Races.Dialect;
CREATE TABLE  Races.Dialect (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL, 
	DialectID INT NOT NULL
);
DROP TABLE IF EXISTS Races.DraconicAncestry;
CREATE TABLE Races.DraconicAncestry (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TintID INT NOT NULL,
	DamageTypeID INT NOT NULL,
	AreaOfAttackID INT NOT NULL,
	SaveStatTypeID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Ear;
CREATE TABLE Races.Ear (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	EarID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Equipment;
CREATE TABLE Races.Equipment (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	EquipmentID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Eye;
CREATE TABLE Races.Eye (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	EyeID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Eyebrow;
CREATE TABLE Races.Eyebrow (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	EyebrowID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Eyelash;
CREATE TABLE Races.Eyelash (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	EyelashID INT NOT NULL
);
DROP TABLE IF EXISTS Races.FaceShape;
CREATE TABLE Races.FaceShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	FaceShapeID INT NOT NULL
);
DROP TABLE IF EXISTS Races.HairColor;
CREATE TABLE Races.HairColor (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	TintID INT NOT NULL
);
DROP TABLE IF EXISTS Races.HairStyle; 
CREATE TABLE Races.HairStyle ( -- Dragonborn add beaded barbs, tied back with a clasp, floating freely
	ID INT IDENTITY(1,1) PRIMARY KEY,
	StyleID INT NOT NULL,
	GenderID INT,
	RaceID INT  NOT NULL-- Orc, Tiefling have horns
);
DROP TABLE IF EXISTS Races.HairTexture;
CREATE TABLE Races.HairTexture ( -- Dragonborn multiple descriptions of barbs framing the face
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TextureID INT NOT NULL,
	RaceID INT NOT NULL
);
DROP TABLE IF EXISTS Races.ImmunityOrResistance;
CREATE TABLE Races.ImmunityOrResistance (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID  INT NOT NULL,
	ImmunityOrResistanceID INT NOT NULL
);
DROP TABLE IF EXISTS Races.IrisColor;
CREATE TABLE Races.IrisColor (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	TintID INT NOT NULL
);
DROP TABLE IF EXISTS Races.IrisShape;
CREATE TABLE Races.IrisShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	ShapeID INT NOT NULL
);
DROP TABLE IF EXISTS Races.MouthShape;
CREATE TABLE Races.MouthShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	ShapeID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Movement;
CREATE TABLE Races.Movement (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL, 
	MovementTypeID INT NOT NULL,
	Speed INT NOT NULL
);
DROP TABLE IF EXISTS Races.Nose;
CREATE TABLE Races.Nose (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	ShapeID INT NOT NULL,
	SizeID INT
);
DROP TABLE IF EXISTS Races.Pack;
CREATE TABLE Races.Pack (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	PackID INT NOT NULL
);
DROP TABLE IF EXISTS Races.PassiveSkill;
CREATE TABLE Races.PassiveSkill (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	SkillID INT NOT NULL
);
DROP TABLE IF EXISTS Races.PupilColor;
CREATE TABLE dbo.PupilColor (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TintID VARCHAR NOT NULL
);
DROP TABLE IF EXISTS Races.PupilShape;
CREATE TABLE Races.PupilShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	ShapeID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Race;
CREATE TABLE Races.Race (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Race VARCHAR NOT NULL,
	MinAge INT,
	MaxAge INT,
	SizeID VARCHAR NOT NULL,
	StatIncrease INT,
	StatTypeID INT,
	MovementID INT NOT NULL,
	NumToolProficiencies INT
);
DROP TABLE IF EXISTS Races.RacialName;
CREATE TABLE Races.RacialName (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	RacialName VARCHAR NOT NULL
);
DROP TABLE IF EXISTS Races.SavingThrowProficiency;
CREATE TABLE Races.SavingThrowProficiency ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	StatTypeID INT NOT NULL,
	StatPlus INT NOT NULL
);
DROP TABLE IF EXISTS Races.ScleraColor;
CREATE TABLE Sclera (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TintID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Sense;
CREATE TABLE Races.Sense (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	SenseID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Sizes;
CREATE TABLE Races.Sizes (
	RaceID INT NOT NULL,
	SizeID INT NOT NULL,
	MinHeight INT,
	MaxHeight INT,
	MinWeight INT,
	MaxWeight INT
);
DROP TABLE IF EXISTS Races.SkillProficiency;
CREATE TABLE Races.SkillProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	SkillID INT NOT NULL,
	SkillPlus INT NOT NULL
);
DROP TABLE IF EXISTS Races.SkinColor;
CREATE TABLE Races.SkinColor (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	TintID INT NOT NULL
);
DROP TABLE IF EXISTS Races.SkinTexture;
CREATE TABLE Races.SkinTexture (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	TextureID INT NOT NULL
);
DROP TABLE IF EXISTS Races.SpecialAbility;
CREATE TABLE Races.SpecialAbility (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	AbilityID INT NOT NULL
);
DROP TABLE IF EXISTS Races.Spell;
CREATE TABLE Races.Spell (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	SpellID INT NOT NULL
);
DROP TABLE IF EXISTS Races.ToolProficiency;
CREATE TABLE Races.ToolProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ToolID INT NOT NULL,
	RaceID INT NOT NULL
);
DROP TABLE IF EXISTS Races.WeaponProficiency;
CREATE TABLE Races.WeaponProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	WeaponClassID INT NOT NULL
);
DROP TABLE IF EXISTS Races.WeaponType; 
CREATE TABLE WeaponType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,	
	WeaponTypeID INT NOT NULL
);
