event_inherited();

if(GamePaused())
	return;

if(fade > 0)
{
	fade -= DeltaTimeSecond();
	
	if(fade <= fadeOut)
		image_alpha = fade / fadeOut;
	
	if(fade <= 0)
		instance_destroy();
}