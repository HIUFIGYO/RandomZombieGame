if(!isDead)
{
	UpdateDebuffs(id, false);
	
	//Timer
	if(switchTimer > 0)
	{
		switchTimer -= DeltaTimeSecond();
		if(switchTimer <= 0)
		{
			switchTimer = random_range(switchTargetMin, switchTargetMax);
			protectAlpha = choose(false, true);
		}
	}
	
	//Find target
	if(!protectAlpha)
		ZombieFindTarget(id);
	else
		target = alphaCreeperID;
}