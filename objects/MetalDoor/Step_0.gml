if(hp <= 0)
{
	if(recalculateLaser)
	{
		image_index = 2;
		toggle = false;
		canCollidePlayer = toggle;
		canCollideZombie = toggle;
		recalculateLaser = false;
	
		with(Turret)
		{
			recalculate = true;
		}
	}
	
	respawnTimer += DeltaTimeSecond();
	if(respawnTimer >= respawnTime)
	{
		hp = maxHp / 4;
		respawnTimer = 0;
		image_index = 1;
		recalculateLaser = true;
	}
}
else
	hp += hpRegenRate * DeltaTimeSecond();
	
hp = clamp(hp, 0, maxHp);