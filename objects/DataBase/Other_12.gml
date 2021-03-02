///@desc Grenades

explosionMaxAmmo = 5;

//grenade
explosionImpact[ExplosiveType.Grenade] = 0.5;
explosionDamage[ExplosiveType.Grenade] = 12;
explosionSize[ExplosiveType.Grenade] = spr_HBexplosionmedium;
explosionFuseTime[ExplosiveType.Grenade] = 1.5;
explosionPierce[ExplosiveType.Grenade] = 10;

//incendiary
incendiaryGroundFire = 1;
incendiaryIgniteChance = 0.5;
explosionImpact[ExplosiveType.Incendiary] = 0;
explosionDamage[ExplosiveType.Incendiary] = 5;
explosionSize[ExplosiveType.Incendiary] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.Incendiary] = 0;
explosionPierce[ExplosiveType.Incendiary] = 5;

//mines
explosionImpact[ExplosiveType.Mine] = 0;
explosionDamage[ExplosiveType.Mine] = 15;
explosionSize[ExplosiveType.Mine] = spr_HBexplosionlarge;
explosionFuseTime[ExplosiveType.Mine] = 0.5;
explosionPierce[ExplosiveType.Mine] = 8;

//BH Bomber
bomberShock = 5;
explosionImpact[ExplosiveType.BHBomber] = 1;
explosionDamage[ExplosiveType.BHBomber] = 0;
explosionSize[ExplosiveType.BHBomber] = spr_HBexplosionsmall;
explosionFuseTime[ExplosiveType.BHBomber] = 3;
explosionPierce[ExplosiveType.BHBomber] = 3;

//Rocket Launcher Explosion
explosionImpact[ExplosiveType.Rocket] = 0;
explosionDamage[ExplosiveType.Rocket] = 10;
explosionSize[ExplosiveType.Rocket] = spr_HBexplosionlarge;
explosionFuseTime[ExplosiveType.Rocket] = 0;
explosionPierce[ExplosiveType.Rocket] = 8;

//Bio Launcher Explosion
explosionImpact[ExplosiveType.Acid] = 0;
explosionDamage[ExplosiveType.Acid] = 5;
explosionSize[ExplosiveType.Acid] = spr_HBexplosionmedium;
explosionFuseTime[ExplosiveType.Acid] = 0;
explosionPierce[ExplosiveType.Acid] = 5;