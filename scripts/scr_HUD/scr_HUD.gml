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