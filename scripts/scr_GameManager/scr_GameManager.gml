enum GM
{
	Skirmish
}

function GameZombieDead(_id)
{
	GameManager.gameMode.totalZombies -= 1;
	GameManager.gameMode.totalKills += 1;
	_id.layer = GameManager.layerCorpse;
	ds_queue_enqueue(GameManager.bodyList, _id);
	if(ds_queue_size(GameManager.bodyList) > GameManager.maxBodyCount)
	{
		var inst = ds_queue_dequeue(GameManager.bodyList);
		inst.fadeOut = inst.fadeOutTime;
	}
	with(GameManager.gameMode)
		event_perform(ev_other, ev_user0);
}

function GameAddZombie()
{
	GameManager.gameMode.totalZombies += 1;
}

function GameRemoveZombie()
{
	GameManager.gameMode.totalZombies -= 1;
}

function GameSpawnZombie()
{
	if(GameManager.gameMode.totalZombies < GameManager.maxZombies)
	{
		var spawnPoint = GameManager.spawn[irandom(GameManager.spawnNumber - 1)];
		var zedIndex = irandom(ds_list_size(GameManager.gameMode.zombieSpawnList) - 1);
		instance_create_layer(spawnPoint.x, spawnPoint.y, GameManager.layerZombie, GameManager.gameMode.zombieSpawnList[| zedIndex]);
	}
}

function GameSpawnGameMode()
{
	var inst;
	switch(global.selectedGameMode)
	{
		case GM.Skirmish:
			inst = instance_create_layer(0, 0, GameManager.layerDefault, GameModeSkirmish);
			break;
	}
	return inst;
}

function GameSetUpPlayer(_player, _num)
{
	_player.player_inputID = global.playerInput[_num];
	WindowSetCamFollow(_num, _player);
}