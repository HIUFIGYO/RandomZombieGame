/// @description Set Up

image_index = grenadeType;

switch(grenadeType)
{
	case ExplosiveType.Grenade:
		fuseTime = DataBase.explosionFuseTime[ExplosiveType.Grenade];
		bounce = 0.65;
		break;
		
	case ExplosiveType.Incendiary:
		fuseTime = DataBase.explosionFuseTime[ExplosiveType.Incendiary];
		bounce = 0;
		ySpeed *= 0.8;
		break;
		
	case ExplosiveType.Mine:
		fuseTime = 0;
		bounce = 0;
		xSpeed *= 0.1;
		ySpeed = 0;
		break;
		
	case ExplosiveType.BHBomber:
		fuseTime = DataBase.explosionFuseTime[ExplosiveType.BHBomber];
		bounce = 0.5;
		xSpeed *= 0.75;
		ySpeed *= 0.75;
		break;
}