event_inherited();

if(isDead)
	return;
	
ZombieAttack();

if(!specialUsed and specialCooldown == 0 and target != noone)
{
	var range = sqr(x - target.x) + sqr(y - target.y);
	if(range >= sqr(specialMinRange) and range <= sqr(specialMaxRange))
	{
		if(!collision_line(x, y - 32, target.x, target.y - 32, BlockParent, false, true))
		{
			specialAmmo = specialAmmoMax;
			specialUsed = true;
			specialActive = true;
			sprite_index = spr_infernoatk2;
			image_index = 0;
			image_speed = 0.5;
			xSpeed = 0;
		}
	}
}

if(specialUsed and image_speed = 0)
{
	specialFireTimer += DeltaTimeSecond();
	
	if(target != noone)
		image_xscale = target.x >= x ? 1 : -1;
	
	if(specialFireTimer >= specialFireRate)
	{
		specialFireTimer = 0;
		specialAmmo--;
		ZombieCreateProjectile(FireProjectile);
		if(specialAmmo <= 0)
		{
			specialActive = false;
			isAttacking = false;
			sprite_index = spriteIdle;
			specialCooldown = cooldownTime;
		}
	}
}

if(specialCooldown > 0)
{
	specialCooldown -= DeltaTimeSecond();
	if(specialCooldown <= 0)
	{
		specialCooldown = 0;
		specialUsed = false;
	}
}