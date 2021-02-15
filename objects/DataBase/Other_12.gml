///@desc Grenades

explosionMaxAmmo = 5;

//grenade
grenadeImpact = 1;
explosionDamage[ExplosiveType.Grenade] = 10;
explosionSize[ExplosiveType.Grenade] = spr_HBexplosionmedium;
explosionFuseTime[ExplosiveType.Grenade] = 2;

//incendiary
incendiaryGroundFire = 1;
explosionDamage[ExplosiveType.Incendiary] = 5;
explosionSize[ExplosiveType.Incendiary] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.Incendiary] = 0;

//mines
mineImpact = 0
explosionDamage[ExplosiveType.Mine] = 20;
explosionSize[ExplosiveType.Mine] = spr_HBexplosionlarge;
explosionFuseTime[ExplosiveType.Mine] = 1;

//BH Bomber
bomberImpact = 1;
bomberShock = 5;
explosionDamage[ExplosiveType.BHBomber] = 0;
explosionSize[ExplosiveType.BHBomber] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.BHBomber] = 3;