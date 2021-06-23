///@function PlayerSetUpClearGroup(index)

function PlayerSetUpClearGroup(_index)
{
	for(var i=0; i<ds_list_size(groupUI[_index]); i++)
	{
		instance_destroy(groupUI[_index][| i]);
	}
	
	ds_list_clear(groupUI[_index]);
}

///@function PlayerSetUpCreateEnter(index)

function PlayerSetUpCreateEnter(_index)
{
	screenSelect[_index] = PlayerSetUpUpdateEnter;
	
	PlayerSetUpClearGroup(_index);
	
	var textUI = UICreateText(0, 0, "Press Confirm", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Center, RectAlign.Center);
	ds_list_add(groupUI[_index], textUI);
}

///@function PlayerSetUpCreateProfile(index)

function PlayerSetUpCreateProfile(_index)
{
	screenSelect[_index] = PlayerSetUpUpdateProfile;
	
	PlayerSetUpClearGroup(_index);
	
	var textUI = UICreateText(0, -32, "Create Profile", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Center, RectAlign.Center);
	ds_list_add(groupUI[_index], textUI);
	
	textUI = UICreateText(0, 0, "Load Profile", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Center, RectAlign.Center);
	ds_list_add(groupUI[_index], textUI);
	
	textUI = UICreateText(0, 32, "Cancel", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Center, RectAlign.Center);
	ds_list_add(groupUI[_index], textUI);
}

///@function PlayerSetUpCreateLoad(index)

function PlayerSetUpCreateLoad(_index)
{
	screenSelect[_index] = PlayerSetUpUpdateLoad;
	
	PlayerSetUpClearGroup(_index);
	
	var textUI;
	for(var i=0; i<ds_list_size(loadProfiles); i++)
	{
		textUI = UICreateText(0, 32+i*32, loadProfiles[| i], UIDrawTo.ViewPort);
		UISetView(textUI, _index);
		UISetAlign(textUI, RectAlign.Center, RectAlign.Top);
		ds_list_add(groupUI[_index], textUI);
	}
}

///@function PlayerSetUpCreateCharacter(index)

function PlayerSetUpCreateCharacter(_index)
{
	screenSelect[_index] = PlayerSetUpUpdateCharacter;
	
	PlayerSetUpClearGroup(_index);
	
	var textUI = UICreateText(32, 32, "Name", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Right, RectAlign.Top);
	ds_list_add(groupUI[_index], textUI);
	
	var textUI = UICreateText(32, 64, "Head", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Right, RectAlign.Top);
	ds_list_add(groupUI[_index], textUI);
	
	var textUI = UICreateText(32, 96, "Accessory", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Right, RectAlign.Top);
	ds_list_add(groupUI[_index], textUI);
	
	var textUI = UICreateText(32, 128, "Torso", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Right, RectAlign.Top);
	ds_list_add(groupUI[_index], textUI);
	
	var textUI = UICreateText(32, 160, "Starting Item", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Right, RectAlign.Top);
	ds_list_add(groupUI[_index], textUI);
	
	var textUI = UICreateText(32, 192, "Colours", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Right, RectAlign.Top);
	ds_list_add(groupUI[_index], textUI);
	
	var textUI = UICreateText(32, 224, "Save", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Right, RectAlign.Top);
	ds_list_add(groupUI[_index], textUI);
	
	var textUI = UICreateText(32, 256, "Ready", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Right, RectAlign.Top);
	ds_list_add(groupUI[_index], textUI);
}

///@function PlayerSetUpCreateReady(index)

function PlayerSetUpCreateReady(_index)
{
	screenSelect[_index] = PlayerSetUpUpdateReady;
	
	PlayerSetUpClearGroup(_index);
	
	var textUI = UICreateText(0, 0, "Ready", UIDrawTo.ViewPort);
	UISetView(textUI, _index);
	UISetAlign(textUI, RectAlign.Center, RectAlign.Center);
	ds_list_add(groupUI[_index], textUI);
}