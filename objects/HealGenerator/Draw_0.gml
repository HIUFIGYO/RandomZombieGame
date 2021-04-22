if(healingDuration > 0)
{
	var x1 = x + 20 * image_xscale, y1 = y - 11, h = 18;

	draw_rectangle_color(x1, y1, x1+5*image_xscale, y1-(healingDuration/healingDurationMax)*h, fluidColor1, fluidColor2, fluidColor2, fluidColor1, false);
	
	if(on)
	{
		draw_set_color(color);
		draw_circle(x+(sprite_width/2), y, healingRange, true);
	}
}

draw_self();

draw_circle_color(x, y, 1, c_red, c_red, false);