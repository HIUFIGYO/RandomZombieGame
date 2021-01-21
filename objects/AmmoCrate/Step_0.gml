event_inherited();

if(fade > 0)
{
	image_alpha = fade;
	fade -= DeltaTimeSecond();
	if(fade <= 0)
		instance_destroy();
}