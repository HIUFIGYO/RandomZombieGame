event_inherited();

if(grenadeType == ExplosiveType.Incendiary and collision)
	instance_destroy();

if(fuseTime > 0)
{
	fuseTime -= DeltaTimeSecond();
	if(fuseTime <= 0)
		instance_destroy();
}