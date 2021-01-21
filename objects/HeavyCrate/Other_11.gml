/// @description Effect

var usedCrate = false;

if(lastPlayerUse.grenadeType != ExplosiveType.BHBomber and lastPlayerUse.grenadeAmount < GetMaxGrenades(lastPlayerUse))
{
	lastPlayerUse.grenadeAmount = GetMaxGrenades(lastPlayerUse);
	usedCrate = true;
}

if(DataWeapon(lastPlayerUse.weapon[0], WeapStat.Tier) == Tier.Four)
{
	if(lastPlayerUse.mag[0] < GetMaxMag(lastPlayerUse, 0))
	{
		lastPlayerUse.mag[0] = GetMaxMag(lastPlayerUse, 0);
		usedCrate = true;
	}
	if(lastPlayerUse.ammo[0] < GetMaxAmmo(lastPlayerUse, 0))
	{
		lastPlayerUse.ammo[0] = GetMaxAmmo(lastPlayerUse, 0);
		usedCrate = true;
	}
}

if(DataWeapon(lastPlayerUse.weapon[1], WeapStat.Tier) == Tier.Four)
{
	if(lastPlayerUse.mag[1] < GetMaxMag(lastPlayerUse, 1))
	{
		lastPlayerUse.mag[1] = GetMaxMag(lastPlayerUse, 1);
		usedCrate = true;
	}
	if(lastPlayerUse.ammo[1] < GetMaxAmmo(lastPlayerUse, 1))
	{
		lastPlayerUse.ammo[1] = GetMaxAmmo(lastPlayerUse, 1);
		usedCrate = true;
	}
}

if(usedCrate)
	uses -= 1;
