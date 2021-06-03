if(!isActive or drawTo != UIDrawTo.GUI or !global.drawUI)
	return;

draw_set_alpha(alpha);
draw_set_color(color);
draw_rectangle(x - size.x/2, y, x + size.x/2, y+size.y, false);
if(value > 0)
{
	merge_color(color1, color2, value);
	draw_rectangle(x - size.x/2, y, x - size.x/2 + size.x*value, y+size.y, false);
}
draw_set_alpha(1);