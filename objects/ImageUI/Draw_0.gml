if(drawTo == UIDrawTo.GUI) { exit; }
var W = 1, H = 1;
if(stretched)
{
	W = width/sprite_get_width(sprite);
	H = height/sprite_get_height(sprite);
}

if(drawTo == UIDrawTo.Room)
{
	draw_sprite_ext(sprite, subImage, x, y, W, H, 0, color, alpha);
}
else if(drawTo == UIDrawTo.ViewPortRoom)
{
	if(view_current == drawView)
		draw_sprite_ext(sprite, subImage, x, y, W, H, 0, color, alpha);
}
else if(view_current == drawView)
{
	draw_sprite_ext(sprite, subImage, view_xport[drawView] + x, view_yport[drawView] + y, W, H, 0, color, alpha);
}