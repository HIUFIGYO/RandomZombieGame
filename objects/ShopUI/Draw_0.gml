if(view_current != player.playerID)
	exit;
var xx = camera_get_view_x(Window.camera[player.playerID]),
	yy = camera_get_view_y(Window.camera[player.playerID]);

var viewWidth = camera_get_view_width(Window.camera[player.playerID]),
	viewHeight = camera_get_view_height(Window.camera[player.playerID]);
	
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(xx, yy, xx+viewWidth, yy+viewHeight, false);