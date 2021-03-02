enum Weapon
{
	Knife,
	Pistol,
	Rifle,
	Shotgun,
	Knife2,
	Pistol2,
	Rifle2,
	Shotgun2,
	Knife3,
	Pistol3,
	Rifle3,
	Shotgun3,
	Flame,
	Rocket,
	Tesla,
	Acid,
	Knife4,
	Purple,
	Drainer,
	BHDarker,
	count
}

enum ExplosiveType
{
	Grenade = Weapon.count,
	Incendiary,
	Mine,
	BHBomber,
	Rocket,
	Acid,
	count
}

enum Buff
{
	Regeneration = ExplosiveType.count,
	Health,
	Resistance,
	Stamina,
	Agility,
	Reload,
	Ammo,
	Damage,
	Critical,
	Scout,
	Medic,
	Demo,
	count
}

enum HealingType
{
	Medicine = Buff.count,
	Syringe,
	MedKit,
	count
}

enum VialType
{
	Adrenaline = HealingType.count,
	Strength,
	Mimicry,
	Survivalist,
	Rapid,
	TradeOff,
	count
}

enum SupportType
{
	Barricade = VialType.count,
	AdvBarricade,
	Turret,
	HealGenerator,
	AmmoCrate,
	HeavyCrate,
	MythicCrate,
	Armour,//moving armour in a different order may cause a little error
	count
}

enum SpecialType
{
	Bank = SupportType.count,
	Revive
}