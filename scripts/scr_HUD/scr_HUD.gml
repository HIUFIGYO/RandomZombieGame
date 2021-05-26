enum EndStat
{
	TotalKills,
	PrimeKills,
	SecondKills,
	MeleeKills,
	Assists,
	DamageDealt,
	SupportDamage,
	DamageToBoss,
	DamageTaken,
	HealthHealed,
	MoneyEarned,
	MoneySpent,
	count
}

///@function HUDCreateShop(playerID)

function HUDCreateShop(_playerID)
{
	var _shop = instance_create_layer(0, 0, UIController.layerUI, ShopUI);
	_shop.player = _playerID;
	ShopBuildSellList(_shop);
	ShopBuildSpecialList(_shop);
	ShopSetDescription(_shop);
}

///@function HUDCloseShop(playerID)

function HUDCloseShop(_playerID)
{
	with(ShopUI)
	{
		if(_playerID == player)
		{
			player.canMove = true;
			player.isInMenu = false;
			instance_destroy();
		}
	}
}

///@function HUDCloseAllShops()

function HUDCloseAllShops()
{
	with(ShopUI)
	{
		player.canMove = true;
		player.isInMenu = false;
		instance_destroy();
	}
}

///@function HUDCreatePlayerUI(player)

function HUDCreatePlayerUI(_player)
{
	var inst = instance_create_layer(0, 0, UIController.layerUI, PlayerUI);
	inst.playerID = _player.playerID;
	inst.player = _player;
	return inst;
}

///@function HUDCreateMessageController(player)

function HUDCreateMessageController(_player)
{
	var inst = instance_create_layer(0, 0, UIController.layerUI, MessageController);
	inst.playerID = _player.playerID;
	inst.player = _player;
	return inst;
}

///@function DrawViewBorder()

function DrawViewBorder()
{
	if(view_current != playerID)
		return;
	
	var xx = camera_get_view_x(Window.camera[playerID]),
		yy = camera_get_view_y(Window.camera[playerID]),
		w = xx + camera_get_view_width(Window.camera[playerID]),
		h = yy + camera_get_view_height(Window.camera[playerID]);
	
	draw_set_color(c_black);
	draw_rectangle(xx+1, yy, w-1, h-1, true);
}

///@function EndStatAdd(player, endStat, value)

function EndStatAdd(_player, _endStat, _value)
{
	var inst = instance_find(EndGameResultsUI, 0);
	if(inst and !inst.gameOver)
	{
		inst.data[# _player, _endStat] += _value;
	}
}

///@function EndGameTrigger()

function EndGameTrigger()
{
	var inst = instance_find(EndGameResultsUI, 0);
	if(inst)
	{
		if(inst.gameOver)
			return;
		inst.gameOver = true;
		inst.dataHighest = ds_grid_create(global.playerAmount, EndStat.count);
		EndGameCalculateHighestScores(inst);
		inst.totalKills = GameManager.gameMode.totalKills;
		inst.timeSurvived = GameManager.timeString;
		
		var xx, yy;
		for(xx=0; xx<ds_grid_width(inst.data); xx++)
		{
			for(yy=0; yy<ds_grid_height(inst.data); yy++)
			{
				inst.data[# xx, yy] = round(inst.data[# xx, yy]);
			}
		}
	}
}

///@function EndGameCalculateHighestScores(inst)

function EndGameCalculateHighestScores(inst)
{
	var i, playerIndex;
	for(i=0; i<EndStat.count; i++)
	{
		var highest = 0;
		for(playerIndex=0; playerIndex<global.playerAmount; playerIndex++)
		{
			if(inst.data[# playerIndex, i] > highest)
				highest = inst.data[# playerIndex, i];
		}
		
		for(playerIndex=0; playerIndex<global.playerAmount; playerIndex++)
		{
			if(inst.data[# playerIndex, i] == 0)
			{
				inst.dataHighest[# playerIndex, i] = false;
				continue;
			}
				
			if(inst.data[# playerIndex, i] == highest)
				inst.dataHighest[# playerIndex, i] = true;
			else
				inst.dataHighest[# playerIndex, i] = false;
		}
	}
}

///@function EndGameSetResult(result)

function EndGameSetResult(_result)
{
	var inst = instance_find(EndGameResultsUI, 0);
	if(inst)
	{
		inst.resultIndex = _result;
	}
}