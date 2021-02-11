if(isChangingRoom)
{
	if(window_has_focus())
	{
		isChangingRoom = false;
		if(scene != noone)
			room_goto(scene);
		scene = noone;
	}
}