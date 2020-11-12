if(sprite_index == spriteAttack)
{
	isAttacking = false;
	if(target != noone and distance_to_object(target) <= attackRange)
	{
		DamagePlayer(target, damage);
	}
}