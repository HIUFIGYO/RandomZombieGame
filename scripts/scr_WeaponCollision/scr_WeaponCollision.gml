///@function BulletCollideBlockParent(blockParent)

function BulletCollideBlockParent(_blockParent)
{
	instance_destroy();
}

///@function BulletCollideBarricade(barricade)

function BulletCollideBarricade(_barricade)
{
	if(_barricade.canCollideBullet and _barricade.canCollidePlayer)
		instance_destroy();
}

///@function BulletCollidePlayer(player)

function BulletCollidePlayer(_player)
{
	if(CheckVialNegative(_player, VialType.Mimicry))
	{
		if(IsDead(_player) or _player.hp <= 0)
			return true;
			
		if(weapon == Weapon.Flame)
			DebuffApply(_player, DeBuff.Ignite, playerID);
		if(weapon == Weapon.Drainer)
			DebuffApply(_player, DeBuff.Bleed, playerID);
				
		DamagePlayer(_player, DataBaseGetWeapon(weapon, WeapStat.Damage) * SetStat(0.5, 1, 1.5, 2), "FriendlyFire", playerID.name);
		GameSprayBlood(GameGetBloodAmount(), x, y, false, image_xscale);
		return true;
	}
	else
		return false;
}

///@function BulletCollideZombie(zombie)

function BulletCollideZombie(_zombie)
{
	if(IsDead(_zombie) or _zombie.hp <= 0)
		return true;
			
	var _damage = DataBaseGetWeapon(weapon, WeapStat.Damage);
	if(!ignoreBuffs and CheckBuff(playerID, Buff.Damage))
	{
		switch(weapon)
		{
			case Weapon.BHDarker:
			case Weapon.Purple:
			case Weapon.Drainer:
				_damage += DataBase.damageBuffMythic;
				break;
						
			case Weapon.Flame:
				_damage += DataBase.damageBuffFire;
				break;
					
			case Weapon.Tesla:
				_damage += DataBase.damageBuffElectric;
				break;
					
			default:
				if(DataBaseGetWeapon(weapon, WeapStat.Burst) <= 1)
					_damage += DataBase.damageBuffBullet;
				break;
		}
	}
			
	if(weapon == Weapon.Flame)
		DebuffApply(_zombie, DeBuff.Ignite, playerID);
	if(weapon == Weapon.Drainer)
		DebuffApply(_zombie, DeBuff.Bleed, playerID);
				
	if(!ignoreBuffs and CheckVialPositive(playerID, VialType.TradeOff))
		_damage *= 2;
				
	DamageZombie(playerID, _zombie, _damage, ignoreBuffs);
	
	if(ignoreBuffs)
		EndStatAdd(playerID.playerID, EndStat.SupportDamage, _damage);
	
	if(IsDead(_zombie) and !ignoreBuffs)
	{
		if(DataBaseGetWeapon(weapon, WeapStat.Type) == WeapType.Primary)
			EndStatAdd(playerID.playerID, EndStat.PrimeKills, 1);
		else if(DataBaseGetWeapon(weapon, WeapStat.Type) == WeapType.SideArm)
			EndStatAdd(playerID.playerID, EndStat.SecondKills, 1);
	}
	
	if(_zombie.name == "Twitcher" and _zombie.dodgeUsed)
		return true;
			
	if(weapon == Weapon.BHDarker and IsDead(_zombie))
	{
		CreateBlackHole(playerID, ZombieGetMaxHealth(_zombie));
	}
	GameSprayBlood(GameGetBloodAmount(), x, y, _zombie.acid, image_xscale);
				
	pierce -= 1;
	if(pierce > 0)
		return true;
	else
	{
		instance_destroy();
		return false;
	}
}

///@function ExplosionCollideZombie(zombie)

function ExplosionCollideZombie(_zombie)
{
	if(maxHits <= 0)
		return true;
	
	ExplosionPush(_zombie, id, ExplosionGetDamage(explosionType));
		
	if(IsDead(_zombie))
		return false;
	
	maxHits -= 1;
		
	var _damage = ExplosionGetDamage(explosionType);
		
	if(_damage > 0)
	{
		GameSprayBlood(_damage, x, y, _zombie.acid, 0);
		if(playerID != noone and CheckBuff(playerID, Buff.Damage))
			_damage += DataBase.damageBuffExplosive;
	}
		
	if(acid)
		DebuffApply(_zombie, DeBuff.Acid, playerID);
			
	if(!_zombie.invincible and _zombie.hp - _damage <= 0)
		_zombie.gibFlag = true;
		
	DamageZombie(playerID, _zombie, _damage, false);
		
	if(explosionType == ExplosionType.BHBomber and !spawnedBH and IsDead(_zombie))
	{
		spawnedBH = true;
		CreateBlackHole(playerID, ZombieGetMaxHealth(_zombie));
	}
	
	return true;
}

