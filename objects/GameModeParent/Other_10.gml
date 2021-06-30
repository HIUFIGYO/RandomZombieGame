/// @desc Zombie Has Died

//spawn special zombies

if(totalKills mod 100 == 0)
{
	specialSpawnCount = 0;
	GameSpawnSpecial();
	//spawn special
	if (totalKills >= 200) and (global.difficulty != GameDifficulty.Easy) and (random(1) <= 0.1)
		specialSpawnCount++;
	if(totalKills >= 600)
		specialSpawnCount++;
	if(totalKills >= 1100)
		specialSpawnCount++;
		
	if(specialSpawnCount > 0)
		specialSpawnTimer = specialSpawnDelay;
}

spawnHook();
