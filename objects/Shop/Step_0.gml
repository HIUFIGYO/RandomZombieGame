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

if(restockTimer > 0)
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