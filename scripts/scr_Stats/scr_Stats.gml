///@function  HealPlayer(player, amount)

function HealPlayer(_player, _amount)
{
	if(IsDead(_player))
		return;
	_player.hp = clamp(_player.hp + _amount, 0, GetMaxHealth(_player));
}

///@function HealDebuffs(id, healingType)

function HealDebuffs(_id, _healType)
{
	switch(_healType)
	{
		case HealingType.Medicine:
			_id.deBuff[DeBuff.Bleed] = false;
			_id.deBuff[DeBuff.Poison] = false;
			break;
			
		case HealingType.Syringe:
			_id.deBuff[DeBuff.Radiation] = false;
			_id.deBuff[DeBuff.Acid] = false;
			_id.deBuff[DeBuff.Poison] = false;
			break;
			
		case HealingType.MedKit:
			_id.deBuff[DeBuff.Acid] = false;
			_id.deBuff[DeBuff.Bleed] = false;
			_id.deBuff[DeBuff.Poison] = false;
			break;
	}
}

///@function DamagePlayer(player, damage, tag, zombieTag)

function DamagePlayer(_player, _damage, _tag, _zombieTag)
{
	if(_player.isDead or _player.invincible > 0)
		return;
		
	if(CheckVialPositive(_player, VialType.Survivalist))
		return;
		
	if(_player.isInMenu)
		HUDCloseShop(_player);
		
	if(CheckBuff(_player, Buff.Resistance))
	{
		_damage *= 1 - DataBase.resistBuffEffect;
		var _slot = GetBuffSlot(_player, Buff.Resistance);
		if(_player.buffCooldown[_slot] <= 0)
		{
			if(_player.damageResistanceTimer <= 0)
				_player.damageResistanceTimer = DataBase.resistBuffEffectDuration;
			else
				_damage *= 1 - DataBase.resistBuffEffect;
		}
	}
	
	if(CheckVialNegative(_player, VialType.TradeOff))
		_damage *= 4;
		
	if(CheckDebuff(_player, DeBuff.Radiation))
		_damage *= DataBase.deBuffPlayerDamageTaken;
	
	var damageToArmour = max(floor(_damage * 0.8), 1);
	var damageToHealth = floor(_damage * 0.2);
	
	if(_player.armour <= 0)
	{
		damageToArmour = 0;
		damageToHealth = _damage;
		if (random(1) <= 0.1)
			audio_play_sound(Sound_Hurt2, AudioSystem.soundPlayerPriority, false);
		audio_play_sound(Sound_PlayerHurt, AudioSystem.soundPlayerPriority, false);
	}
	
	if(_player.armour >= damageToArmour)
		_player.armour -= damageToArmour;
	else
	{
		damageToArmour -= _player.armour;
		damageToHealth += damageToArmour;
		_player.armour = 0;
	}
	
	_player.hp -= damageToHealth;
	_player.UI.overlayAlpha = 1;
	
	if(_player.hp <= 0)
	{
		_player.damageTag = _tag;
		_player.zombieTag = is_undefined(_zombieTag) ? "" : _zombieTag;
		_player.hp = 0;
		_player.isDead = true;
		InitDebuffs(_player);
		with(_player)
			event_perform(ev_other, ev_user0);
		with(GameManager.gameMode)
			event_perform(ev_other, ev_user1);
	}
	
	GameSprayBlood(damageToHealth, _player.x, _player.y - (_player.bbox_bottom - _player.bbox_top) / 2, false, 0);
}

///@function DamagePlayerArmour(player, damage)

function DamagePlayerArmour(_player, _damage)
{
	if(_player.isDead or _player.invincible > 0)
		return;
	
	if(_player.isInMenu)
		HUDCloseShop(_player);
	
	_player.armour -= _damage;
	_player.UI.overlayAlpha = 1;
	_player.armour = clamp(_player.armour, 0, GetMaxArmour(_player));
}

///@function DamagePlayerHealth(player, damage, tag, zombieTag)

