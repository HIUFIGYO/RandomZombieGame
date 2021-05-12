/// @description Wait timer

if(waitTime > 0)
{
	waitTime -= DeltaTimeSecond();
	if(waitTime <= 0)
	{
		open = false;
		waitTime = 0;
		image_speed = -0.5;
	}
}