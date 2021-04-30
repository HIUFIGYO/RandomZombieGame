if(grabTarget == noone)
	return;
	
grabTarget.x = x;
grabTarget.y = y;

if(isDead)
{
	grabTarget.isGrabbed = false;
	target.isPinned = false;
	target.canMove = true;
	target.isInMenu = false;
	grabTarget = noone;
}