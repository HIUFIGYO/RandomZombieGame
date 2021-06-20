/// @description Pause UI

drawSplitScreen();

if(!gamePaused)
	return;
	
draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	
var str = "PAUSE";
var strW = string_width(str) / 2,
	strH = string_height(str) / 2;

draw_set_alpha(1);
draw_set_color(c_red);
draw_text(display_get_gui_width()/2 - strW, display_get_gui_height()/2 - strH, str);