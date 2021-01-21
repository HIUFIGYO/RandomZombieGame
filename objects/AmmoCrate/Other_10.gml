/// @description OnUse
if(uses <= 0)
	exit;

event_perform(ev_other, ev_user1);
lastPlayerUse = noone;

if(uses <= 0)
{
	image_index = 1;
	alarm[0] = game_get_speed(gamespeed_fps) * fadeOutTime;
}