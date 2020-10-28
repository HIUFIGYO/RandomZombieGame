if(sprite_index == spriteAttack)
{
	isAttacking = false;
	if(distance_to_object(target) <= attackRange)
	{
		target.hp -= damage;
	}
}