event_inherited();

if(GamePaused())
	return;

if(grenadeType == GrenadeType.Incendiary and collision)
	instance_destroy();

if(fuseTime > 0)
{
	fuseTime -= DeltaTimeSecond();
	if(fuseTime <= 0)
		instance_destroy();
}