var _player = camera_get_view_target(Window.camera[view_current]);
if(CheckBuff(_player, Buff.Scout))
	image_alpha = 1;

event_inherited();

if(isDead or isAttacking)
	image_alpha = 1;
else
	image_alpha = cloak;