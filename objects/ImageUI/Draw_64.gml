if(drawTo != UIDrawTo.GUI or !global.drawUI) { exit; }

var W = sprite_get_width(sprite), H = sprite_get_height(sprite);
if(stretched)
{
	W = width;
	H = height;
}

draw_sprite_stretched_ext(sprite, subImage, x, y, W, H, color, alpha);