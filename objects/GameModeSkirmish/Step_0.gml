//update UI
UITextSet(killsTotalText, "Total Kills: " + string(totalKills));
UISetSize(killsTotalText, string_width(UITextGetText(killsTotalText)), 20);

//timers

if(GamePaused())
	return;

//Spawn Zombie

if(zombieSpawnTimer > 0)
{
	zombieSpawnTimer -= DeltaTimeSecond();
	if(zombieSpawnTimer <= 0)
	{
		zombieSpawnTimer = maxSpawnRate - global.playerAmount;

		if(totalZombies < totalKills + additionalZombies)
		{
			GameSpawnZombie();
	
			if(global.difficulty == GameDifficulty.Easy)
				return;
	
			with(lastZombieSpawned)
			{
				event_perform(ev_other, ev_user2);
			}
		}
	}
}

//Increase Spawn rate

if(spawnRateIncreaseTimer > 0)
{
	spawnRateIncreaseTimer -= DeltaTimeSecond();
	if(spawnRateIncreaseTimer <= 0)
	{
		if (maxSpawnRate != global.playerAmount + 1)
		{
			MessageAddAll("The horde becomes more aggressive...", MessageFilter.SpecialZombie)
			maxSpawnRate = max(global.playerAmount + 1, maxSpawnRate * 0.8);
			spawnRateIncreaseTimer = 600; //10 minutes
		}
	}
}

//Increase max zombies

if(maxZombiesIncreaseTimer > 0)
{
	maxZombiesIncreaseTimer -= DeltaTimeSecond();
	if(maxZombiesIncreaseTimer <= 0)
	{
		MessageAddAll("The horde becomes larger...", MessageFilter.SpecialZombie)
		GameManager.maxZombies += 250;
	}
}