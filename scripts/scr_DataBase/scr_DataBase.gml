///@function DataBaseGetWeapon(weapon, stat)

function DataBaseGetWeapon(weapon, stat)
{
	return DataBase.weapon[# stat, weapon];
}

///@function DataBaseSupportGetSprite(support)

function DataBaseSupportGetSprite(_support)
{
	return DataBase.supportSprite[_support - SupportType.Barricade];
}

///@function DataBaseSupportGetObject(support)

function DataBaseSupportGetObject(_support)
{
	return DataBase.supportObject[_support - SupportType.Barricade];
}

///@function DataBaseVialGetCooldown(vial)

function DataBaseVialGetCooldown(_vial)
{
	return DataBase.vialCooldown[_vial - VialType.Adrenaline];
}

///@function DataBaseVialGetTimer(vial)

function DataBaseVialGetTimer(_vial)
{
	return DataBase.vialTimer[_vial - VialType.Adrenaline];
}

///@function DataBaseMedicalGetAmount(medItem)

function DataBaseMedicalGetAmount(_medItem)
{
	return DataBase.healingAmount[_medItem - HealingType.Medicine];
}

///@function DataBaseMedicalGetTimer(medItem)

function DataBaseMedicalGetTimer(_medItem)
{
	return DataBase.healingTimer[_medItem - HealingType.Medicine];
}

///@function DataBaseMedicalGetUses(medItem)

function DataBaseMedicalGetUses(_medItem)
{
	return DataBase.healingUses[_medItem - HealingType.Medicine];
}

///@function DataBaseBuffMedicRange()

function DataBaseBuffMedicRange()
{
	return DataBase.medicBuffRange;
}

///@function DataBaseBuffRegenHealth()

function DataBaseBuffRegenHealth()
{
	return DataBase.medicBuffRegenHealth;
}

///@function DataBaseBuffRegenEffect()

function DataBaseBuffRegenEffect()
{
	return DataBase.regenBuffEffect;
}

///@function DataBaseBuffReviveFactor()

function DataBaseBuffReviveFactor()
{
	return DataBase.medicBuffReviveFactor;
}

///@function DataBaseBuffResistCooldown()

function DataBaseBuffResistCooldown()
{
	return DataBase.resistBuffCooldown;
}

///@function DataBaseShopGetInfo(itemType, shopKey)

function DataBaseShopGetInfo(_itemType, _shopKey)
{
	return DataBase.shop[_itemType, _shopKey];
}

///@function DataBaseGetMaxMoney()

function DataBaseGetMaxMoney()
{
	return DataBase.maxMoney;
}

///@function DataBaseGetMaxBankedMoney()

function DataBaseGetMaxBankedMoney()
{
	return DataBase.maxBankedMoney;
}

///@function DataBaseGetMoneyDropAmount()

function DataBaseGetMoneyDropAmount()
{
	return DataBase.moneyDropAmount;
}

///@function DataBaseIncendiaryGroundFire()

function DataBaseIncendiaryGroundFire()
{
	return DataBase.incendiaryGroundFire;
}

///@function DataBaseIncendiaryIgniteChance()

function DataBaseIncendiaryIgniteChance()
{
	return DataBase.incendiaryIgniteChance;
}
