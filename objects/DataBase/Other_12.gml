///@desc Grenades

explosionMaxAmmo = 5;

//grenade
grenadeImpact = 0.5;
explosionDamage[ExplosiveType.Grenade] = 15;
explosionSize[ExplosiveType.Grenade] = spr_HBexplosionmedium;
explosionFuseTime[ExplosiveType.Grenade] = 1.5;
explosionPierce[ExplosiveType.Grenade] = 5;

//incendiary
incendiaryGroundFire = 1;
explosionDamage[ExplosiveType.Incendiary] = 5;
explosionSize[ExplosiveType.Incendiary] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.Incendiary] = 0;
explosionPierce[ExplosiveType.Incendiary] = 5;

//mines
mineImpact = 0
explosionDamage[ExplosiveType.Mine] = 15;
explosionSize[ExplosiveType.Mine] = spr_HBexplosionlarge;
explosionFuseTime[ExplosiveType.Mine] = 0.5;
explosionPierce[ExplosiveType.Mine] = 5;

//BH Bomber
bomberImpact = 1;
bomberShock = 5;
explosionDamage[ExplosiveType.BHBomber] = 0;
explosionSize[ExplosiveType.BHBomber] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.BHBomber] = 3;
explosionPierce[ExplosiveType.BHBomber] = 3;