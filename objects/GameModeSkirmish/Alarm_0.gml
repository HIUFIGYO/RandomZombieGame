/// @description Spawn Zombie.

alarm[0] = maxSpawnRate - (global.playerAmount * 60);
if(totalZombies < totalKills + additionalZombies)
{
	GameSpawnZombie();
}