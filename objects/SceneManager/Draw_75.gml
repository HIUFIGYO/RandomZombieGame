/// @description Fader

if(!isChangingRoom)
	return;

draw_set_color(c_black);
draw_set_alpha(fader / fadeTime);
draw_rectangle(0, 0, Window.width, Window.height, false);

draw_set_alpha(1);