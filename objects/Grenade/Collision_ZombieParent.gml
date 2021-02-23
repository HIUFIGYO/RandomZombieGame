if(!other.isDead)
{
	xSpeed = 0;
	if(grenadeType == ExplosiveType.Mine and fuseTime == 0)
		fuseTime = DataBase.explosionFuseTime[ExplosiveType.Mine];
}
	
if(!other.isDead) and (grenadeType == ExplosiveType.Incendiary)
	instance_destroy();