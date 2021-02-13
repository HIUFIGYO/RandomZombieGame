if(view_current != player.playerID)
	exit;

var xx = camera_get_view_x(Window.camera[player.playerID]),
	yy = camera_get_view_y(Window.camera[player.playerID]);

var viewWidth = camera_get_view_width(Window.camera[player.playerID]),
	viewHeight = camera_get_view_height(Window.camera[player.playerID]);

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

for(i=0; i<size; i++)
{
	draw_set_color(listSelect == i ? c_yellow : c_white);
	draw_text(_x, _y + i*_padding, ShopGetItemData(id, ShopKey.Name, i));
}

//name/description
w = 480;
_x = xx + viewWidth - w - 8;
_y = yy + 128;

draw_set_color(c_white);
draw_text(_x, _y, itemName);
draw_text_ext(_x, _y+48, itemDescription, 20, w);