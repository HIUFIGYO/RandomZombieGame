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
				
		DamagePlayer(_player, DataBaseGetWeapon(weapon, WeapStat.Damage) * SetStat(0.5, 1, 2, 4), "FriendlyFire", playerID.name);
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