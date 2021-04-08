/// @desc Zombie Has Died

//spawn special zombies

if(totalKills mod 100 == 0)
{
	specialSpawnCount = 0;
	GameSpawnSpecial();
	//spawn special
	if(totalKills >= 600)
		specialSpawnCount++;
	if(totalKills >= 1100)
		specialSpawnCount++;
	if(random(1) <= 0.1) and (global.difficulty != GameDifficulty.Easy)
		specialSpawnCount++;
		
	if(specialSpawnCount > 0)
		alarm[2] = specialSpawnDelay;
}

//add new zombies
switch(totalKills + difficultyOffset)
{
	case 25:
		ds_list_add(zombieSpawnList, RabidZombie);
		break;
		
	case 50:
		ds_list_add(zombieSpawnList, LardZombie);
		break;
		
	case 75:
		ds_list_add(zombieSpawnList, GrappleZombie);
		break;
		
	case 105:
		ds_list_add(zombieSpawnList, GhostZombie);
		break;
		
	case 135:
		ds_list_add(zombieSpawnList, BursterZombie);
		break;
		
	case 165:
		ds_list_add(zombieSpawnList, TwitcherZombie);
		break;
		
	case 200:
		ds_list_add(zombieSpawnList, SpewerZombie);
		break;
		
	case 235:
		ds_list_add(zombieSpawnList, InjectorZombie);
		break;
		
	case 275:
		ds_list_add(zombieSpawnList, BladeZombie);
		break;
		
	case 315:
		ds_list_add(zombieSpawnList, StrayCreeperZombie);
		break;
		
	case 360:
		ds_list_add(zombieSpawnList, BioZombie);
		break;
}