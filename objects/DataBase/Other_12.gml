///@desc Grenades

explosionMaxAmmo = 5;

//grenade
grenadeImpact = 1;
explosionName[ExplosiveType.Grenade] = "Grenade";
explosionDescription[ExplosiveType.Grenade] = "Damage: Impact-1 Explosion-10\nFuse Time: 2 seconds\n Explosion Size: Medium\nPrice: $650";
explosionDamage[ExplosiveType.Grenade] = 10;
explosionSize[ExplosiveType.Grenade] = spr_HBexplosionmedium;
explosionFuseTime[ExplosiveType.Grenade] = 2;
explosionPrice[ExplosiveType.Grenade] = 650;

//incendiary
incendiaryGroundFire = 1;
explosionName[ExplosiveType.Incendiary] = "Incendiary";
explosionDescription[ExplosiveType.Incendiary] = "Damage: Explosion-5 Ground Fire-1\nFuse Time: 0 seconds\n Explosion Size: Small\nPrice: $650";
explosionDamage[ExplosiveType.Incendiary] = 5;
explosionSize[ExplosiveType.Incendiary] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.Incendiary] = 0;
explosionPrice[ExplosiveType.Incendiary] = 650;

//mines
mineImpact = 0
explosionName[ExplosiveType.Mine] = "Mine";
explosionDescription[ExplosiveType.Mine] = "Damage: 20\nFuse Time: 1 second\n Explosion Size: Large\nPrice: $650";
explosionDamage[ExplosiveType.Mine] = 20;
explosionSize[ExplosiveType.Mine] = spr_HBexplosionlarge;
explosionFuseTime[ExplosiveType.Mine] = 1;
explosionPrice[ExplosiveType.Mine] = 650;

//BH Bomber
bomberImpact = 1;
bomberShock = 5;
explosionName[ExplosiveType.BHBomber] = "BH Bomber";
explosionDescription[ExplosiveType.BHBomber] = "Damage: Impact-1 Explosion-5\nFuse Time: 3 seconds\n Explosion Size: Small\nPrice: $4000";
explosionDamage[ExplosiveType.BHBomber] = 0;
explosionSize[ExplosiveType.BHBomber] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.BHBomber] = 3;
explosionPrice[ExplosiveType.BHBomber] = 4000;