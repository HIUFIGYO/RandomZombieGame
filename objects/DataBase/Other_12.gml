///@desc Grenades

explosionMaxAmmo = 5;

//grenade
explosionImpact[GrenadeType.Grenade] = 0.5;
explosionDamage[GrenadeType.Grenade] = 12;
explosionSize[GrenadeType.Grenade] = spr_HBexplosionmedium;
explosionFuseTime[GrenadeType.Grenade] = 1.5;
explosionPierce[GrenadeType.Grenade] = 8;

//incendiary
incendiaryGroundFire = 1;
incendiaryIgniteChance = 0.5;
explosionImpact[GrenadeType.Incendiary] = 0;
explosionDamage[GrenadeType.Incendiary] = 5;
explosionSize[GrenadeType.Incendiary] = spr_HBexplosionsmall;
explosionFuseTime[GrenadeType.Incendiary] = 0;
explosionPierce[GrenadeType.Incendiary] = 3;

//mines
explosionImpact[GrenadeType.Mine] = 0;
explosionDamage[GrenadeType.Mine] = 15;
explosionSize[GrenadeType.Mine] = spr_HBexplosionlarge;
explosionFuseTime[GrenadeType.Mine] = 0.5;
explosionPierce[GrenadeType.Mine] = 5;

//BH Bomber
bomberShock = 5;
explosionImpact[GrenadeType.BHBomber] = 1;
explosionDamage[GrenadeType.BHBomber] = 5;
explosionSize[GrenadeType.BHBomber] = spr_HBexplosionsmall;
explosionFuseTime[GrenadeType.BHBomber] = 3;
explosionPierce[GrenadeType.BHBomber] = 3;

//rocket
explosionDamage[ExplosionType.Rocket] = 10;
explosionSize[ExplosionType.Rocket] = spr_HBexplosionlarge;

//bio launcher
explosionDamage[ExplosionType.Acid] = 5;
explosionSize[ExplosionType.Acid] = spr_HBexplosionmedium;
