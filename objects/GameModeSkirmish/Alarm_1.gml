/// @description Increase Spawn Rate.
if (maxSpawnRate != global.playerAmount*  60 + 1)
{
	MessageAddAll("The horde becomes more aggressive...", MessageFilter.SpecialZombie)
	maxSpawnRate = max(global.playerAmount * 60 + 1, maxSpawnRate * 0.9);
	alarm[1] =  27000; //7 minutes 30 seconds
}