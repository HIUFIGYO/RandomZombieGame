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

restockTime = 8 * 60; //mins * 60 secs
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

objectiveTargetKills = 50 * (1 + (0.3 * (global.playerAmount - 1)));
objectiveTargetTime = 120; // seconds.

objectiveKills = 0;
objectiveTimeSec = objectiveTargetTime mod 60;
objectiveTimeMin = objectiveTargetTime div 60;

completedObjectives = false;
completeFade = 0;