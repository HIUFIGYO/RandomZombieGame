if(view_current != playerID or ds_list_empty(messageList))
	exit;
	
	
var camX = camera_get_view_x(Window.camera[playerID]),
	camY = camera_get_view_y(Window.camera[playerID]);
	
var xx = camX + xPadding,
	yy = camY + camera_get_view_height(Window.camera[playerID]) - yPadding;

var h = 0;

for(var i=ds_list_size(messageList) - 1; i>=0; i--)
{
	h += string_height(messageList[| i]);
	draw_set_color(messageColor[| i]);
	if(i == 0)
		draw_set_alpha(fadeOut/fadeOutTime);
	else
		draw_set_alpha(1);
	draw_text(xx, yy - h, messageList[| i]);
}