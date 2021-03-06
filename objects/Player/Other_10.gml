/// @description OnPlayerDeath

var _slot = GetBuffSlot(id, Buff.Demo);
if(CheckBuff(id, Buff.Demo)and buffCooldown[_slot] <= 0)
{
	buffCooldown[_slot] = DataBase.demoBuffCooldown;
	RevivePlayer(id, 1, 1);
	CreateExplosion(id, id, ExplosionType.Grenade);
}

if(isDead)
{
	isGrabbed = false;
	isPinned = false;
	canMove = true;
	isInMenu = false;
	
	CreateAccessoryPickUp(id);
	
	var _str = MessageGetDamageTag(damageTag);
	MessageAddAll(name + _str + zombieTag, MessageFilter.PlayerDown);
	ShopUpdateSpecials();
	
	money *= SetStat(1, 0.9, 0.8, 0.7);
	
	if(PlayerGetBuff(id, 1) != noone)
		RemoveBuff(id, 1);
	else
		RemoveBuff(id, 0);
}