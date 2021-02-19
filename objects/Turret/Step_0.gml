event_inherited();

if(x != xprevious or y != yprevious)
	recalculate = true;

//calculate laser point
if(recalculate)
{
	recalculate = false;
	laserX = TraceLaser(id, image_xscale, x + xoffSet * image_xscale, y - yoffSet);
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
				var inst = instance_create_layer(x + sprite_get_width(sprite_index) * image_xscale, y - yoffSet, GameManager.layerObject, Bullet);
				inst.playerID = playerID;
				inst.weapon = Weapon.Rifle;
				inst.spd = 64;
				inst.rangeTimer = DataWeapon(inst.weapon, WeapStat.Range) * game_get_speed(gamespeed_fps);
				inst.pierce = 2;
				inst.ignoreBuffs = true;
				inst.image_xscale = image_xscale;
				inst.image_index = DataWeapon(inst.weapon, WeapStat.BulletImage);

				var bulletAngle = irandom((1 - accuracy) * 90);
				inst.xSpeed = cos(bulletAngle * pi / 180) * image_xscale;
				inst.ySpeed = sin(bulletAngle * pi / 180) * choose(-1, 1);
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