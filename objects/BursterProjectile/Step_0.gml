event_inherited();

if(PhysicsObjectGetCollision())
{
	x += lengthdir_x(12, image_angle);
	y += lengthdir_y(12, image_angle);
	GameBloodGrinderDrawSelf(id);
	instance_destroy();
}

image_angle = point_direction(0, 0, xSpeed, ySpeed);

CollisionCirleList(x, y, 4, Player, BursterSpikeCollidePlayer);
CollisionCirleList(x, y, 4, Barricade, BursterSpikeCollideBarricade);