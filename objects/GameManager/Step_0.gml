if(keyboard_check(ord("Z")) and totalZombies < maxZombies)
{
	var spawnPoint = spawn[irandom(spawnNumber - 1)];
	instance_create_layer(spawnPoint.x, spawnPoint.y, "Instances", choose(LimperZombie, RabidZombie));
}