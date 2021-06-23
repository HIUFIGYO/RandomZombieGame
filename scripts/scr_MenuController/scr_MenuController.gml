enum MenuGroup
{
	None,
	Local,
	Online,
	Records,
	Statistics,
	Journal,
	Settings,
	Quit,
	count
}

///@function MenuControllerEnableButtons(enable)

function MenuControllerEnableButtons(_enable)
{
	for(var i=0; i<ds_list_size(buttons); i++)
	{
		buttons[| i].enabled = _enable;
	}
}

///@function MenuControllerHighlight()

function MenuControllerHighlight()
{

	for(var i=0; i<ds_list_size(groupUI); i++)
	{
		var _color = defaultColor;
		if(i == selection)
			_color = selectColor;
		UISetColor(groupUI[| i], _color);
	}
}

///@function MenuControllerUpdateMain(input)

function MenuControllerUpdateMain(_input)
{
	var _str = "";
	for(var i=0; i<ds_list_size(buttons); i++)
	{
		if(buttons[| i].isSelected)
		{
			_str = description[i];
			break;
		}
	}
	
	UITextSet(groupUI[| 0], _str);
}

///@function MenuControllerUpdateLocal(input)

function MenuControllerUpdateLocal(_input)
{
	selection = ClampScroll(selection + _input.y, 0, 3);
	
	MenuControllerHighlight();
	
	if(selection == 0)
		gameModeSelect = ClampScroll(gameModeSelect + _input.x, 1, GM.count - 1);
	else if(selection == 1)
		stageSelect = ClampScroll(stageSelect + _input.x, 0, GameStage.count - 1);
	else if(selection == 2)
		difficultySelect = ClampScroll(difficultySelect + _input.x, 0, GameDifficulty.count - 1);
		
	if(InputGetButtonDown(0, Button.Confirm))
	{
		global.selectedGameMode = gameModeSelect;
		global.selectedStage = stageSelect;
		global.difficulty = difficultySelect;
		global.playerAmount = 4;
		RoomGoto(rm_PlayerSetUp);
	}
	else if(InputGetButtonDown(0, Button.Cancel))
	{
		MenuControllerCreateMain();
	}
}

///@function MenuControllerUpdateQuit(input)

function MenuControllerUpdateQuit(_input)
{
	selection = ClampScroll(selection + _input.y, 1, 2);
	
	MenuControllerHighlight();
	
	if(InputGetButtonDown(0, Button.Confirm))
	{
		if(selection == 1)
		{
			MenuControllerCreateMain();
		}
		else
			game_end();
	}
	else if(InputGetButtonDown(0, Button.Cancel))
	{
		MenuControllerCreateMain();
	}
}