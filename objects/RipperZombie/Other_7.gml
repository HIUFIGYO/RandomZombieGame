event_inherited();

if(sprite_index == spr_ripperatk3)
{
	if(target != noone and !IsDead(target) and distance_to_object(target) <= attackRange)
	{
		DamagePlayer(target, SetStat(1, 2, 3, 4), "Zombie", name);
		image_index = image_number - 2;
	}
	else
	{
		isAttacking = false;
		specialCooldown = cooldownTime;
		ZombieChangeState(ZombieStateBehaviour);
	}
}