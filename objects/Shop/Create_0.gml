image_speed = 0;

global.shopID = id;

hasBank = false;
unlockBankOption = false;

restockTime = 10 * 60; //mins * 60 secs
restockTimer = restockTime;

reviveList = ds_list_create();
revivePriceAdd = 0;
reviveAddAmount = 500;

for(var i=0; i<SupportType.count; i++)
{
	if(i < Weapon.count)
		stock[i] = DataWeapon(i, WeapStat.Tier) == Tier.Five ? 1 : global.playerAmount;
	else
	{
		if(i >= SupportType.Barricade and i < SupportType.count)
		{
			stock[i] = global.maxPlayers;
			stockMax[i] = stock[i];
			continue;
		}
		stock[i] = global.playerAmount;
	}
	stockMax[i] = stock[i];
}