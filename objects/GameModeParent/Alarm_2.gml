///@desc Spawn Special zombies

specialSpawnCount--;
GameSpawnSpecial();

if(specialSpawnCount > 0)
	alarm[2] = specialSpawnDelay;