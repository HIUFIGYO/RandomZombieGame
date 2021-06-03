if(!isActive or drawTo == UIDrawTo.GUI or !global.drawUI)
	return;

var W = sprite_get_width(sprite), H = sprite_get_height(sprite);
if(stretched)
{
	W = size.x;
	H = size.y;
}

if(drawTo == UIDrawTo.Room)
{
	draw_sprite_stretched_ext(sprite, subImage, x, y, W, H, color, alpha);
}
else if(drawTo == UIDrawTo.ViewPortRoom)
{
	if(view_current == drawView)
		draw_sprite_stretched_ext(sprite, subImage, x, y, W, H, color, alpha);
}
else if(view_current == drawView)
{
	draw_sprite_stretched_ext(sprite, subImage, camera_get_view_x(Window.camera[drawView]) + x, camera_get_view_y(Window.camera[drawView]) + y, W, H, color, alpha);
}