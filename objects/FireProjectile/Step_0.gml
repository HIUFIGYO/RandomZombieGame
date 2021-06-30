event_inherited();

if(GamePaused())
	return;
	
lifeTimer -= DeltaTimeSecond();
if(lifeTimer <= 0)
{
	instance_destroy();
	return;
}

if(PhysicsObjectGetCollision())
	instance_destroy();
	
CollisionCirleList(x, y, 2, Player, InfernoFireCollidePlayer);
CollisionCirleList(x, y, 2, Barricade, InfernoFireCollideBarricade);
CollisionCirleList(x, y, 2, ZombieParent, InfernoFireCollideZombie);