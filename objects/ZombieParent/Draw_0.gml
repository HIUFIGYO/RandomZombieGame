draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, color, image_alpha);

//draw healthbar
if(!isDead)
{
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