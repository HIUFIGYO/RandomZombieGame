if(other.canCollidePlayer)
{
	xSpeed = 0;
	if(grenadeType == GrenadeType.Incendiary)
		instance_destroy();
}	