//game state
totalKills = 0;
totalZombies = 0;
maxZombies = 1000;

//zombie spawns
spawnNumber = instance_number(ZombieSpawner);
for(var i=0; i<spawnNumber; i++)
{
	spawn[i] = instance_find(ZombieSpawner, i);
}

//body clean up
maxBodyCount = 100;
bodyList = ds_queue_create();

instance_create_layer(0, 0, "Instances", GameModeSkirmish);