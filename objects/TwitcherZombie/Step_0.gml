event_inherited();

ZombieAttack();

TwitcherProcessDodge();

if(isDead)
	return;

if(pounceCooldown > 0)
	pounceCooldown -= DeltaTimeSecond();

if(pounceCooldown <= 0)
{
	if(target and DistanceToObject(id, target, pounceDistance))
	{
		xSpeed = 0;
		image_speed = 0;
		image_index = 0;
		sprite_index = spr_twitcherpounce;
		alarm[0] = 30;
	}
}

if(pounceUsed and place_meeting(x, y+1, BlockParent))
{
	pounceUsed = false;
	pounceCooldown = pounceCooldownTime;
}