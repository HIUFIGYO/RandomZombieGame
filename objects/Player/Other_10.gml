/// @description OnPlayerDeath

var _slot = GetBuffSlot(id, Buff.Demo);
if(CheckBuff(id, Buff.Demo)and buffCooldown[_slot] <= 0)
{
	buffCooldown[_slot] = DataBase.demoBuffCooldown;
	RevivePlayer(id, 1, 1);
	CreateExplosion(id, id);
}

if(isDead)
{
	isGrabbed = false;
	var _str = MessageGetDamageTag(damageTag);
	MessageAddAll(name + _str + zombieTag, MessageFilter.PlayerDown);
	ShopUpdateSpecials();
	
	money *= SetStat(0.7, 0.6, 0.5, 0.4);
	
	if(buff[1] != noone)
		RemoveBuff(id, 1);
	else
		RemoveBuff(id, 0);
}