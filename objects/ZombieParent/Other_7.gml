if(sprite_index == spriteAttack)
{
	isAttacking = false;
	if(target != noone and distance_to_object(target) <= attackRange)
	{
		if(deBuff[DeBuff.Ignite])
		{
			if(target.deBuff[DeBuff.Ignite] or random(1) <= 0.2)
				DebuffApply(target, DeBuff.Ignite);
		}
		event_perform(ev_other, ev_user0);
	}
}