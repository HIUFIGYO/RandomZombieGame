event_inherited();

if(PhysicsObjectGetCollision())
	instance_destroy();
	
CollisionCirleList(x, y, 3, Player, SpewerShotCollidePlayer);
CollisionCirleList(x, y, 3, Barricade, SpewerShotCollideBarricade);