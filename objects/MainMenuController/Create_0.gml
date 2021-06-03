buttons = ds_list_create();

ds_list_add(buttons, MenuSurviveLocal);
ds_list_add(buttons, MenuSettings);
ds_list_add(buttons, MenuQuit);

var xx = 128,
	yy = 256,
	spacing = 64;

for(var i=0; i<ds_list_size(buttons); i++)
{
	var inst = instance_create_layer(0, 0, "Instances", buttons[| i]);
	UISetRect(inst, xx, yy+i*spacing, inst.sprite_width, inst.sprite_height);
	buttons[| i] = inst;
}

menuDisplay = instance_find(MenuDisplay, 0);

groupSelect = 0;

groupUI[0] = ds_list_create();
groupUI[1] = ds_list_create();
groupUI[2] = ds_list_create();
groupUI[3] = ds_list_create();

//group 1 - description

description[0] = "Local Survival";
description[1] = "Settings";
description[2] = "Quit";

var textUI = UICreateText(0, 0, "", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
UISetPosition(textUI, 32, 32);
UISetSize(textUI, menuDisplay.size.x - 64, menuDisplay.size.y - 64);
UITextSetLineSep(textUI, 32);

ds_list_add(groupUI[0], textUI);

for(var i=0; i<ds_list_size(groupUI[0]); i++)
{
	UISetActive(groupUI[0][| i], false);
}

//group 2 - local
gameModeText[0] = "Skirmish";
gameModeText[1] = "Horde";
gameModeText[2] = "Wave";

gameModeSelect = 0;

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

//group 3 - settings

//group 4 - quit

quitSelect = false;

var textUI = UICreateText(32, 32, "Are you sure?", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
UISetSize(textUI, 300, 64);

ds_list_add(groupUI[3], textUI);

textUI = UICreateText(32, 64, "No", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
UISetSize(textUI, 300, 64);

ds_list_add(groupUI[3], textUI);

textUI = UICreateText(32, 96, "Yes", UIDrawTo.GUI);
UISetParent(menuDisplay, textUI);
UISetSize(textUI, 300, 64);

ds_list_add(groupUI[3], textUI);

for(var i=0; i<ds_list_size(groupUI[3]); i++)
{
	UISetActive(groupUI[3][| i], false);
}









