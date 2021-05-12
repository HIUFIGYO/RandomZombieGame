if(drawTo == UIDrawTo.GUI or !global.drawUI) { exit; }

var _draw = false, _x = 0, _y = 0;

if(drawTo == UIDrawTo.Room)
{
	_x = x;
	_y = y;
	_draw = true;
}
else if(drawTo == UIDrawTo.ViewPort)
{
	if(view_current == drawView)
	{
		_x = x + camera_get_view_x(Window.camera[drawView]);
		_y = y + camera_get_view_y(Window.camera[drawView]);
		_draw = true;
	}
}
else if(view_current == drawView)
{
	_x = x;
	_y = y;
	_draw = true;
}

if(_draw)
{
	draw_set_alpha(alpha);
	draw_set_color(color);
	draw_rectangle(_x, _y, _x + width, _y+height, false);
	if(value > 0)
	{
		draw_set_color(merge_color(color1, color2, value));
		draw_rectangle(_x, _y, _x + width*value, _y+height, false);
	}
	draw_set_alpha(1);
}
