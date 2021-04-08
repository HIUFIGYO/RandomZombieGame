///@function HealZombie(zombie, amount)

function HealZombie(_zombie, _amount)
{
	if(IsDead(_zombie))
		return;
	
	_zombie.hp = clamp(_zombie.hp + _amount, 0, ZombieGetMaxHealth(_zombie));
}

///@function DamageZombie(playerID, zombie, damage, ignoreBuffs)

function DamageZombie(_playerID, _zombie, _damage, ignoreBuffs)
{
	if(IsDead(_zombie)or _damage == 0)
		return;
	
	if(_zombie.invincible)
		return;
		
	if(_zombie.name == "Twitcher")
		if(TwitcherDodge(_zombie))
			return;
	
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
				
			if(CheckDebuff(_zombie, DeBuff.Radiation))
				_damage *= DataBase.deBuffZombieDamageTaken;
		}
		
		//money
		var moneyGained = _damage;
		if(_damage > _zombie.hp)
			moneyGained = _zombie.hp;
		moneyGained *= (5 - global.difficulty);
		PlayerGiveMoney(_playerID, moneyGained);
	}
	
	_zombie.hp -= _damage;

	if(_zombie.hp <= 0 and !_zombie.isDead)
	{
		_zombie.specialActive = false;
		GameZombieDead(_zombie, _playerID);
		GameSprayBlood(GameGetBloodAmount(), _zombie.x, _zombie.y - (_zombie.bbox_bottom - _zombie.bbox_top) / 2, _zombie.acid, 0);
	}
	
	with(_zombie)
		event_perform(ev_other, ev_user1);
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

///@function ZombieCreateSpewShot(zombie)

function ZombieCreateSpewShot(_zombie)
{
	var inst = instance_create_layer(_zombie.x, _zombie.y - (_zombie.bbox_bottom - _zombie.bbox_top) / 2, GameManager.layerObject, SpewerProjectile);
	if(_zombie.target != noone)
	{
		inst.xSpeed = _zombie.target.x - _zombie.x;
		inst.ySpeed = (_zombie.target.y - 16) - (_zombie.y - (_zombie.bbox_bottom - _zombie.bbox_top) / 2);
		var _length = sqrt(sqr(inst.xSpeed)+sqr(inst.ySpeed));
		if(_length != 0)
		{
			inst.xSpeed /= _length;
			inst.ySpeed /= _length;
			inst.xSpeed *= inst.moveSpeed;
			inst.ySpeed *= inst.moveSpeed;
		}
	}
	else
	{
		inst.xSpeed = 28 * image_xscale;
		inst.ySpeed = 0;
	}
}

///@function ZombieCreateSpewerExplosion(id)

function ZombieCreateSpewerExplosion(_id)
{
	instance_create_layer(_id.x, _id.y, GameManager.layerObject, SpewerExplosion);
}

///@function ZombieFindTarget()

function ZombieFindTarget()
{
	var targetCount = instance_number(Player);
	var targets = ds_grid_create(2, targetCount);
	for(var i=0; i<targetCount; i++)
	{
		var _player = instance_find(Player, i);
		ds_grid_add(targets, 0, i, _player);
		ds_grid_add(targets, 1, i, distance_to_object(_player));
	}
	ds_grid_sort(targets, 1, true);

	target = noone;
	for(i=0; i<targetCount; i++)
	{
		if(!IsDead(targets[# 0, i]) and !CheckVialPositive(targets[# 0, i], VialType.Mimicry))
		{
			target = targets[# 0, i];
			break;
		}
	}

	ds_grid_destroy(targets);
}






