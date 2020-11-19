/// @desc Zombie Has Died

//add new zombies
switch(totalKills + difficultyOffset)
{
	case 20:
		ds_list_add(zombieSpawnList, RabidZombie);
		break;
		
	case 40:
		ds_list_add(zombieSpawnList, LardZombie);
		break;
		
	case 60:
		ds_list_add(zombieSpawnList, GrappleZombie);
		break;
		
	case 80:
		ds_list_add(zombieSpawnList, GhostZombie);
		break;
		
	case 100:
		ds_list_add(zombieSpawnList, BursterZombie);
		break;
		
	case 120:
		ds_list_add(zombieSpawnList, TwitcherZombie);
		break;
		
	case 140:
		ds_list_add(zombieSpawnList, SpewerZombie);
		break;
		
	case 160:
		ds_list_add(zombieSpawnList, InjectorZombie);
		break;
		
	case 180:
		ds_list_add(zombieSpawnList, BladeZombie);
		break;
}