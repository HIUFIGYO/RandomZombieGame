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
		restockTimer = restockTime;
		for(var i=0; i<SupportType.count; i++)
		{
			ShopAddStock(i);
		}
	}
}