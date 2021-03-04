/// @description Took Damage
event_inherited();

image_index = 0;
specialActive = false;
isAttacking = false;

if(grabTarget != noone)
{
	grabTarget.isGrabbed = false;
	grabTarget = noone;
}