buttons = ds_list_create();

ds_list_add(buttons, MenuSurviveLocal);
ds_list_add(buttons, MenuSettings);
ds_list_add(buttons, MenuQuit);

var xx = 128,
	yy = 256,
	spacing = 64,
	textUI;

for(var i=0; i<ds_list_size(buttons); i++)
{
	var inst = instance_create_layer(0, 0, "Instances", buttons[| i]);
	UISetRect(inst, xx, yy+i*spacing, inst.sprite_width, inst.sprite_height);
	buttons[| i] = inst;
}

defaultColor = c_white;
selectColor = c_yellow;

menuDisplay = instance_find(MenuDisplay, 0);

groupSelect = 0;

groupUI[MenuGroup.None] = ds_list_create();
groupUI[MenuGroup.Local] = ds_list_create();
groupUI[MenuGroup.Online] = ds_list_create();
groupUI[MenuGroup.Records] = ds_list_create();
groupUI[MenuGroup.Statistics] = ds_list_create();
groupUI[MenuGroup.Journal] = ds_list_create();
groupUI[MenuGroup.Settings] = ds_list_create();
groupUI[MenuGroup.Quit] = ds_list_create();

for(i=0; i<MenuGroup.count; i++)
{
	menuSelect[i] = 0;
}

//description

description[0] = "Local Survival";
description[1] = "Settings";
description[2] = "Quit";

textUI = UICreateText(0, 0, "", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
UISetPosition(textUI, 32, 32);
UISetSize(textUI, menuDisplay.size.x - 64, menuDisplay.size.y - 64);
UITextSetLineSep(textUI, 32);

ds_list_add(groupUI[MenuGroup.None], textUI);

//local
gameModeText[0] = "Skirmish";
gameModeText[1] = "Horde";
gameModeText[2] = "Wave";

gameModeSelect = 1;

stageText[0] = "City";
stageText[1] = "Bridge";
stageText[2] = "Pit";
stageText[3] = "Industry";
stageText[4] = "Lab";

stageSelect = 0;

difficultyText[0] = "Outbreak";
difficultyText[1] = "Epidemic";
difficultyText[2] = "Pandemic";
difficultyText[3] = "Apocalypse";

difficultySelect = 0;

textUI = UICreateText(32, 32, "GameMode: ", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
ds_list_add(groupUI[MenuGroup.Local], textUI);

textUI = UICreateText(32, 64, "Location: ", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
ds_list_add(groupUI[MenuGroup.Local], textUI);

textUI = UICreateText(32, 96, "Difficulty: ", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
ds_list_add(groupUI[MenuGroup.Local], textUI);

textUI = UICreateText(32, 32, "Confirm", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
UISetAlign(textUI, RectAlign.Left, RectAlign.Bottom);
ds_list_add(groupUI[MenuGroup.Local], textUI);

for(var i=0; i<ds_list_size(groupUI[MenuGroup.Local]); i++)
{
	UISetActive(groupUI[MenuGroup.Local][| i], false);
}

//settings

//quit

textUI = UICreateText(32, 32, "Are you sure?", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
UISetSize(textUI, 300, 64);

ds_list_add(groupUI[MenuGroup.Quit], textUI);

textUI = UICreateText(32, 64, "No", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
UISetSize(textUI, 300, 64);

ds_list_add(groupUI[MenuGroup.Quit], textUI);

textUI = UICreateText(32, 96, "Yes", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
UISetSize(textUI, 300, 64);

ds_list_add(groupUI[MenuGroup.Quit], textUI);

for(var i=0; i<ds_list_size(groupUI[MenuGroup.Quit]); i++)
{
	UISetActive(groupUI[MenuGroup.Quit][| i], false);
}






