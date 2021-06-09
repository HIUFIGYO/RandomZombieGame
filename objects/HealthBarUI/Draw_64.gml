if(!isActive or drawTo != UIDrawTo.GUI or !global.drawUI)
	return;

draw_set_alpha(alpha);
draw_set_color(color);
draw_rectangle(x - pixelSize.x/2, y, x + pixelSize.x/2, y+pixelSize.y, false);
if(value > 0)
{
	merge_color(color1, color2, value);
	draw_rectangle(x - pixelSize.x/2, y, x - pixelSize.x/2 + pixelSize.x*value, y+pixelSize.y, false);
}
draw_set_alpha(1);