event_inherited();

if(clawDraw)
{
	draw_set_color(c_black);
	draw_rectangle(x+7*image_xscale, y-33,x+(7+clawPos-clawOffset)*image_xscale, y-30, false);
	draw_sprite_ext(spr_injectorClaw, clawCanGrab, x + (clawPos-clawOffset)*image_xscale, y, image_xscale, 1, 0, c_white, 1);
}