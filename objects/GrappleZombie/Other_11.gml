/// @description Took Damage
event_inherited();

isAttacking = false;

if(grabTarget != noone)
{
	grabTarget.isGrabbed = false;
	grabTarget = noone;
	image_index = 0;
}