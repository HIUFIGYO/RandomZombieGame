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

///@function MenuControllerSelect(select, enable)

function MenuControllerSelect(_select, _enable)
{
	with(MainMenuController)
	{
		for(var i=0; i<ds_list_size(groupUI[groupSelect]); i++)
		{
			UISetActive(groupUI[groupSelect][| i], false);
		}
	
		groupSelect = _select;
	
		for(var i=0; i<ds_list_size(groupUI[groupSelect]); i++)
		{
			UISetActive(groupUI[groupSelect][| i], true);
		}
	
		MenuControllerEnableButtons(_enable);
	
		menuSelect[_select] = 0;
		
		if(_select == MenuGroup.Quit)
			menuSelect[_select] = 1;
	}
}

///@function MenuControllerEnableButtons(enable)

function MenuControllerEnableButtons(_enable)
{
	for(var i=0; i<ds_list_size(MainMenuController.buttons); i++)
	{
		MainMenuController.buttons[| i].enabled = _enable;
	}
}

///@function MenuControllerScroll(group, select)

function MenuControllerScroll(_group, _select)
{
	with(MainMenuController)
	{
		for(var i=0; i<ds_list_size(groupUI[_group]); i++)
		{
			var _color = defaultColor;
			if(i == _select)
				_color = selectColor;
			UISetColor(groupUI[_group][| i], _color);
		}
	}
}