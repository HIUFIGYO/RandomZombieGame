if(view_current != player.playerID)
	exit;

var xx = camera_get_view_x(Window.camera[player.playerID]),
	yy = camera_get_view_y(Window.camera[player.playerID]);

var viewWidth = camera_get_view_width(Window.camera[player.playerID]),
	viewHeight = camera_get_view_height(Window.camera[player.playerID]);
	
var _str;

//background
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(xx, yy, xx+viewWidth, yy+viewHeight, false);
draw_set_alpha(1);

//tabs
var w = 0,
	_x = xx + 8,
	_y = yy + 8,
	_padding = 80;

draw_set_color(c_white);
for(var i=0; i<ShopTab.count; i++)
{
	if(ds_list_size(itemList[i]) == 0)
		continue;
	
	draw_set_color(c_white);
	draw_rectangle(_x + w, _y, _x + w + _padding, _y + 32, true);
	draw_set_color(tabSelect == i ? c_yellow : c_white);
	draw_text(_x + w, _y, tab[i]);
	
	w += _padding;
}

//item list
var size = ds_list_size(itemList[tabSelect]);

_x = xx + 8;
_y = yy + 128;
_padding = 20;

_str = "";
for(i=0; i<size; i++)
{
	if(tabSelect < ShopTab.Special)
		_str = " x " + string(ShopGetStock(itemList[tabSelect][| i]));
	draw_set_color(listSelect == i ? c_yellow : c_white);
	draw_text(_x, _y + i*_padding, ShopGetItemData(itemList[tabSelect][| i], ShopKey.Name) + _str);
}

//name/description
w = 480;
_x = xx + viewWidth - w - 8;
_y = yy + 128;

_str = "";
if(ShopGetItemID(id) == SpecialType.Revive)
	_str = global.shopID.reviveList[| listSelect].name;
draw_set_color(c_white);
draw_text(_x, _y, itemName + _str);
draw_text_ext(_x, _y+48, itemDescription, 20, w);

//price
_str = "Price: " + string(itemPrice);
_y = yy + viewHeight - 64;
if(sellPrice > 0)
	_str += " - " + string(sellPrice) + " = " + string(itemPrice - sellPrice);
	
if(tabSelect == ShopTab.Buffs)
{
	if(player.buff[0] != noone and player.buff[1] != noone)
		_str = "Please sell a buff before purchasing another.";
}

if(tabSelect != ShopTab.Sell)
	draw_text(_x, _y, _str);
else
	draw_text(_x, _y, "Sell: " + string(ShopGetSellPrice(ShopGetItemID(id))));
	
//players money
_str = "";
_x = xx + 8;
_y = yy + viewHeight - 64;

if(global.shopID.hasBank)
	_str = "Bank: $"+string(player.bankedMoney);

draw_text(_x, _y, _str + "\nCash: $"+string(player.money));






