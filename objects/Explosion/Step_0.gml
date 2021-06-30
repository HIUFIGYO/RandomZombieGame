if(maxHits <= 0 or GamePaused())
	return;

lifeTimer -= DeltaTimeSecond();
if(lifeTimer <= 0)
{
	instance_destroy();
	return;
}

CollisionCirleListTargets(x, y, sprite_width/2, ZombieParent, targetsHit, ExplosionCollideZombie);
CollisionCirleListTargets(x, y, sprite_width/2, Support, targetsHit, ExplosionCollideSupport);
CollisionCirleListTargets(x, y, sprite_width/2, PhysicsObject, targetsHit, ExplosionCollidePhysicsObject);
CollisionCirleListTargets(x, y, sprite_width/2, Player, targetsHit, ExplosionCollidePlayer);