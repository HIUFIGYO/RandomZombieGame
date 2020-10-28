var value = playerID.hp/playerID.maxHp;
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(x - width/2, y, x + width/2, y+height, false);
if(value > 0)
{
	draw_set_color(make_color_rgb((1 - value)*255, value * 255, 0));
	draw_rectangle(x - width/2, y, x - width/2 + width*value, y+height, false);
}