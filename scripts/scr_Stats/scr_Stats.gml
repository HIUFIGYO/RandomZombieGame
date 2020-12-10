///@function DamagePlayer(player, damage)

function DamagePlayer(_player, _damage)
{
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

///@function DamageZombie(playerID, zombie, damage)

function DamageZombie(_playerID, _zombie, _damage)
{
	if(CheckBuff(_playerID, Buff.Critical)and random(1) <= DataBase.criticalBuffEffect)
		_damage *= 2;
		
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
}