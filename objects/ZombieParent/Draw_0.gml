var offset = 0;

draw_self();
if(!isDead)
	draw_sprite_ext(cosmetic, cosmetic_index, x, y + offset, image_xscale, 1, 0, c_white, image_alpha);