/// @desc Zombie Has Died

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
		
	case 100:
		ds_list_add(zombieSpawnList, GhostZombie);
		break;
		
	case 125:
		ds_list_add(zombieSpawnList, BursterZombie);
		break;
		
	case 150:
		ds_list_add(zombieSpawnList, TwitcherZombie);
		break;
		
	case 175:
		ds_list_add(zombieSpawnList, SpewerZombie);
		break;
		
	case 200:
		ds_list_add(zombieSpawnList, InjectorZombie);
		break;
		
	case 225:
		ds_list_add(zombieSpawnList, BladeZombie);
		break;
		
	case 250:
		ds_list_add(zombieSpawnList, StrayCreeperZombie);
		break;
}