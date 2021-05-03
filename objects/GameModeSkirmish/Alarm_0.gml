/// @description Spawn Zombie.

alarm[0] = maxSpawnRate - (global.playerAmount * 60);

if(GameManager.gamePaused)
{
	alarm[0] = 1;
	return;
}

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