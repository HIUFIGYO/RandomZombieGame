///@function MenuControllerSelect(select, enable)

function MenuControllerSelect(_select, _enable)
{
	UIController.select[0] = noone;
	
	for(var i=0; i<ds_list_size(MainMenuController.groupUI[MainMenuController.groupSelect]); i++)
	{
		UISetActive(MainMenuController.groupUI[MainMenuController.groupSelect][| i], false);
	}
	
	if(_enable)
	{
		//UIController.select[0] = MainMenuController.buttons[| MainMenuController.groupSelect];
	}
	
	MainMenuController.groupSelect = _select;
	
	for(var i=0; i<ds_list_size(MainMenuController.groupUI[MainMenuController.groupSelect]); i++)
	{
		UISetActive(MainMenuController.groupUI[MainMenuController.groupSelect][| i], true);
	}
	
	if(_select != 0)
	{
		//UIController.select[0] = MainMenuController.groupUI[_select][| 0];
	}
	
	MenuControllerEnableButtons(_enable);
}

///@function MenuControllerEnableButtons(enable)

function MenuControllerEnableButtons(_enable)
{
	for(var i=0; i<ds_list_size(MainMenuController.buttons); i++)
	{
		MainMenuController.buttons[| i].enabled = _enable;
	}
}