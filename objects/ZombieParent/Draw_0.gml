draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, color, image_alpha);

//draw healthbar
if(!isDead)
{
	var _player = camera_get_view_target(Window.camera[view_current]);
	if((showHealth and CheckBuff(_player, Buff.Scout))or Debugger.startedInDebug)
	{
		var spriteHeight = y - sprite_get_height(sprite_index);
		
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_rectangle(x-16, spriteHeight-16, x+16, spriteHeight-12, false);
		
		if(hp/maxHp > 0)
		{
			draw_set_color(c_red);
			draw_rectangle(x-16, spriteHeight-16, x-16 + (hp/ZombieGetMaxHealth(id)) * 32, spriteHeight-12, false);
		}
	}
}