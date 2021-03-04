draw_self();

if(healingDuration > 0)
{
	draw_set_color(color);
	draw_circle(x+sprite_get_width(sprite_index)/2, y, healingRange, true);
}