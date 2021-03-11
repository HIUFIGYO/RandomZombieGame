if(!other.isDead and xSpeed != 0)
{
	xSpeed = 0;
	if(grenadeType == GrenadeType.Mine and fuseTime == 0)
		fuseTime = DataBase.explosionFuseTime[GrenadeType.Mine];
	if(grenadeType == GrenadeType.Incendiary)
		instance_destroy();
	
	DamageZombie(playerID, other, DataBase.explosionImpact[grenadeType]);
	GameSprayBlood(GameGetBloodAmount() , other.x, other.y, false, other.image_xscale);
}