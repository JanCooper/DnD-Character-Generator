ALTER TABLE AbilityScoreImprovement
ADD FOREIGN KEY (ClassID) REFERENCES CharacterClass(ID);

ALTER TABLE Armor
ADD FOREIGN KEY (ArmorTypeID) REFERENCES ArmorType(ID);

ALTER TABLE ArmorProficiency 
ADD FOREIGN KEY (ArmorTypeID) REFERENCES ArmorType(ID);

ALTER TABLE ArmorProficiency 
ADD FOREIGN KEY (ClassID) REFERENCES Class(ID);

ALTER TABLE ArmorProficiency 
ADD FOREIGN KEY (RaceID) REFERENCES Race(ID);

ALTER TABLE ArmorType 
ADD FOREIGN KEY (ArmorCategoryID) REFERENCES ArmorCategory(ID);

ALTER TABLE Attack 
ADD FOREIGN KEY (AttackTypeID) REFERENCES AttackType(ID);

ALTER TABLE Attack 
ADD FOREIGN KEY (DamageTypeID) REFERENCES DamageType(ID);

ALTER TABLE Attack 
ADD FOREIGN KEY (AreaOfEffectID) REFERENCES AreaOfEffect(ID);

ALTER TABLE BonusStat
ADD FOREIGN KEY (StatTypeID) REFERENCES StatType(ID);

ALTER TABLE CastingClass 
ADD FOREIGN KEY (ClassID) REFERENCES Class(ID);

ALTER TABLE CharacterAbilityModifier 
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterAbilitySavingThrow
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterAbilityScore
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterClass
ADD FOREIGN KEY (ArmorTypeProficiencyID) REFERENCES ArmorType(ID);

ALTER TABLE CharacterClass
ADD FOREIGN KEY (ProficiencyID) REFERENCES Proficiency(ID);

ALTER TABLE CharacterDescription
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterDetail
ADD FOREIGN KEY (AlignmentID) REFERENCES Alignment(ID);

ALTER TABLE CharacterDetail
ADD FOREIGN KEY (ArmorTypeID) REFERENCES ArmorType(ID);

ALTER TABLE CharacterDetail
ADD FOREIGN KEY (ClassID) REFERENCES Class(ID);

ALTER TABLE CharacterDetail
ADD FOREIGN KEY (HitDiceID) REFERENCES HitDice(ID);

ALTER TABLE CharacterDetail
ADD FOREIGN KEY (RaceID) REFERENCES Race(ID);

ALTER TABLE CharacterDialect
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterEquipment
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterImmunity
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterImmunity
ADD FOREIGN KEY (ImmunityTypeID) REFERENCES ImmunityType(ID);

ALTER TABLE CharacterPassiveAbility
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterPassiveAbility
ADD FOREIGN KEY (AbilityID) REFERENCES Ability(ID);

ALTER TABLE CharacterResistance
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterResistance
ADD FOREIGN KEY (ResistanceID) REFERENCES Resistance(ID);

ALTER TABLE CharacterSense
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterSense
ADD FOREIGN KEY (SenseID) REFERENCES Sense(ID);

ALTER TABLE CharacterSkillProficiency 
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterSkillProficiency 
ADD FOREIGN KEY (SkillID) REFERENCES Skill(ID);

ALTER TABLE CharacterSpecialAbility
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterSpecialAbility
ADD FOREIGN KEY (AbilityID) REFERENCES Ability(ID);

ALTER TABLE CharacterSpell
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterSpell
ADD FOREIGN KEY (SpellID) REFERENCES Spell(ID);

ALTER TABLE CharacterSpell
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE CharacterSpell
ADD FOREIGN KEY (ToolID) REFERENCES Tool(ID);

ALTER TABLE CharacterSpell
ADD FOREIGN KEY (ClassID) REFERENCES Class(ID);

ALTER TABLE CharacterSpell
ADD FOREIGN KEY (SpellID) REFERENCES Spell(ID);

ALTER TABLE Color
ADD FOREIGN KEY (TintID) REFERENCES Tint(ID);

ALTER TABLE DraconicAncestry
ADD FOREIGN KEY (TintID) REFERENCES Tint(ID);

ALTER TABLE DraconicAncestry
ADD FOREIGN KEY (SpellID) REFERENCES Spell(ID);

ALTER TABLE FeatureAbility
ADD FOREIGN KEY (ClassID) REFERENCES Class(ID);

ALTER TABLE HairColor
ADD FOREIGN KEY (RaceID) REFERENCES Race(ID);

