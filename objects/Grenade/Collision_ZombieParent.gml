if(!other.isDead)
{
	xSpeed = 0;
	if(grenadeType == ExplosiveType.Mine and fuseTime == 0)
		fuseTime = 1/3;
}
	
if(grenadeType == ExplosiveType.Incendiary)
	instance_destroy();