event_inherited();

if(x != xprevious or y != yprevious)
	recalculate = true;

//calculate laser point
if(recalculate)
{
	recalculate = false;
	laserX = TraceLaser(image_xscale, x + xoffSet * image_xscale, y - yoffSet);
}

if(ammo > 0)
{
	var _zombieHits = ds_list_create();
	var _shoot = false;
	var _count = collision_line_list(x + xoffSet * image_xscale, y - yoffSet, laserX, y - yoffSet, ZombieParent, false, true, _zombieHits, false);

	for(var i=0; i<_count; i++)
	{
		if(!_zombieHits[| i].isDead and _zombieHits[| i].image_alpha >= 1)
		{
			_shoot = true;
			break;
		}
	}

	ds_list_destroy(_zombieHits);

	if(_shoot)
	{
		waitTimer = waitTime;
		fireTimer += DeltaTimeSecond();
		if(fireTimer >= fireRate)
		{
			ammo -= 1;
			if(ammo <= 0)
				reloadTimer = reloadTime;
			
			fireTimer = 0;
			//Fire bullet
			if(playerID != noone)
			{
				TurretShoot(id);
			}
		}
	}
	else
	{
		if(ammo < maxAmmo)
			waitTimer -= DeltaTimeSecond();
		if(waitTimer <= 0)
		{
			ammo = 0;
			reloadTimer = (ammo / maxAmmo) * reloadTime;
		}
	}
}
else
{
	reloadTimer -= DeltaTimeSecond();
	if(reloadTimer <= 0)
	{
		reloadTimer = 0;
		ammo = maxAmmo;
	}
}