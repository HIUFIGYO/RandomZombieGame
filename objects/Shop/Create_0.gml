image_speed = 0;

global.shopID = id;

isOpen = true;

hasBank = false;

for(var i=0; i<global.playerAmount; i++)
{
	hasCallExtract[i] = false;
}

unlockBankOption = false;
unlockCallExtractOption = false;

restockTime = 10 * 60; //mins * 60 secs
restockTimer = restockTime;

reviveList = ds_list_create();
revivePriceAdd = 0;
reviveAddAmount = 500;

for(i=0; i<SupportType.count; i++)
{
	if(i < Weapon.count)
		stock[i] = DataBaseGetWeapon(i, WeapStat.Tier) == Tier.Five ? 1 : global.playerAmount;
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

flickerCount = 0;
shopMaskIndex = 0;
alarm[0] = 5 * 60;

//Call Extract

extractRadius = 12 * global.worldUnit;