ALTER TABLE HairColor
ADD FOREIGN KEY (ColorID) REFERENCES Color(ID);

ALTER TABLE HairColor
ADD FOREIGN KEY (HighlightColorID) REFERENCES Color(ID);

ALTER TABLE HairStyle
ADD FOREIGN KEY (RaceID) REFERENCES Race(ID);

ALTER TABLE HairStyle
ADD FOREIGN KEY (GenderID) REFERENCES Gender(ID);

ALTER TABLE HairTexture
ADD FOREIGN KEY (RaceID) REFERENCES Race(ID);

ALTER TABLE HitPointCalculation
ADD FOREIGN KEY (ClassID) REFERENCES Class(ID);

ALTER TABLE HitPointCalculation
ADD FOREIGN KEY (HitDiceID) REFERENCES HitDice(ID);

ALTER TABLE HitPointCalculation
ADD FOREIGN KEY (RaceID) REFERENCES Race(ID);

ALTER TABLE Inventory
ADD FOREIGN KEY (CharacterDetailID) REFERENCES CharacterDetail(ID);

ALTER TABLE IrisColor
ADD FOREIGN KEY (RaceID) REFERENCES Race(ID);

ALTER TABLE IrisColor
ADD FOREIGN KEY (ColorID) REFERENCES Color(ID);

ALTER TABLE IrisShape
ADD FOREIGN KEY (RaceID) REFERENCES Race(ID);

ALTER TABLE ItemClass
ADD FOREIGN KEY (ItemClassTypeID) REFERENCES ItemClassType(ID);

ALTER TABLE LegendaryAction
ADD FOREIGN KEY (AttackID) REFERENCES Attack(ID);

ALTER TABLE LegendaryAction
ADD FOREIGN KEY (DamageTypeID) REFERENCES DamageType(ID);

ALTER TABLE LegendaryAction
ADD FOREIGN KEY (SaveStatID) REFERENCES StatType(ID);

ALTER TABLE LegendaryAction
ADD FOREIGN KEY (MonsterID) REFERENCES Monster(ID);

ALTER TABLE MagicalItem
ADD FOREIGN KEY (BonusStatTypeID) REFERENCES StatType(ID);

ALTER TABLE MagicalItem
ADD FOREIGN KEY (ItemClassID) REFERENCES ItemClass(ID);

ALTER TABLE MagicalItem
ADD FOREIGN KEY (BonusStatTypeID) REFERENCES StatType(ID);

ALTER TABLE MagicalItem
ADD FOREIGN KEY (BonusStatTypeID) REFERENCES StatType(ID);

ALTER TABLE MagicalItem
ADD FOREIGN KEY (BonusStatTypeID) REFERENCES StatType(ID);

ALTER TABLE MagicalItem
ADD FOREIGN KEY (BonusStatTypeID) REFERENCES StatType(ID);

ALTER TABLE MagicalItem
ADD FOREIGN KEY (ImmunityTypeID) REFERENCES ImmunityType(ID);

ALTER TABLE MagicalItem
ADD FOREIGN KEY (RarityID) REFERENCES Rarity(ID);

ALTER TABLE MagicalItem
ADD FOREIGN KEY (ResistanceID) REFERENCES Resistance(ID);


ALTER TABLE MagicalItem (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Item VARCHAR NOT NULL,
	AttunementFlag INT NOT NULL,
	BonusStatPlus INT,
	BonusStatTypeID INT,
	ItemClassID INT, -- if TypeID == Armor, ArmorClassID; if TypeID == Weapon, WeaponClassID
	ImmunityID INT,
	RarityID INT NOT NULL,
	ResistanceID INT,
	SpecialEffect VARCHAR,
	ItemTypeID INT,
);
ALTER TABLE Monster (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Monster VARCHAR NOT NULL,
	MonsterClassID INT,
	AlignmentID INT,
	ArmorClassToHit INT NOT NULL,
	ChallengeLevel INT,
	Details VARCHAR,
	HitDiceID INT,
	HitPoints INT NOT NULL,
	SizeID INT,
	MonsterStatID INT,
	LairActionFlag INT
);
ALTER TABLE MonsterAction (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	NonsterID INT NOT NULL,
	MonsterAction VARCHAR NOT NULL,
	ActionTypeID INT,
	ToHitBonus INT,
	AreaOfEffectID INT,
	Damage VARCHAR,
	DamageTypeID INT,
  FOREIGN KEY (ActionTypeID) REFERENCES ActionType(ID)
);
ALTER TABLE MonsterActionType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ActionType VARCHAR NOT NULL
);
ALTER TABLE MonsterAttack (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Attack VARCHAR NOT NULL,
	Details VARCHAR,
	Damage VARCHAR
);
ALTER TABLE MonsterClass (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MonsterClass INT
);

