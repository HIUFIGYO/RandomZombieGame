///@desc Spawn Special zombies

specialSpawnCount--;
GameSpawnSpecial();

if(specialSpawnCount > 0)
	alarm[0] = specialSpawnDelay;