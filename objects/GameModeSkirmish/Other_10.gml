/// @desc Zombie Has Died

//add new zombies
switch(totalKills)
{
	case 10:
		ds_list_add(zombieSpawnList, RabidZombie);
		break;
		
	case 20:
		ds_list_add(zombieSpawnList, LardZombie);
		break;
		
	case 30:
		ds_list_add(zombieSpawnList, GrappleZombie);
		break;
		
	case 40:
		ds_list_add(zombieSpawnList, GhostZombie);
		break;
		
	case 50:
		ds_list_add(zombieSpawnList, SpewerZombie);
		break;
}