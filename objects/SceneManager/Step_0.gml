if(!isChangingRoom)
	return;

if(!window_has_focus())
	return;
	
if(fadeOut)
{
	fader += DeltaTimeSecond();
		
	if(fader >= fadeTime)
	{
		fadeOut = false;
		if(scene != noone)
			room_goto(scene);
		scene = noone;
	}
}
else
{
	fader -= DeltaTimeSecond();
	
	if(fader <= 0)
	{
		isChangingRoom = false;
	}
}