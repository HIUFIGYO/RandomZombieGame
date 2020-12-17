enum Buff
{
	Regeneration,
	Health,
	Resistance,
	Stamina,
	Agility,
	Reload,
	Ammo,
	Damage,
	Critical,
	Scout,
	Medic,
	Demo,
	count
}

enum DeBuff
{
	Ignite,
	Acid,
	Bleed,
	Poison,
	count
}

///@function CheckBuff(player, buff)

function CheckBuff(_player, _buff)
{
	return(_player.buff[0] == _buff or _player.buff[1] == _buff);
}

///@function GetBuffSlot(player, buff)

function GetBuffSlot(_player, _buff)
{
	if(_player.buff[0] == _buff)
		return 0;
	return 1;
}