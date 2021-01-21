draw_self();

if(healingDuration > 0)
{
	draw_set_color(color);
	draw_circle(x, y, healingRange, true);
}