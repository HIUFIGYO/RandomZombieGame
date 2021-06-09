if(!isActive or drawTo != UIDrawTo.GUI or !global.drawUI)
	return;

var W = sprite_get_width(sprite), H = sprite_get_height(sprite);
if(stretched)
{
	W = pixelSize.x;
	H = pixelSize.y;
}

draw_sprite_stretched_ext(sprite, subImage, x, y, W, H, color, alpha);