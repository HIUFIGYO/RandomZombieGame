event_inherited();

if(!isDead and hasRad)
{
	draw_set_color(radColor);
	draw_circle(x+sprite_get_width(sprite_index)/2, y, radRange, true);
}
