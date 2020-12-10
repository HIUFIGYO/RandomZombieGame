var offset = 0;

draw_self();
if(!isDead)
{
	//draw self
	draw_sprite_ext(cosmetic, cosmetic_index, x, y + offset, image_xscale, 1, 0, c_white, image_alpha);
	//draw healthbar
	var _player = camera_get_view_target(Window.camera[view_current]);
	if(showHealth and CheckBuff(_player, Buff.Scout))
	{
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_rectangle(x-16, bbox_top-16, x+16, bbox_top-12, false);
		if(hp/maxHp > 0)
		{
			draw_set_color(c_red);
			draw_rectangle(x-16, bbox_top-16, x-16 + (hp/maxHp) * 32, bbox_top-12, false);
		}
	}
}