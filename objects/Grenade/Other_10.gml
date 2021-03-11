/// @description Set Up

image_index = grenadeType;

switch(grenadeType)
{
	case GrenadeType.Grenade:
		fuseTime = DataBase.explosionFuseTime[GrenadeType.Grenade];
		bounce = 0.65;
		break;
		
	case GrenadeType.Incendiary:
		fuseTime = DataBase.explosionFuseTime[GrenadeType.Incendiary];
		bounce = 0;
		ySpeed *= 0.8;
		break;
		
	case GrenadeType.Mine:
		fuseTime = 0;
		bounce = 0;
		xSpeed *= 0.1;
		ySpeed = 0;
		break;
		
	case GrenadeType.BHBomber:
		fuseTime = DataBase.explosionFuseTime[GrenadeType.BHBomber];
		bounce = 0.5;
		xSpeed *= 0.75;
		ySpeed *= 0.75;
		break;
}