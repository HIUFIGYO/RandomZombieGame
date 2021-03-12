PlayerInitStats();
PlayerInitBuffs();
InitDebuffs();
PlayerInitWeapons();
PlayerInitGear();
PlayerInitRevive();
PlayerInitPhysics();
PlayerInitControl();
PlayerInitSprites();
PlayerInitColor();

GiveWeapon(id, Weapon.Pistol, 1);

if(global.difficulty == GameDifficulty.Easy)
	GiveMedical(id, HealingType.Medicine);