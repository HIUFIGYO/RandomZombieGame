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