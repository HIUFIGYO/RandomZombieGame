/// @description OnPlayerDeath

var _slot = GetBuffSlot(id, Buff.Demo);
if(CheckBuff(id, Buff.Demo)and buffCooldown[_slot] <= 0)
{
	buffCooldown[_slot] = DataBase.demoBuffCooldown;
	RevivePlayer(id, 1);
	CreateExplosion(id, id);
}

if(isDead)
{
	var _str = MessageGetDamageTag(damageTag);
	MessageAddAll(name + _str + zombieTag, c_red, MessageFilter.PlayerDown);
	money *= SetStat(0.7, 0.6, 0.5, 0.4);
	
	if(buff[1] != noone)
		buff[1] = noone;
	else
		buff[0] = noone;
}