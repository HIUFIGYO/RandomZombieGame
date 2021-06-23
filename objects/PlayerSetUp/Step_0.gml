if(startGame and countDown > 0)
{
	countDown -= DeltaTimeSecond();
	
	if(countDown <= 0)
	{
		countDown = 0;
		RoomGoto(rm_stage01);
	}
	return;
}

var i;

if(playerAmount < 4)
{
	for(var controllerSlot=0; controllerSlot<5; controllerSlot++)
	{
		var checkController = false;
		for(i=0; i<4; i++)
		{
			if(playerIndex[i] == controllerSlot)
			{
				checkController = true;
				break;
			}
		}
		
		if(checkController)
			continue;
		
		if(InputGetButtonDown(controllerSlot, Button.Confirm))
		{
			for(i=0; i<4; i++)
			{
				if(playerIndex[i] == noone)
				{
					playerIndex[i] = controllerSlot;
					global.playerInput[i] = controllerSlot;
					break;
				}
			}
		}
	}
}

for(i=0; i<4; i++)
{
	if(playerIndex[i] == noone)
		continue;
	
	var _input = new Vector2(
		InputGetButtonDown(global.playerInput[i], Button.Right) - InputGetButtonDown(global.playerInput[i], Button.Left),
		InputGetButtonDown(global.playerInput[i], Button.Down) - InputGetButtonDown(global.playerInput[i], Button.Up));
	
	screenSelect[i](i, _input);
}