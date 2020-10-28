if(sprite_index == spriteAttack)
{
	isAttacking = false;
	if(target <= attackRange)
	{
		target.hp -= damage;
	}
}