/// @description Creeper Spawn died

//remove dead creeper
for(var i=0; i<creeperCount; i++)
{
	if(creeperID[i] == creeperDied)
	{
		creeperID[i] = noone;
		break;
	}
}

//check if all creepers are gone
var lostAllMinions = true;
for(i=0; i<creeperCount; i++)
{
	if(creeperID[i] != noone)
	{
		lostAllMinions = false;
		break;
	}
}

if(lostAllMinions)
{
	invincible = false;
	instance_destroy(effect);
}
