///@desc Grenades

explosionMaxAmmo = 5;

//grenade
explosionImpact[ExplosiveType.Grenade] = 0.5;
explosionDamage[ExplosiveType.Grenade] = 12;
explosionSize[ExplosiveType.Grenade] = spr_HBexplosionmedium;
explosionFuseTime[ExplosiveType.Grenade] = 1.5;
explosionPierce[ExplosiveType.Grenade] = 8;

//incendiary
incendiaryGroundFire = 1;
incendiaryIgniteChance = 0.5;
explosionImpact[ExplosiveType.Incendiary] = 0;
explosionDamage[ExplosiveType.Incendiary] = 5;
explosionSize[ExplosiveType.Incendiary] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.Incendiary] = 0;
explosionPierce[ExplosiveType.Incendiary] = 3;

//mines
explosionImpact[ExplosiveType.Mine] = 0;
explosionDamage[ExplosiveType.Mine] = 15;
explosionSize[ExplosiveType.Mine] = spr_HBexplosionlarge;
explosionFuseTime[ExplosiveType.Mine] = 0.5;
explosionPierce[ExplosiveType.Mine] = 5;

//BH Bomber
bomberShock = 5;
explosionImpact[ExplosiveType.BHBomber] = 1;
explosionDamage[ExplosiveType.BHBomber] = 5;
explosionSize[ExplosiveType.BHBomber] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.BHBomber] = 3;
explosionPierce[ExplosiveType.BHBomber] = 3;
