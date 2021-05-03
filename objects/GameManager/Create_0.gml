ready = false;

gamePaused = false;

//spawn background controller
layerBackground = layer_create(50);
instance_create_layer(0, 0, layerBackground, BackgroundController);

//zombie spawns
maxZombies = 250;
spawnNumber = instance_number(ZombieSpawner);
for(var i=0; i<spawnNumber; i++)
{
	spawn[i] = instance_find(ZombieSpawner, i);
}

//body clean up
maxBodyCount = 100;
bodyList = ds_queue_create();

//Layers
var _layers = layer_get_id_at_depth(0);
if(_layers[0] != 0)
	layerDefault = _layers[0];
else
	layerDefault = layer_create(0);
layerBloodGrinder = layer_create(-100);
layerCorpse = layer_create(-200);
layerObject = layer_create(-300);
layerZombie = layer_create(-400);
layerPlayer = layer_create(-500);
//layerUI is -600

alarm[0] = 1;

gameOver = false;

timeString = "";
timeSeconds = 0;
timeMinutes = 0;
timeHours = 0;

//timer
timeUI = UICreateText(0, 0, "00 : 00 : 00", UIDrawTo.GUI);
UITextSetAlign(timeUI, fa_right, fa_top);
UISetSize(timeUI, string_width("00 : 00 : 00"), 32);
UISetAlign(timeUI, RectAlign.Right, RectAlign.Top);
UISetPadding(timeUI, 16, 16);

//difficultyIcon
difficultyImage = UICreateImage(0, 0, spr_difficultyIcons, UIDrawTo.GUI);
UIImageSetSubImage(difficultyImage, global.difficulty);
UISetAlign(difficultyImage, RectAlign.Right, RectAlign.Top);
UISetPadding(difficultyImage, 136, 8);
UISetSize(difficultyImage, 32, 32);