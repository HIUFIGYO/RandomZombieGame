if(grabTarget == noone)
	return;
	
grabTarget.x = x;
grabTarget.y = y;

if(isDead)
{
	grabTarget.isGrabbed = false;
	grabTarget.isPinned = false;
	grabTarget.canMove = true;
	grabTarget.isInMenu = false;
	grabTarget = noone;
}