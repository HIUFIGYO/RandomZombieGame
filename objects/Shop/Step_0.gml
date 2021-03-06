if(!isOpen)
{
	var _tick = 1;
	
	with(Player)
	{
		if(distance_to_point(Shop.xstart, Shop.ystart) > Shop.extractRadius)
			_tick -= 1 / global.playerAmount;
	}
	
	if(GameManager.gamePaused)
		_tick = 0;
	
	if(completedObjectives)
	{
		completeFade -= DeltaTimeSecond();
		if(completeFade < 0)
			completeFade = 0;
	}
	else
	{
		completeFade += DeltaTimeSecond();
		if(completeFade > 1)
			completeFade = 1;
	}
	
	objectiveTimeSec -= DeltaTimeSecond() * _tick;
	if(objectiveTimeSec <= 0)
	{
		objectiveTimeSec = 0;
		if(objectiveTimeMin > 0)
		{
			objectiveTimeSec = 60;
			objectiveTimeMin -= 1;
		}
		else if(objectiveKills >= objectiveTargetKills)
		{
			event_perform(ev_other, ev_user2);
		}
	}
	return;
}
	
if(flickerCount > 0)
{
	flickerCount--;
	if(shopMaskIndex == 0)
		shopMaskIndex = 1;
	else
		shopMaskIndex = 0;
}

var target = instance_nearest(x, y, Player);
if(target)
{
	if(target.x < bbox_left)
		image_index = 0;
	else if(target.x > bbox_right)
		image_index = 2;
	else
		image_index = 1;
}

if(restockTimer > 0 and !GamePaused())
{
	restockTimer -= DeltaTimeSecond();
	if(restockTimer <= 0)
	{
		MessageAddAll("Shop has restocked!", MessageFilter.Notification);
		restockTimer = restockTime;
		for(var i=0; i<SupportType.count; i++)
		{
			if(i < Weapon.count and DataBaseGetWeapon(i, WeapStat.Tier) == Tier.Five)
				continue;
			ShopAddStock(i);
		}
	}
}