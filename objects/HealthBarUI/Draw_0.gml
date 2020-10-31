if(drawTo == UIDrawTo.GUI) { exit; }

draw_set_alpha(alpha);
draw_set_color(color);
draw_rectangle(x - width/2, y, x + width/2, y+height, false);
if(value > 0)
{
	merge_color(color1, color2, value);
	draw_rectangle(x - width/2, y, x - width/2 + width*value, y+height, false);
}