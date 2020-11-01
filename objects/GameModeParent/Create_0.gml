//game state
totalKills = 0;
totalZombies = 0;

zombieSpawnList = ds_list_create();
ds_list_add(zombieSpawnList, LimperZombie);