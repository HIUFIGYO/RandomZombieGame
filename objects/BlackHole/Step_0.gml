PartEmitStream(0, emitter, ParticleSystem.particleTypes[| 0]);
PartEmitStream(0, emitter2, ParticleSystem.particleTypes[| 1]);

var hits = ds_list_create();

var count = collision_circle_list(x, y, pullRadius, all, false, true, hits, false);

for(var i=0; i<count; i++)
{
	if(object_is_ancestor(hits[| i].object_index, ZombieParent))
	{
		DamageZombie(playerID, hits[| i], damage * DeltaTimeSecond(), true);
		PhysicsObjectPush(hits[| i], force, x, y);
		continue;
	}
	
	if(object_is_ancestor(hits[| i].object_index, PhysicsObject))
	{
		PhysicsObjectPush(hits[| i], force, x, y);
		continue;
	}
	
	if(hits[| i].object_index == Player)
	{
		DamagePlayer(hits[| i], damage * DeltaTimeSecond() * SetStat(0.25, 0.5, 1, 2), "BlackHole");
		PhysicsObjectPush(hits[| i], force, x, y);
		continue;
	}
}