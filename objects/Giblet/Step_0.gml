event_inherited();

image_angle += xSpeed;

if(ySpeed > 0 and place_meeting(x, y+1, BlockParent))
{
	GameBloodGrinderDrawSelf(id);
	instance_destroy();
}