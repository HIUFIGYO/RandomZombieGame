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
	case 20:
		ds_list_add(zombieSpawnList, RabidZombie);
		break;
		
	case 45:
		ds_list_add(zombieSpawnList, LardZombie);
		break;
		
	case 75:
		ds_list_add(zombieSpawnList, GrappleZombie);
		break;
		
	case 110:
		ds_list_add(zombieSpawnList, GhostZombie);
		break;
		
	case 150:
		ds_list_add(zombieSpawnList, BursterZombie);
		break;
		
	case 195:
		ds_list_add(zombieSpawnList, TwitcherZombie);
		break;
		
	case 245:
		ds_list_add(zombieSpawnList, SpewerZombie);
		break;
		
	case 300:
		ds_list_add(zombieSpawnList, InjectorZombie);
		break;
		
	case 360:
		ds_list_add(zombieSpawnList, BladeZombie);
		break;
		
	case 425:
		ds_list_add(zombieSpawnList, StrayCreeperZombie);
		break;
		
	case 495:
		ds_list_add(zombieSpawnList, BioZombie);
		break;
}