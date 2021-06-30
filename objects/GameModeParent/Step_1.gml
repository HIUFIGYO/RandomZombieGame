///@desc Timers

if(GamePaused())
	return;

if(specialSpawnTimer > 0)
{
	specialSpawnTimer -= DeltaTimeSecond();
	if(specialSpawnTimer <= 0)
	{
		specialSpawnCount--;
		GameSpawnSpecial();

		if(specialSpawnCount > 0)
			specialSpawnTimer = specialSpawnDelay;
	}
}

if(gameOverTimer > 0)
{
	gameOverTimer -= DeltaTimeSecond();
	if(gameOverTimer <= 0)
	{
		EndGameTrigger();
	}
}