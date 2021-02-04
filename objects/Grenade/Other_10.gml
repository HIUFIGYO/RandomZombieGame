/// @description Set Up

image_index = grenadeType;

switch(grenadeType)
{
	case ExplosiveType.Grenade:
		fuseTime = 2;
		bounce = 0.75;
		break;
		
	case ExplosiveType.Incendiary:
		fuseTime = 0;
		bounce = 0;
		ySpeed *= 0.5;
		break;
		
	case ExplosiveType.Mine:
		fuseTime = 0;
		bounce = 0;
		xSpeed *= 0.1;
		ySpeed = 0;
		break;
		
	case ExplosiveType.BHBomber:
		fuseTime = 3;
		bounce = 0.5;
		xSpeed *= 0.75;
		ySpeed *= 0.75;
		break;
}