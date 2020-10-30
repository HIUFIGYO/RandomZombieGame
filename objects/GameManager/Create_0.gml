//zombie spawns
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
layerCorpse = layer_create(-100);
layerObject = layer_create(-200);
layerZombie = layer_create(-300);
layerPlayer = layer_create(-400);
layerUI     = layer_create(-500);

//spawn nessisary objects
gameMode = GameSpawnGameMode();
var count = instance_number(PlayerSpawner);
var pos, inst_player;
for(i=0; i<count; i++)
{
	if(i > global.playerAmount)
		break;
	pos = instance_find(PlayerSpawner, i);
	inst_player = instance_create_layer(pos.x, pos.y, layerPlayer, Player);
	GameSetUpPlayer(inst_player, i);
}