///@function ExplosionCollideSupport(support)

function ExplosionCollideSupport(_support)
{
	return true;
}

///@function ExplosionCollidePhysicsObject(object)

function ExplosionCollidePhysicsObject(_object)
{
	if(_object.canPush)
		ExplosionPush(_object, id, ExplosionGetDamage(explosionType));
	return true;
}

///@function ExplosionCollidePlayer(player)

function ExplosionCollidePlayer(_player)
{
	if(maxHits <= 0)
		return true;
	
	if(playerID != noone and !CheckVialNegative(_player, VialType.Mimicry))
	{
		if(_player != playerID)
			return true;
	}
		
	ExplosionPush(_player, id, ExplosionGetDamage(explosionType));
		
	if(IsDead(_player))
		return true;

	maxHits -= 1;
		
	var _damage = ExplosionGetDamage(explosionType);

	if(playerID != noone and CheckBuff(playerID, Buff.Damage) and _damage > 0)
		_damage += DataBase.damageBuffExplosive;
		
	DamagePlayer(_player, _damage * SetStat(0.5, 1, 1.5, 2), "Explosion");

	if(_damage > 0)
		GameSprayBlood(_damage, _player.x, y, false, 0);
		
	return true;
}

///@function GroundFireCollidePlayer(player)

function GroundFireCollidePlayer(_player)
{	
	if(playerID != noone and !CheckVialNegative(_player, VialType.Mimicry))
	{
		if(_player != playerID)
			return true;
	}

	DamagePlayer(_player, DataBaseIncendiaryGroundFire() * SetStat(0.5, 1, 1.5, 2), "FriendlyFire", _player.name);
	if(random(1) <= DataBaseIncendiaryIgniteChance() / 2)
	{
		DebuffApply(_player, DeBuff.Ignite);
	}
	
	return true;
}

///@function GroundFireCollideZombie(zombie)

function GroundFireCollideZombie(_zombie)
{
	DamageZombie(playerID, _zombie, DataBaseIncendiaryGroundFire());
	if(playerID != noone and random(1) <= DataBaseIncendiaryIgniteChance())
	{
		DebuffApply(_zombie, DeBuff.Ignite, playerID);
	}
	return true;
}

///@function HitBoxCollideZombie(zombie)

function HitBoxCollideZombie(_zombie)
{
	if(IsDead(_zombie) or pierce <= 0 or GamePaused())
		return true;

	pierce -= 1;

	var _damage = damage;

	if(CheckBuff(playerID, Buff.Damage))
		_damage += DataBase.damageBuffMelee;
	
	if(playerID.meleeWeapon == Weapon.Knife4 and random(1) <= 0.35)
	{
		DebuffApply(_zombie, DeBuff.Ignite, playerID);
	}

	DamageZombie(playerID, _zombie, _damage);
	GameSprayBlood(GameGetBloodAmount(), _zombie.x, _zombie.y - (_zombie.bbox_bottom - _zombie.bbox_top) /2, _zombie.acid, _zombie.image_xscale);

	if(IsDead(_zombie))
		EndStatAdd(playerID.playerID, EndStat.MeleeKills, 1);
		
	return true;
}

///@function HitBoxCollidePlayer(player)

function HitBoxCollidePlayer(_player)
{
	if(IsDead(_player) or pierce <= 0 or playerID == _player or !CheckVialNegative(_player, VialType.Mimicry) or GamePaused())
		return true;

	pierce -= 1;

	var _damage = damage;

	if(CheckBuff(playerID, Buff.Damage))
		_damage += DataBase.damageBuffMelee;
	
	if(playerID.meleeWeapon == Weapon.Knife4 and random(1) <= 0.35)
	{
		DebuffApply(_player, DeBuff.Ignite);
	}

	DamagePlayer(_player, _damage * SetStat(0.5, 1, 1.5, 2), "FriendlyFire", playerID.name);
	GameSprayBlood(GameGetBloodAmount(), _player.x, _player.y - (_player.bbox_bottom - _player.bbox_top) /2, false, _player.image_xscale);
	
	return true;
}
