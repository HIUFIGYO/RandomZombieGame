///@function HUDCreateShop(playerID)

function HUDCreateShop(_playerID)
{
	var _shop = instance_create_layer(0, 0, UIController.layerUI, ShopUI);
	_shop.playerID = _playerID;
	
	var back = UICreateImage();
	_shop.background = back;
	UIImageSetSprite(back, spr_MenuBack, 0, true);
	UISetSize(back, 640, 480);
	UISetAlign(back, RectAlign.Center, RectAlign.Center);
	UISetView(back, _playerID);
	UISetDrawTo(back, UIDrawTo.ViewPort);
	
	var panel = UICreateImage();
	_shop.panel1 = panel;
	UISetParent(back, panel);
	UIImageSetSprite(panel, spr_MenuBack, 0, true);
	UISetDrawTo(panel, UIDrawTo.ViewPort);
	UISetView(panel, _playerID);
	UISetSize(panel, 200, 208);
	UISetPadding(panel, 8, 8);
}

///@function HUDCreatePlayerUI(player)

function HUDCreatePlayerUI(_player)
{
	var inst = instance_create_layer(0, 0, UIController.layerUI, PlayerUI);
	inst.playerID = _player.playerID;
	inst.player = _player;
	return inst;
}