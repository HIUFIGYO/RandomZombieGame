event_inherited();

if(on and healingDuration > 0)
{
	healingDuration -= DeltaTimeSecond();
	var healGen = id;
	with(Player)
	{
		if(DistanceToObjectOffset(id, healGen, healGen.healingRange, (healGen.sprite_width/2), 0))
		{
			HealPlayer(id, healGen.healAmount * DeltaTimeSecond());
			DebuffHealGenCure(id);
		}
	}
	if(healingDuration <= 0)
	{
		alarm[0] = game_get_speed(gamespeed_fps) * fadeOutTime;
	}
	
	tick += DeltaTimeSecond();
	if(tick >= tickRate)
	{
		tick = 0;
		var _healGen = id;
		with(ZombieParent)
		{
			if(isDead)
				continue;
				
			if(!DistanceToObjectOffset(id, _healGen, _healGen.healingRange, _healGen.sprite_width/2, 0))
				continue;
			
			DamageZombie(_healGen.playerID, id, _healGen.damage, true);
			EndStatAdd(_healGen.playerID.playerID, EndStat.SupportDamage, _healGen.damage);
			DebuffRemoveZombie(id, DeBuff.Radiation);
			if(name == "Bio Zombie")
				hasRad = false;
		}
	}
}

if(fade > 0)
{
	image_alpha = fade;
	fade -= DeltaTimeSecond();
	if(fade <= 0)
		instance_destroy();
}