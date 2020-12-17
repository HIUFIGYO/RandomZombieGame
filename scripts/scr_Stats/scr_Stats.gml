///@function  HealPlayer(player, amount)

function HealPlayer(_player, _amount)
{
	_player.hp = clamp(_player.hp + _amount, 0, GetMaxHealth(_player));
}

///@function DamagePlayer(player, damage)

function DamagePlayer(_player, _damage)
{
	if(_player.isDead)
		return;
		
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
	_damage = round(_damage);
	var damageToArmour = max(floor(_damage * 0.8), 1);
	var damageToHealth = floor(_damage * 0.2);
	
	if(_player.armour <= 0)
	{
		damageToArmour = 0;
		damageToHealth = _damage;
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
		_player.hp = 0;
		_player.isDead = true;
		with(_player)
			event_perform(ev_other, ev_user0);
		with(GameManager.gameMode)
			event_perform(ev_other, ev_user1);
	}
	//TODO: make this a function dammit
	repeat(damageToHealth)
	{
		var inst = instance_create_layer(_player.x, _player.y - 32, GameManager.layerCorpse, Blood);
		inst.xSpeed = -10 + irandom(20);
		inst.ySpeed = -10 - irandom(10);
	}
}

///@function DamagePlayerArmour(player, damage)

function DamagePlayerArmour(_player, _damage)
{
	_player.armour -= _damage;
	_player.armour = clamp(_player.armour, 0, GetMaxArmour(_player));
}

///@function DamagePlayerHealth(player, damage)

function DamagePlayerHealth(_player, _damage)
{
	_player.hp -= _damage;
	_player.hp = clamp(_player.hp, 0, GetMaxHealth(_player));
}

///@function DamageZombie(playerID, zombie, damage)

function DamageZombie(_playerID, _zombie, _damage)
{
	if(CheckBuff(_playerID, Buff.Critical)and random(1) <= DataBase.criticalBuffEffect)
		_damage *= 2;
		
	if(CheckBuff(_playerID, Buff.Scout))
	{
		_zombie.showHealth = true;
		_zombie.showHealthTimer = DataBase.scoutBuffShowHealthTime;
		if(_zombie.hp <= _zombie.maxHp * DataBase.scoutBuffHealthRate)
			_damage += DataBase.scoutBuffDamage;
	}
		
	var moneyGained = _damage;
	if(_damage > _zombie.hp)
		moneyGained = _zombie.hp;
	_playerID.money += moneyGained * (5 - global.difficulty);
	_playerID.money  = clamp(_playerID.money, 0, DataBase.maxMoney);
	
	_zombie.hp -= _damage;
	if(_zombie.hp <= 0)
	{
		_zombie.hp = 0;
		_playerID.kills += 1;
	}
}

///@function RevivePlayer(player, startHp)

function RevivePlayer(_player, _startHp)
{
	_player.isDead = false;
	_player.hp = _startHp;
	_player.hp = clamp(_player.hp, 0, GetMaxHealth(_player));
}

///@function GetMaxHealth(player)
 
function GetMaxHealth(_player)
{
	var _value = _player.maxHp;
	
	if(CheckBuff(_player, Buff.Health))
		_value *= DataBase.healthBuffEffect;
	
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

///@function GetMaxAmmo(player)
 
function GetMaxAmmo(_player)
{
	var _value = DataWeapon(_player.weapon[_player.currentWeapon], WeapStat.Ammo);
	if(CheckBuff(_player, Buff.Ammo))
		_value *= DataBase.ammoBuffAmmo;
	return ceil(_value);
}

///@function GetMaxMag(player)
 
function GetMaxMag(_player)
{
	var _value = DataWeapon(_player.weapon[_player.currentWeapon], WeapStat.Mag);
	if(CheckBuff(_player, Buff.Ammo))
		_value *= DataBase.ammoBuffMag;
	return floor(_value);
}

///@function GetMaxGrenades(player)

function GetMaxGrenades(_player)
{
	var _value = DataBase.explosionMaxAmmo;
	if(CheckBuff(_player, Buff.Demo))
		_value += DataBase.demoBuffAddGrenade;
	return _value;
}