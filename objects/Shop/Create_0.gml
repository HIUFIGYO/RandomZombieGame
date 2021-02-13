image_speed = 0;

global.shopID = id;

hasBank = false;

unlockBankOption = false;

for(var i=0; i<SupportType.count; i++)
{
	if(i < Weapon.count)
		stock[i] = DataWeapon(i, WeapStat.Tier) == Tier.Five ? 1 : global.playerAmount;
	else
		stock[i] = global.playerAmount;
}