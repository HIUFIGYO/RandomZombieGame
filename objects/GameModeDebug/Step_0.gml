if(keyboard_check_pressed(vk_numpad0))
{
	ds_list_clear(zombieSpawnList);
	ds_list_add(zombieSpawnList, LimperZombie);
	GameSpawnZombie();
}

if(keyboard_check_pressed(vk_numpad1))
{
	ds_list_clear(zombieSpawnList);
	ds_list_add(zombieSpawnList, RabidZombie);
	GameSpawnZombie();
}

if(keyboard_check_pressed(vk_numpad2))
{
	ds_list_clear(zombieSpawnList);
	ds_list_add(zombieSpawnList, SpewerZombie);
	GameSpawnZombie();
}

if(keyboard_check_pressed(vk_numpad3))
{
	ds_list_clear(zombieSpawnList);
	ds_list_add(zombieSpawnList, TwitcherZombie);
	GameSpawnZombie();
}

if(keyboard_check_pressed(vk_numpad4))
{
	ds_list_clear(zombieSpawnList);
	ds_list_add(zombieSpawnList, LardZombie);
	GameSpawnZombie();
}

if(keyboard_check_pressed(vk_decimal))
{
	var player = instance_find(Player, 0);
	var inst = instance_create_layer(player.x, player.y - 72, GameManager.layerObject, WeaponDrops);
	inst.weapon = irandom(Weapon.count);
}