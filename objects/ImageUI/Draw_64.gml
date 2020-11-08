if(drawTo != UIDrawTo.GUI or !global.drawUI) { exit; }

var W = 1, H = 1;
if(stretched)
{
	W = width/sprite_get_width(sprite);
	H = height/sprite_get_height(sprite);
}

draw_sprite_ext(sprite, subImage, x, y, W, H, 0, color, alpha);