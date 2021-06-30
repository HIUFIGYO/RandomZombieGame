event_inherited();

image_angle += xSpeed;

fadeOut -= DeltaTimeSecond();
if(fadeOut <= fadeOutTime)
{
	image_alpha = fadeOut / fadeOutTime;
	if(fadeOut <= 0)
		instance_destroy();
}