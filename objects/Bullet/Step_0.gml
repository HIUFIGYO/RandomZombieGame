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
		if(hit == "BlockParent")
		{
			destroy = true;
		}
		if(hit == "ZombieParent")
		{
			if(hits[| i].isDead or hits[| i].hp <= 0)
				continue;
			var alreadyHit = false;
			for(var zombieHit=0; zombieHit<ds_list_size(targetsHit); zombieHit++)
			{
				if(targetsHit[| zombieHit] == hits[| i])
				{
					alreadyHit = true;
					break;
				}
			}
			
			if(alreadyHit)
				continue;
				
			ds_list_add(targetsHit, hits[| i]);
				
			hits[| i].hp -= DataWeapon(weapon, WeapStat.Damage);
			if(hits[| i].hp <= 0)
				playerID.kills += 1;
				
			pierce -= 1;
			if(pierce > 0)
				continue;
			else
			{
				destroy = true;
				break;
			}
		}
	}
	if(destroy)
		instance_destroy();
}

ds_list_destroy(hits);