/// @description OnUse
if(uses <= 0)
	return;

event_perform(ev_other, ev_user1);
lastPlayerUse = noone;

if(uses <= 0)
{
	image_index = 1;
	fade = fadeOutTime;
}