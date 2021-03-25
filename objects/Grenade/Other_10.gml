/// @description Set Up

image_index = grenadeType;

fuseTime = GrenadeGetFuseTime(grenadeType);

switch(grenadeType)
{
	case GrenadeType.Grenade:
		bounce = 0.65;
		break;
		
	case GrenadeType.Incendiary:
		explosionType = ExplosionType.Incendiary;
		bounce = 0;
		ySpeed *= 0.8;
		break;
		
	case GrenadeType.Mine:
		explosionType = ExplosionType.Mine;
		fuseTime = 0;
		bounce = 0;
		xSpeed *= 0.1;
		ySpeed = 0;
		break;
		
	case GrenadeType.BHBomber:
		explosionType = ExplosionType.BHBomber;
		bounce = 0.5;
		xSpeed *= 0.75;
		ySpeed *= 0.75;
		break;
}