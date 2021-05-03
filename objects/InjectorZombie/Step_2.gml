if(grabTarget == noone)
	return;
	
grabTarget.x = x + (clawPos+clawOffset)*image_xscale;
grabTarget.y = y;

if(isDead)
{
	grabTarget.isGrabbed = false;
	grabTarget.canMove = true;
	grabTarget = noone;
}