if(!other.isDead and xSpeed != 0)
{
	xSpeed = 0;
	if(grenadeType == ExplosiveType.Mine and fuseTime == 0)
		fuseTime = DataBase.explosionFuseTime[ExplosiveType.Mine];
	if(grenadeType == ExplosiveType.Incendiary)
		instance_destroy();
	
	DamageZombie(playerID, other, DataBase.explosionImpact[grenadeType]);
	GameSprayBlood(GameGetBloodAmount() , other.x, other.y, false, other.image_xscale);
}