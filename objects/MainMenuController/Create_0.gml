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

defaultColor = c_white;
selectColor = c_yellow;

screenSelect = MenuControllerUpdateMain;

menuDisplay = instance_find(MenuDisplay, 0);

selection = 0;
groupUI = ds_list_create();

//description

description[0] = "Local Survival";
description[1] = "Settings";
description[2] = "Quit";

//local
gameModeSelect = 1;
stageSelect = 0;
difficultySelect = 0;

gameModeText[0] = "Skirmish";
gameModeText[1] = "Horde";
gameModeText[2] = "Wave";

stageText[0] = "City";
stageText[1] = "Bridge";
stageText[2] = "Pit";
stageText[3] = "Industry";
stageText[4] = "Lab";

difficultyText[0] = "Outbreak";
difficultyText[1] = "Epidemic";
difficultyText[2] = "Pandemic";
difficultyText[3] = "Apocalypse";

//settings

//quit

MenuControllerCreateMain();