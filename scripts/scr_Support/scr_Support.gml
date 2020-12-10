enum HealingType
{
	Medicine,
	Syringe,
	MedKit
}

///@function HealingUse(playerFrom, playerTo)

function HealingUse(_playerFrom, _playerTo)
{
	if(_playerFrom.healingItem == noone) return;
	
	HealPlayer(_playerTo, 20);
	
	_playerFrom.healingItemAmount -= 1;
	if(CheckBuff(_playerFrom, Buff.Medic)and random(1) <= DataBase.medicBuffChanceItemNotConsume)
		_playerFrom.healingItemAmount += 1;
	
	if(_playerFrom.healingItemAmount <= 0)
		_playerFrom.healingItem = noone;
}