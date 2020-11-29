if(!Debugger.isDebugging or drawTo == UIDrawTo.GUI) exit;

draw_set_color(Debugger.color);

if(drawTo == UIDrawTo.Room)
{
	draw_rectangle(x, y, x + width, y+height, true);
}
else if(drawTo == UIDrawTo.ViewPort)
{
	if(view_current == drawView)
	{
		var _x = camera_get_view_x(Window.camera[drawView]) + x;
		var _y = camera_get_view_y(Window.camera[drawView]) + y;
		draw_rectangle(_x, _y, _x+width, _y+height, true);
	}
}
else
{
	if(view_current == drawView)
		draw_rectangle(x, y, x + width, y+height, true);
}