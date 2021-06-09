if(!isActive or drawTo == UIDrawTo.GUI or !global.drawUI)
	return;

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
	draw_rectangle(_x, _y, _x + pixelSize.x, _y+pixelSize.y, false);
	if(value > 0)
	{
		draw_set_color(merge_color(color1, color2, value));
		draw_rectangle(_x, _y, _x + pixelSize.x*value, _y+pixelSize.y, false);
	}
	draw_set_alpha(1);
}
