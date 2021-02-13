image_speed = 0;

global.shopID = id;

hasBank = false;

unlockBankOption = false;

for(var i=0; i<Weapon.count; i++)
{
	stockWeapon[i] = DataWeapon(i, WeapStat.Tier) == Tier.Five ? 1 : global.playerAmount;
}

for(i=0; i<HealingType.count; i++)
{
	stockMedical[i] = global.playerAmount;
}

for(i=0; i<SupportType.count; i++)
{
	stockSupport[i] = global.playerAmount;
}

for(i=0; i<VialType.count; i++)
{
	stockVial[i] = global.playerAmount;
}

for(i=0; i<Buff.count; i++)
{
	stockBuff[i] = global.playerAmount;
}

for(i=0; i<ExplosiveType.count; i++)
{
	stockExplosion[i] = global.playerAmount;
}