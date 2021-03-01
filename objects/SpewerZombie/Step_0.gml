event_inherited();

if(!specialUsed and specialCooldown == 0 and target != noone and !isDead)
{
	var range = sqr(x - target.x) + sqr(y - target.y);
	if(range >= sqr(specialMinRange) and range <= sqr(specialMaxRange))
	{
		if(!collision_line(x, y - 32, target.x, target.y - 32, BlockParent, false, true))
		{
			specialActive = true;
			specialUsed = true;
			sprite_index = spr_spewershoot;
			image_index = 0;
			image_speed = 0.5;
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