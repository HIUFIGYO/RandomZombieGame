for(var i=0; i<global.maxPlayers; i++)
{
	if(InputGetButtonDown(i, Button.Left))
	{
		if(select[i] != noone and select[i].UILeft != noone)
			select[i] = select[i].UILeft;
	}
	
	if(InputGetButtonDown(i, Button.Right))
	{
		if(select[i] != noone and select[i].UIRight != noone)
			select[i] = select[i].UIRight;
	}
	
	if(InputGetButtonDown(i, Button.Interact))
	{
		if(select[i] != noone and select[i].UIUp != noone)
			select[i] = select[i].UIUp;
	}
	
	if(InputGetButtonDown(i, Button.Crouch))
	{
		if(select[i] != noone and select[i].UIDown != noone)
			select[i] = select[i].UIDown;
	}
}