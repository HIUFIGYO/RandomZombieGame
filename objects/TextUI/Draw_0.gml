if(!isActive or drawTo == UIDrawTo.GUI or !global.drawUI)
	return;

draw_set_alpha(alpha);
draw_set_color(color);
draw_set_font(font);
draw_set_halign(textHAlign);
draw_set_valign(textVAlign);

if(drawTo == UIDrawTo.Room)
{
	draw_text_ext_transformed(x, y, text, lineSeperation, pixelSize.x, Window.width / UIController.targetWidth, Window.height / UIController.targetHeight, 0);
}
else if(drawTo == UIDrawTo.ViewPort)
{
	if(view_current == drawView)
		draw_text_ext_transformed(camera_get_view_x(Window.camera[drawView]) + x, camera_get_view_y(Window.camera[drawView]) + y, text, lineSeperation, pixelSize.x, Window.width / UIController.targetWidth, Window.height / UIController.targetHeight, 0);
}
else
{
	if(view_current == drawView)
		draw_text_ext_transformed(x, y, text, lineSeperation, pixelSize.x, Window.width / UIController.targetWidth, Window.height / UIController.targetHeight, 0);
}

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);