function DamagePlayerHealth(_player, _damage, _tag, _zombieTag)
{
	if(_player.isDead or _player.invincible > 0)
		return;
	
	if(CheckVialPositive(_player, VialType.Survivalist))
		return;
		
	if(_player.isInMenu)
		HUDCloseShop(_player);
		
	if(CheckVialNegative(_player, VialType.TradeOff))
		_damage *= 4;
	
	_player.hp -= _damage;
	_player.UI.overlayAlpha = 1;
	if (random(1) <= 0.1)
		audio_play_sound(Sound_Hurt2, AudioSystem.soundPlayerPriority, false);
	audio_play_sound(Sound_PlayerHurt, AudioSystem.soundPlayerPriority, false);
		
	GameSprayBlood(GameGetBloodAmount(), _player.x, _player.y - (_player.bbox_bottom - _player.bbox_top) / 2, false, 0);
	if(_player.hp <= 0)
	{
		_player.damageTag = _tag;
		_player.zombieTag = is_undefined(_zombieTag) ? "" : _zombieTag;
		_player.hp = 0;
		_player.isDead = true;
		InitDebuffs(_player);
		with(_player)
			event_perform(ev_other, ev_user0);
		with(GameManager.gameMode)
			event_perform(ev_other, ev_user1);
	}
}

///@function RevivePlayer(player, startHp, invincibleTime)

function RevivePlayer(_player, _startHp, _invincibleTime)
{
	_player.isDead = false;
	_player.hp = _startHp;
	_player.hp = clamp(_player.hp, 0, GetMaxHealth(_player));
	_player.invincible = _invincibleTime;
	ShopUpdateSpecials();
}

///@function GetMaxHealth(player)
 
function GetMaxHealth(_player)
{
	var _value = _player.maxHp;
	
	if(CheckBuff(_player, Buff.Health))
		_value *= DataBase.healthBuffEffect;
		
	if(CheckDebuff(_player, DeBuff.Radiation))
		_value *= DataBase.deBuffPlayerHealth;
		
	_player.hp = clamp(_player.hp, 0, _value);
		
	return _value;
}

///@function GetMaxArmour(player)
 
function GetMaxArmour(_player)
{
	return _player.maxArmour;
}

///@function GetMaxStamina(player)
 
function GetMaxStamina(_player)
{
	var _value = _player.maxStamina;
	
	if(CheckBuff(_player, Buff.Stamina))
		_value *= DataBase.staminaBuffEffect;
		
	return _value;
}

///@function GetMaxAmmo(player, weaponSlot)
 
function GetMaxAmmo(_player, _weaponSlot)
{
	if(_player.weapon[_weaponSlot] == noone)
		return 0;
	
	var _value = DataBaseGetWeapon(_player.weapon[_weaponSlot], WeapStat.Ammo);
	if(CheckBuff(_player, Buff.Ammo))
		_value *= DataBase.ammoBuffAmmo;
	return ceil(_value);
}

///@function GetMaxMag(player, weaponSlot)
 
function GetMaxMag(_player, _weaponSlot)
{
	if(_player.weapon[_weaponSlot] == noone)
		return 0;
	
	var _value = DataBaseGetWeapon(_player.weapon[_weaponSlot], WeapStat.Mag);
	if(CheckBuff(_player, Buff.Ammo))
		_value *= DataBase.ammoBuffMag;
	return floor(_value);
}

///@function GetMaxGrenades(player)

function GetMaxGrenades(_player)
{
	if(_player.grenadeType == noone)
		return 0;
	
	var _value = DataBase.grenadeMaxAmmo;
	if(CheckBuff(_player, Buff.Demo))
		_value += DataBase.demoBuffAddGrenade;
	return _value;
}

///@function PlayerGetMoney(player)

function PlayerGetMoney(_player)
{
	return _player.money + _player.bankedMoney;
}

///@function PlayerBankMoney(player, amount)

function PlayerBankMoney(_playerID, _amount)
{
	_playerID.bankedMoney += _amount;
	_playerID.bankedMoney = clamp(_playerID.bankedMoney, 0, DataBaseGetMaxBankedMoney());
}

///@function PlayerGiveMoney(player, amount)

function PlayerGiveMoney(_playerID, _amount)
{
	_playerID.money += _amount;
	if(_playerID.money >= DataBaseGetMaxMoney())
	{
		_playerID.money = DataBaseGetMaxMoney();
		if(!global.shopID.unlockBankOption)
		{
			global.shopID.unlockBankOption = true;
			ShopUpdateSpecials();
			MessageAddAll("Bank feature unlocked in shop!", MessageFilter.Notification);
		}
	}
}

///@function PlayerSpendMoney(player, amount)

function PlayerSpendMoney(_player, _amount)
{
	if(_amount <= _player.bankedMoney)
		_player.bankedMoney -= _amount;
	else
	{
		_amount -= _player.bankedMoney;
		_player.bankedMoney = 0;
		_player.money -= _amount;
	}
}

///@function IsDead(id)

function IsDead(_id)
{
	return _id.isDead;
}
