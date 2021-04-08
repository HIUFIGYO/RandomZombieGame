///@function ZombieGetMaxHealth(zombie)

function ZombieGetMaxHealth(_zombie)
{
	var _value = _zombie.maxHp;
	if(CheckDebuff(_zombie, DeBuff.Radiation))
		_value *= DataBase.deBuffZombieHealth;
		
	_zombie.hp = clamp(_zombie.hp, 0, _value);
	
	return _value;
}