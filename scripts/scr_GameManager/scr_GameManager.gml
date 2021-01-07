enum GM
{
	Debug,
	Skirmish
}

///@function GameZombieDead(id)

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
		case GM.Debug:
			inst = instance_create_layer(0, 0, GameManager.layerDefault, GameModeDebug);
			break;
		case GM.Skirmish:
			inst = instance_create_layer(0, 0, GameManager.layerDefault, GameModeSkirmish);
			break;
	}
	return inst;
}

///@function GameSetUpPlayer(player, num)

function GameSetUpPlayer(_player, _num)
{
	_player.player_inputID = global.playerInput[_num];
	_player.playerID = _num;
	_player.UI = HUDCreatePlayerUI(_player);
	WindowSetCamFollow(_num, _player);
}

///@function GameSprayBlood(amount, x, y, isAcid, flip)

function GameSprayBlood(_amount, _x, _y, _acid, _flip)
{	
	var inst, _repeatCount;
	if(_acid)
		_repeatCount = _amount;
	else
		_repeatCount = round(_amount * global.bloodAmount);
	
	repeat(_repeatCount)
	{
		inst = instance_create_layer(_x, _y, GameManager.layerCorpse, Blood);
		if(_acid)
		{
			inst.isAcid = choose(false, true);
			if(inst.isAcid)
				inst.image_blend = c_lime;
		}
		if(_flip == 0)
		{
			inst.xSpeed = -10 + irandom(20);
			inst.ySpeed = -10 - irandom(10);
		}
		else
		{
			inst.xSpeed = (10 + irandom(5)) * _flip;
			inst.ySpeed = -10 + irandom(11);
		}
	}
}

///@function GameGetBloodAmount()

function GameGetBloodAmount()
{
	return irandom_range(round(10 * global.bloodAmount), round(20 * global.bloodAmount));
}
	