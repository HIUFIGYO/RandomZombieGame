///@desc Spawn Special zombies

GameSpawnSpecial();

if(specialSpawnCount > 0)
{
	specialSpawnCount--;
	alarm[0] = specialSpawnDelay;
}