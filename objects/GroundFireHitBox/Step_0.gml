event_inherited();

fadeOut -= DeltaTimeSecond();
if(fadeOut <= fadeOutTime)
{
	image_alpha = fadeOut / fadeOutTime;
	if(fadeOut <= 0)
		instance_destroy();
}

if(PhysicsObjectGetCollision())
{
	grav = 0;
	xSpeed = 0;
	ySpeed = 0;
}

CollisionCirleListTargets(x, y, 3, Player, targetsHit, GroundFireCollidePlayer);
CollisionCirleListTargets(x, y, 3, ZombieParent, targetsHit, GroundFireCollideZombie);