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
var hits = ds_list_create();
var count = collision_line_list(xprevious, yprevious, x, y, all, false, true, hits, false);
if(count > 0)
{
	for(var i=0; i<count; i++)
	{
		var hit = object_get_name(object_get_parent(hits[| i].object_index));
		if(hit == "BlockParent")
		{
			instance_destroy();
			break;
		}
		if(hit == "Damage")
		{
			hits[| i].hp -= DataWeapon(weapon, WeapStat.Damage);
		}
	}
}

ds_list_destroy(hits);