///@function MenuControllerClearGroup()

function MenuControllerClearGroup()
{
	for(var i=0; i<ds_list_size(groupUI); i++)
		instance_destroy(groupUI[| i]);
	
	ds_list_clear(groupUI);
}

///@function MenuControllerCreateMain()

function MenuControllerCreateMain()
{	
	MenuControllerEnableButtons(true);
	
	screenSelect = MenuControllerUpdateMain;
	
	MenuControllerClearGroup();
	
	var textUI = UICreateText(0, 0, "", UIDrawTo.GUI);
	UISetParent(menuDisplay, textUI);
	UISetPosition(textUI, 32, 32);
	UISetSize(textUI, menuDisplay.size.x - 64, menuDisplay.size.y - 64);
	UITextSetLineSep(textUI, 32);

	ds_list_add(groupUI, textUI);
}

///@function MenuControllerCreateLocal()

function MenuControllerCreateLocal()
{
	screenSelect = MenuControllerUpdateLocal;
	
	MenuControllerClearGroup();
	
	var textUI = UICreateText(32, 32, "GameMode: ", UIDrawTo.GUI);
	UISetParent(menuDisplay, textUI);
	ds_list_add(groupUI, textUI);

	textUI = UICreateText(32, 64, "Location: ", UIDrawTo.GUI);
	UISetParent(menuDisplay, textUI);
	ds_list_add(groupUI, textUI);

	textUI = UICreateText(32, 96, "Difficulty: ", UIDrawTo.GUI);
	UISetParent(menuDisplay, textUI);
	ds_list_add(groupUI, textUI);

	textUI = UICreateText(32, 32, "Confirm", UIDrawTo.GUI);
	UISetParent(menuDisplay, textUI);
	UISetAlign(textUI, RectAlign.Left, RectAlign.Bottom);
	ds_list_add(groupUI, textUI);
}

///@function MenuControllerCreateQuit()

function MenuControllerCreateQuit()
{
	screenSelect = MenuControllerUpdateQuit;
	
	MenuControllerClearGroup();
	
	var textUI = UICreateText(32, 32, "Are you sure?", UIDrawTo.GUI);
	UISetParent(menuDisplay, textUI);
	UISetSize(textUI, 300, 64);

	ds_list_add(groupUI, textUI);

	textUI = UICreateText(32, 64, "No", UIDrawTo.GUI);
	UISetParent(menuDisplay, textUI);
	UISetSize(textUI, 300, 64);

	ds_list_add(groupUI, textUI);

	textUI = UICreateText(32, 96, "Yes", UIDrawTo.GUI);
	UISetParent(menuDisplay, textUI);
	UISetSize(textUI, 300, 64);

	ds_list_add(groupUI, textUI);
}