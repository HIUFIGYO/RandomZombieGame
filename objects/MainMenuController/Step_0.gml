var yInput = InputGetButtonDown(0, Button.Down) - InputGetButtonDown(0, Button.Up);

switch(groupSelect)
{
	case 0://buttons
		UITextSet(groupUI[0][| 0], "");
		for(var i=0; i<ds_list_size(buttons); i++)
		{
			if(buttons[| i].isSelected)
			{
				UITextSet(groupUI[0][| 0], description[i]);
				break;
			}
		}
		break;
		
	case 1://local
		break;
		
	case 2://Settings
		break;
		
	case 3://quit
		if(yInput != 0)
		{
			quitSelect = !quitSelect;
			if(quitSelect)
			{
				UISetColor(groupUI[3][| 1], c_white);
				UISetColor(groupUI[3][| 2], c_red);
			}
			else
			{
				UISetColor(groupUI[3][| 1], c_red);
				UISetColor(groupUI[3][| 2], c_white);
			}
		}
		if(InputGetButtonDown(0, Button.Confirm))
		{
			if(!quitSelect)
			{
				MenuControllerSelect(0, true);
			}
			else
				game_end();
		}
		break;
}

if(groupSelect > 0)
{
	//cancel group
	if(InputGetButtonDown(0, Button.Cancel))
	{
		MenuControllerSelect(0, true);
	}
}