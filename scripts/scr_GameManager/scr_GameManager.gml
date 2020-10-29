function GameZombieDead(_id)
{
	ds_queue_enqueue(GameManager.bodyList, _id);
	if(ds_queue_size(GameManager.bodyList) > GameManager.maxBodyCount)
	{
		var inst = ds_queue_dequeue(GameManager.bodyList);
		inst.fadeOut = inst.fadeOutTime;
	}
}

function GameAddZombie()
{
	GameManager.totalZombies += 1;
}

function GameRemoveZombie()
{
	GameManager.totalZombies -= 1;
}

function GameSpawnZombie()
{
	var spawnPoint = GameManager.spawn[irandom(GameManager.spawnNumber - 1)];
	instance_create_layer(spawnPoint.x, spawnPoint.y, "Instances", choose(LimperZombie, RabidZombie, LardZombie, GrappleZombie, GhostZombie, BursterZombie, TwitcherZombie, SpewerZombie, InjectorZombie, BladeZombie, RipperZombie));
}