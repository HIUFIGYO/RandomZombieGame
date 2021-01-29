//spawn background controller
layerBackground = layer_create(50);
instance_create_layer(0, 0, layerBackground, BackgroundController);

//zombie spawns
maxZombies = 1000;
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

alarm[0] = 1;