///@function DamageZombie(playerID, zombie, damage, ignoreBuffs)

function DamageZombie(_playerID, _zombie, _damage, ignoreBuffs)
{
	ignoreBuffs = is_undefined(ignoreBuffs) ? false : ignoreBuffs;
	
	if(_playerID != noone)
	{
		if(!ignoreBuffs)
		{
			//bonuses			
			if(CheckBuff(_playerID, Buff.Critical)and random(1) <= DataBase.criticalBuffEffect)
				_damage *= 2;
		
			if(CheckBuff(_playerID, Buff.Scout))
			{
				_zombie.showHealth = true;
				_zombie.showHealthTimer = DataBase.scoutBuffShowHealthTime;
				if(_zombie.hp <= _zombie.maxHp * DataBase.scoutBuffHealthRate)
					_damage += DataBase.scoutBuffDamage;
			}
		
			//penalties
			if(CheckVialNegative(_playerID, VialType.Survivalist))
				_damage *= 0.25;
		}
		
		//money
		var moneyGained = _damage;
		if(_damage > _zombie.hp)
			moneyGained = _zombie.hp;
		moneyGained *= (5 - global.difficulty);
		PlayerGiveMoney(_playerID, moneyGained);
	}
	
	_zombie.hp -= _damage;
	with(_zombie)
		event_perform(ev_other, ev_user1);
	if(_zombie.hp <= 0 and !_zombie.isDead)
	{
		GameZombieDead(_zombie, _playerID);
		GameSprayBlood(GameGetBloodAmount(), _zombie.x, _zombie.y - (_zombie.bbox_bottom - _zombie.bbox_top) / 2, _zombie.acid, 0);
	}
}

///@function ZombieCreateBurst(zombie, amount)

function ZombieCreateBurst(_zombie, _amount)
{
	repeat(_amount)
	{
		var inst = instance_create_layer(_zombie.x, _zombie.y - (_zombie.bbox_bottom - _zombie.bbox_top) / 2, GameManager.layerObject, BursterProjectile);
		inst.xSpeed = irandom_range(-20, 20);
		inst.ySpeed = -irandom_range(10, 32);
	}
}









