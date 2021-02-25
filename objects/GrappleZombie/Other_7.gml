if(sprite_index == spriteAttack[0])
{	
	if(target != noone and distance_to_object(target) <= attackRange)
	{
		var _id = grabTarget;
		with(GrappleZombie)
		{
			if(grabTarget == _id)
				event_perform(ev_other, ev_user1);
		}
		specialActive = true;
		grabTarget = target;
		image_speed = 0;
		image_index = 8;
		
		if(deBuff[DeBuff.Ignite])
		{
			if(target.deBuff[DeBuff.Ignite] or random(1) <= 0.2)
				DebuffApply(target, DeBuff.Ignite);
		}
		
		event_perform(ev_other, ev_user0);
		exit;
	}
	
	if(barricadeID != noone and instance_exists(barricadeID))
	{
		isAttacking = false;
		barricadeID.hp -= damage;
		if(barricadeID.hp < 0)
		{
			barricadeID.hp = 0;
			barricadeID = noone;
		}
	}
	
	isAttacking = false;
}