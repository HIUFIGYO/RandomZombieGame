event_inherited();

if(healingDuration > 0)
{
	healingDuration -= DeltaTimeSecond();
	var healGen = id;
	with(Player)
	{
		if(DistanceToObject(id, healGen, healGen.healingRange))
		{
			HealPlayer(id, healGen.healAmount * DeltaTimeSecond());
		}
	}
	if(healingDuration <= 0)
	{
		image_index = 1;
		alarm[0] = game_get_speed(gamespeed_fps) * fadeOutTime;
	}
}

if(fade > 0)
{
	image_alpha = fade;
	fade -= DeltaTimeSecond();
	if(fade <= 0)
		instance_destroy();
}