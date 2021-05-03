///@desc Spawn Special zombies

if(GameManager.gamePaused)
{
	alarm[2] = 1;
	return;
}

specialSpawnCount--;
GameSpawnSpecial();

if(specialSpawnCount > 0)
	alarm[2] = specialSpawnDelay;