ALTER TABLE MonsterDialect ( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MonsterID INT NOT NULL,
	DialectID INT NOT NULL
);
ALTER TABLE MonsterImmunity
ADD FOREIGN KEY (MonsterID) REFERENCES Monster(ID);

ALTER TABLE MonsterImmunity
ADD FOREIGN KEY (ImmunityTypeID) REFERENCES ImmunityType(ID);

ALTER TABLE MonsterMovement (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MonsterID INT,
	MovementTypeID INT,
	Speed INT
);
ALTER TABLE MonsterSense (
	MonsterID INT,
	SenseID INT,
	DistanceInFt INT,
	Bonus INT
);
ALTER TABLE MonsterSkill (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MonsterID INT NOT NULL,
	SkillID INT,
	Bonus INT
);
ALTER TABLE MonsterSkill (
	MonsterID INT,
	SkillID INT,
	Bonus INT
);
ALTER TABLE MonsterStat(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MonsterID INT,
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
	ToHitModifier INT,
	Wisdom INT NOT NULL,
	WisdomMod INT NOT NULL,
);
ALTER TABLE MonsterType ( -- Aberration, Beast, etc.
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MonsterType VARCHAR NOT NULL
);
ALTER TABLE MouthShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Mouth VARCHAR NOT NULL,
);
ALTER TABLE Movement (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	MonsterID INT,
	MovementTypeID VARCHAR NOT NULL,
	Speed INT NOT NULL
);
ALTER TABLE MovementType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MovementType VARCHAR NOT NULL
);
ALTER TABLE NonsterSpell (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MonsterID INT,
	SpellID INT
);
ALTER TABLE Nose (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Shape VARCHAR NOT NULL,
	SizeID INT
);
ALTER TABLE Pack (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Pack VARCHAR NOT NULL
);
ALTER TABLE Proficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CharacterDetailID INT,
	ClassID INT,
	RaceID INT, 
	ArmorClassID INT,
	WeaponClassID INT,
	ToolID INT,
	SavingThrowID INT,
	SkillID INT,
  FOREIGN KEY (ClassID) REFERENCES CharacterClass(ID)
);
ALTER TABLE ProficiencyBonus (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Lvl1 INT,
	Lvl2 INT,
	Lvl3 INT,
	Lvl4 INT,
	Lvl5 INT,
	Lvl6 INT,
	Lvl7 INT,
	Lvl8 INT,
	Lvl9 INT,
	Lvl10 INT,
	Lvl11 INT,
	Lvl12 INT,
	Lvl13 INT,
	Lvl14 INT,
	Lvl15 INT,
	Lvl16 INT,
	Lvl17 INT,
	Lvl18 INT,
	Lvl19 INT,
	Lvl20 INT
);
ALTER TABLE PupilColor (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	ColorID VARCHAR NOT NULL
);
ALTER TABLE PupilShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	Shape VARCHAR NOT NULL
);
ALTER TABLE Race (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Race VARCHAR NOT NULL,
	MinAge INT,
	MaxAge INT,
	RacialSizeID VARCHAR NOT NULL,
	StatIncrease INT,
	StatTypeID INT,
	MovementTypeID INT,
	Speed INT,
	SenseID INT,
	AdvantageID INT,
	ResistanceID INT,
	NumToolProficiencies INT,
	SpecialAbilityID INT
);
ALTER TABLE RacialBodyType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	BodyTypeID INT NOT NULL
);
ALTER TABLE RacialEar (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	EarID INT NOT NULL,
	RaceID INT NOT NULL
);
ALTER TABLE RacialFaceShape (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	FaceShapeID INT NOT NULL,
	RaceID INT NOT NULL
);
ALTER TABLE RacialHairStyle (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	StyleID INT
);
ALTER TABLE RacialHairTexture (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	TextureID INT
);
ALTER TABLE RacialMouth (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	ShapeID INT
);
ALTER TABLE RacialMovement (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	MovementTypeID INT,
	Speed INT
);
ALTER TABLE RacialSense (
	RaceID INT,
	SenseID INT,
	DistanceInFt INT,
	Bonus INT
);
ALTER TABLE RacialSize (
	RaceID INT,
	SizeID INT,
	MinHeight INT,
	MaxHeight INT,
	MinWeight INT,
	MaxWeight INT
);
ALTER TABLE RacialSkill (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT NOT NULL,
	SkillID INT,
	Bonus INT
);
ALTER TABLE RacialSkinTexture (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	TextureID INT
);
ALTER TABLE RacialSpell (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	SpellID INT,
	Lvl INT
);
ALTER TABLE Rarity (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Rarity VARCHAR NOT NULL
);
ALTER TABLE Resistance (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Resistance VARCHAR NOT NULL,
	RaceID INT,
	MonsterID INT,
);
ALTER TABLE Sclera (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	ColorID INT NOT NULL
);
ALTER TABLE Sense (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Sense VARCHAR
);
ALTER TABLE Size (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Size VARCHAR NOT NULL,
	MinHeight INT,
	MaxHeight INT,
	MinWeight INT,
	MaxWeight INT,
	HitDice VARCHAR
);
ALTER TABLE Skill (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Skill VARCHAR NOT NULL,
	ModifierStatTypeID INT
);
ALTER TABLE SkinColor (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	ColorID INT
);
ALTER TABLE SkinTexture (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Texture VARCHAR
);
ALTER TABLE SpecialAbility (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT,
	RaceID INT,
	AbilityName VARCHAR,
	AbilityDetails VARCHAR,
	AbilityLevel INT,
  FOREIGN KEY (ClassID) REFERENCES CharacterClass(ID)
);
ALTER TABLE Spell (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	SpellName VARCHAR NOT NULL,
	Details VARCHAR,
	SpellLevel INT, -- Cantrip == 0
	Duration VARCHAR,
	CastingTime VARCHAR,
	RangeID INT,
	AreaofEffectID INT,
	AttackTypeID INT,
	StatSaveID INT, 
	ConcentrationFlag INT, 
	SpellTypeID INT,
	RecoveryID INT
);
ALTER TABLE SpellDamage (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	SpellID INT NOT NULL,
	DamageOnFailedSave VARCHAR,
	DamageOnSave VARCHAR,
	SixthLvlIncrease VARCHAR,
	EleventhLvlIncrease VARCHAR,
	SixteenthLvlIncrease VARCHAR,
);
ALTER TABLE SpellRecovery (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	SpellID INT NOT NULL,
	ShortRestFlag INT,
	LongRestFlag INT
);
ALTER TABLE SpellSlot (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ClassID INT,
	RaceID INT,
	SubRaceID INT,
	Lvl INT,
	CantripsKnown INT,
	TotalSpellsKnown INT,
	FirstLvlSlots INT,
	SecondLvlSlots INT,
	ThirdLvlSlots INT,
	FourthLvlSlots INT,
	FifthLvlSlots INT,
	SixthLvlSlots INT,
	SeventhLvlSlots INT,
	EightLvlSlots INT,
	NinthLvlSlots INT,
  FOREIGN KEY (ClassID) REFERENCES CharacterClass(ID)
);
ALTER TABLE SpellType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	SpellType VARCHAR NOT NULL
);
ALTER TABLE StatType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	StatType VARCHAR NOT NULL
);
ALTER TABLE SubRace (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	RaceID INT,
	SubRace VARCHAR,
	StatIncrease INT,
	StatID INT,
	HitPointIncrease VARCHAR,
	AdditionalSenseID INT,
	AdditionalDialectID INT,
	AdditionalAdvantageID INT,
	DisadvantageID INT
);
ALTER TABLE SubRaceSpell
	ID INT IDENTITY(1,1) PRIMARY KEY,
	SubRaceID INT,
	SpellID INT, 
	Lvl INT
);
ALTER TABLE Tint (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Tint VARCHAR NOT NULL
);
ALTER TABLE Tool (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Tool VARCHAR NOT NULL,
);
ALTER TABLE Weapon (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Weapon VARCHAR NOT NULL,
	WeaponClassID INT,
	Damage VARCHAR NOT NULL,
	DamageTypeID INT,
	Properties VARCHAR,
	RangeID INT,
	RarityID INT NOT NULL,
	AttunementFlag INT NOT NULL
);
ALTER TABLE WeaponClass (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Class VARCHAR NOT NULL
);
ALTER TABLE WeaponProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ToolID INT NOT NULL,
	RaceID INT, 
	ClassID INT 
);
ALTER TABLE WeaponProficiency (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	WeaponTypeID INT NOT NULL,
	RaceID INT NOT NULL
);
ALTER TABLE WeaponType (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	WeaponType VARCHAR NOT NULL
);
