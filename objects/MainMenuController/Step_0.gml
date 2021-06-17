var xInput = InputGetButtonDown(0, Button.Right) - InputGetButtonDown(0, Button.Left),
	yInput = InputGetButtonDown(0, Button.Down) - InputGetButtonDown(0, Button.Up);

if(yInput != 0)
{
	var _min = 0;
	if(groupSelect == MenuGroup.Quit)
		_min = 1;
	menuSelect[groupSelect] = ClampScroll(menuSelect[groupSelect] + yInput, _min, ds_list_size(groupUI[groupSelect]) - 1);
	
	if(groupSelect > 0)
		MenuControllerScroll(groupSelect, menuSelect[groupSelect]);
}

switch(groupSelect)
{
	case MenuGroup.None:
		UITextSet(groupUI[MenuGroup.None][| 0], "");
		for(var i=0; i<ds_list_size(buttons); i++)
		{
			if(buttons[| i].isSelected)
			{
				UITextSet(groupUI[MenuGroup.None][| 0], description[i]);
				break;
			}
		}
		break;
		
	case MenuGroup.Local:
		if(menuSelect[MenuGroup.Local] == 0)
			gameModeSelect = ClampScroll(gameModeSelect + xInput, 1, GM.count - 1);
		else if(menuSelect[MenuGroup.Local] == 1)
			stageSelect = ClampScroll(stageSelect + xInput, 0, GameStage.count - 1);
		else if(menuSelect[MenuGroup.Local] == 2)
			difficultySelect = ClampScroll(difficultySelect + xInput, 0, GameDifficulty.count - 1);
		break;
}

if(InputGetButtonDown(0, Button.Confirm))
{
	switch(groupSelect)
	{		
		case MenuGroup.Local:
			switch(menuSelect[groupSelect])
			{
				case 3:
					global.selectedGameMode = gameModeSelect;
					global.selectedStage = stageSelect;
					global.difficulty = difficultySelect;
					RoomGoto(rm_PlayerSetUp);
					break;
			}
			break;
		
		case MenuGroup.Settings:
			break;
		
		case MenuGroup.Quit:
			if(menuSelect[MenuGroup.Quit] == 1)
			{
				MenuControllerSelect(MenuGroup.None, true);
			}
			else
				game_end();
			break;
	}
}

if(groupSelect != MenuGroup.None)
{
	//cancel group
	if(InputGetButtonDown(0, Button.Cancel))
	{
		MenuControllerSelect(MenuGroup.None, true);
	}
}