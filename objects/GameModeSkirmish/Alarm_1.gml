/// @description Increase Spawn Rate.
if (maxSpawnRate != global.playerAmount*  60 + 1)
{
	MessageAddAll("The horde becomes more aggressive...", MessageFilter.SpecialZombie)
	maxSpawnRate = max(global.playerAmount * 60 + 1, maxSpawnRate * 0.8);
	alarm[1] = 21600; //6 minutes
}