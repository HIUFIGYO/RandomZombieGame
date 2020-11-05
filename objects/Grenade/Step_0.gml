event_inherited();

if(fuseTime > 0)
	fuseTime -= DeltaTimeSecond();
else
{
	instance_destroy();
}