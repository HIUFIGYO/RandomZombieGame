//range
rangeTimer--;
if(rangeTimer <= 0)
{
	if(weapon == Weapon.Flame or weapon == Weapon.Tesla)
		instance_destroy();
	gravity = 1;
}

//move
x += xSpeed * spd * DeltaTime();
y += ySpeed * spd * DeltaTime();
var hits = ds_list_create();
var count = collision_line_list(xprevious, yprevious, x, y, all, false, true, hits, false);
if(count > 0)
{
	var destroy = false;
	for(var i=0; i<count; i++)
	{
		var hit = object_get_name(object_get_parent(hits[| i].object_index));
		if(hit == "BlockParent" and !destroy)
		{
			destroy = true;
		}
		if(hit == "ZombieParent")
		{
			if(hits[| i].isDead)
				continue;
			destroy = true;
			hits[| i].hp -= DataWeapon(weapon, WeapStat.Damage);
			if(hits[| i].hp <= 0)
				playerID.kills += 1;
			break;
		}
	}
	if(destroy)
		instance_destroy();
}

ds_list_destroy(hits);