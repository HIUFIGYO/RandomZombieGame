//game state
totalKills = 0;
totalZombies = 0;

difficultyOffset = 0;
zombieSpawnList = ds_list_create();

gameOverTime = 5;
gameOverTimer = 0;

specialSpawnCount = 0;
specialSpawnDelay = irandom_range(60, 180); // frames

spawnHook = GameSpawnZombieOrder;
if(global.difficulty != GameDifficulty.Easy)
{
	spawnHook = GameSpawnZombieOrderShuffle;
	zombieTierList1 = ds_list_create();
	zombieTierList2 = ds_list_create();
	zombieTierList3 = ds_list_create();
	zombieTierList4 = ds_list_create();
	ds_list_add(zombieTierList1, RabidZombie);
	ds_list_add(zombieTierList1, LardZombie);
	ds_list_add(zombieTierList2, GrappleZombie);
	ds_list_add(zombieTierList2, GhostZombie);
	ds_list_add(zombieTierList2, BursterZombie);
	ds_list_add(zombieTierList3, TwitcherZombie);
	ds_list_add(zombieTierList3, SpewerZombie);
	ds_list_add(zombieTierList3, InjectorZombie);
	ds_list_add(zombieTierList4, BladeZombie);
	ds_list_add(zombieTierList4, StrayCreeperZombie);
	
	ds_list_shuffle(zombieTierList1);
	ds_list_shuffle(zombieTierList2);
	ds_list_shuffle(zombieTierList3);
	ds_list_shuffle(zombieTierList4);
}

ds_list_add(zombieSpawnList, LimperZombie);

switch(global.difficulty)
{
	case GameDifficulty.Hard:
		ds_list_add(zombieSpawnList, zombieTierList1[| 0]);
		ds_list_delete(zombieTierList1, 0);
		difficultyOffset = 20;
		break;
		
	case GameDifficulty.VeryHard:
		ds_list_add(zombieSpawnList, RabidZombie);
		ds_list_add(zombieSpawnList, LardZombie);
		ds_list_destroy(zombieTierList1);
		difficultyOffset = 45;
		break;
}