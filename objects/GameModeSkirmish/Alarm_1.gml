/// @description Increase Spawn Rate.

if(GamePaused())
{
	alarm[1] = 1;
	return;
}

if (maxSpawnRate != global.playerAmount * 60 + 1)
{
	MessageAddAll("The horde becomes more aggressive...", MessageFilter.SpecialZombie)
	maxSpawnRate = max(global.playerAmount * 60 + 1, maxSpawnRate * 0.9);
	alarm[1] = 21600; //6 minutes
}