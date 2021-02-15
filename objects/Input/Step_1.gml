var horizontal, vertical;

InputResetAxisPress();
	
for(var i=0; i<global.maxPlayers; i++)
{
	horizontal = gamepad_axis_value(i, gp_axislh);
	vertical = gamepad_axis_value(i, gp_axislv);
	
	if(horizontal == 0)
	{
		if(axisH[i] > 0)
			axisUpRight[i] = true;
		if(axisH[i] < 0)
			axisUpLeft[i] = true;
	}
	else if(axisH[i] == 0)
	{
		if(horizontal > 0)
			axisDownRight[i] = true;
		if(horizontal < 0)
			axisDownLeft[i] = true;
	}
	
	if(vertical == 0)
	{
		if(axisV[i] > 0)
			axisUpUp[i] = true;
		if(axisV[i] < 0)
			axisUpDown[i] = true;
	}
	else if(axisV[i] == 0)
	{
		if(vertical > 0)
			axisDownDown[i] = true;
		if(vertical < 0)
			axisDownUp[i] = true;
	}
	
	axisH[i] = horizontal;
	axisV[i] = vertical;
}