event_inherited();

if(isDead)
	return;
	
if(specialCooldown > 0)
{
	specialCooldown -= DeltaTimeSecond();
	if(specialCooldown <= 0)
	{
		specialCooldown = 0;
		specialUsed = false;
	}
}

if(!specialUsed)
{
	if(!isAttacking and target != noone and distance_to_object(target) <= attackRange)
	{
		specialUsed = true;
		specialActive = true;
		sprite_index = spr_ripperatk3;
		image_speed = 0.5;
	}
}

ZombieAttack();