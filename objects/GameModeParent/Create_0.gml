//game state
totalKills = 0;
totalZombies = 0;

difficultyOffset = 0;
zombieSpawnList = ds_list_create();

gameOverTime = 5;
gameOverTimer = 0;

ds_list_add(zombieSpawnList, LimperZombie);

switch(global.difficulty)
{
	case GameDifficulty.Hard:
		ds_list_add(zombieSpawnList, RabidZombie);
		difficultyOffset = 20;
		break;
		
	case GameDifficulty.VeryHard:
		ds_list_add(zombieSpawnList, RabidZombie);
		ds_list_add(zombieSpawnList, LardZombie);
		difficultyOffset = 40;
		break;
}