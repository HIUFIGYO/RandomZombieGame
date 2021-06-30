if(ds_exists(zombieSpawnList, ds_type_list))
	ds_list_destroy(zombieSpawnList);
	
if(global.difficulty == GameDifficulty.Easy)
	return;

if(Debugger.startedInDebug)
	return;

if(ds_exists(zombieTierList1, ds_type_list))
	ds_list_destroy(zombieTierList1);
	
if(ds_exists(zombieTierList2, ds_type_list))
	ds_list_destroy(zombieTierList2);
	
if(ds_exists(zombieTierList3, ds_type_list))
	ds_list_destroy(zombieTierList3);
	
if(ds_exists(zombieTierList4, ds_type_list))
	ds_list_destroy(zombieTierList4);
	