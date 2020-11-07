var mouseX = -1, mouseY = -1;
switch(drawTo)
{
	case UIDrawTo.GUI:
		mouseX = device_mouse_x_to_gui(0);
		mouseY = device_mouse_y_to_gui(0);
		break;
	case UIDrawTo.Room:
		mouseX = mouse_x;
		mouseY = mouse_y;
		break;
	case UIDrawTo.ViewPort:
		mouseX = window_view_mouse_get_x(drawView);
		mouseY = window_view_mouse_get_y(drawView);
	case UIDrawTo.ViewPortRoom:
		if(view_current == drawView)
		{
			mouseX = mouse_x;
			mouseY = mouse_y;
		}
		break;
}

if(point_in_rectangle(mouseX, mouseY, x, y, x+width, y+height))
	isMouseOver = true;
else
	isMouseOver = false;