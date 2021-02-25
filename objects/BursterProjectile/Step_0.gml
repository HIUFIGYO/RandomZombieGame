event_inherited();

if(collision)
{
	x += lengthdir_x(12, image_angle);
	y += lengthdir_y(12, image_angle);
	GameBloodGrinderDrawSelf(id);
	instance_destroy();
}

image_angle = point_direction(0, 0, xSpeed, ySpeed);