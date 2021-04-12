event_inherited();

if(PhysicsObjectGetCollision())
	instance_destroy();
	
CollisionCirleList(x, y, 2, Player, InfernoFireCollidePlayer);
CollisionCirleList(x, y, 2, Barricade, InfernoFireCollideBarricade);
CollisionCirleList(x, y, 2, ZombieParent, InfernoFireCollideZombie);