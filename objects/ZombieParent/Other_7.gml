if(sprite_index == spriteAttack)
{
	isAttacking = false;
	if(target != noone and distance_to_object(target) <= attackRange)
	{
		event_perform(ev_other, ev_user0);
	}
}