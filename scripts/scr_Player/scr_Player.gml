///@function CycleGear(id, cycle)

function CycleGear(_id, _cycle)
{	
	var keepCycling = true;
	while(keepCycling)
	{
		_id.equipmentCycle += _cycle;
		if(_id.equipmentCycle < EquipCycle.Weapon)
			_id.equipmentCycle = EquipCycle.Support;
		if(_id.equipmentCycle > EquipCycle.Support)
			_id.equipmentCycle = EquipCycle.Weapon;
		
		switch(_id.equipmentCycle)
		{
			case EquipCycle.Weapon:
				keepCycling = false;
				break;
			
			case EquipCycle.Med:
				if(_id.healingItem != noone)
					keepCycling = false;
				break;
			
			case EquipCycle.Vial:
				if(_id.vial != noone and _id.vialCooldown <= 0)
					keepCycling = false;
				break;
			
			case EquipCycle.Support:
				if(_id.supportItem != noone)
					keepCycling = false;
				break;
		}	
	}
}

///@function ProcessEquipment(id)

function ProcessEquipment(_id)
{
	switch(_id.equipmentCycle)
	{
		case EquipCycle.Weapon:
			if(_id.weapon[_id.currentWeapon] == noone)
				break;
			
			var shoot = false;
			if(InputGetButtonDown(_id.player_inputID, Button.Shoot))
			{
				_id.autoFire = DataWeapon(_id.weapon[_id.currentWeapon], WeapStat.Auto);
				shoot = true;
			}
	
			if(_id.autoFire and InputGetButton(_id.player_inputID, Button.Shoot))
			{
				shoot = true;
			}
			
			if(InputGetButtonUp(_id.player_inputID, Button.Shoot))
			{
				_id.autoFire = false;
			}
	
			if(shoot)
			{
				if(_id.mag[_id.currentWeapon] > 0 and _id.reloadTimer[_id.currentWeapon] <= 0)
				{
					_id.canShoot = false;
					if(!CheckVialPositive(_id, VialType.Rapid))
						_id.mag[_id.currentWeapon] -= 1;
					_id.shootTimer = DataWeapon(_id.weapon[_id.currentWeapon], WeapStat.FireRate) * game_get_speed(gamespeed_fps);
					
					if(CheckVialPositive(_id, VialType.Rapid))
						_id.shootTimer /= 2;
					
					var offset = 0;
					if(_id.isCrouching)
						offset = _id.crouchOffset;
					CreateBullet(id, x, y + offset, _id.weapon[_id.currentWeapon], image_xscale, _id.isCrouching);
				}
				else
				{
					WeaponReload(id, _id.weapon[_id.currentWeapon]);
				}
				return true;
			}
			break;
			
		case EquipCycle.Med:
			if(_id.healingItemTimer <= 0 and InputGetButtonDown(_id.player_inputID, Button.Shoot))
			{
				_id.canShoot = false;
				_id.healingItemTimer = DataBase.healingTimer[_id.healingItem];
				return true;
			}
			break;
			
		case EquipCycle.Vial:
			if(_id.vialActive or _id.vialCooldown > 0)
			{
				CycleGear(_id, 1);
				break;
			}
			
			if(InputGetButtonDown(_id.player_inputID, Button.Shoot))
			{
				_id.vialActive = true;
				_id.currentVial = _id.vial;
				_id.vialCooldown = VialGetCooldown(_id.vial);
				_id.vialPositiveTimer = VialGetTimer(_id.vial);
				_id.vialNegativeTimer = VialGetTimer(_id.vial) * 2;
				_id.equipmentCycle = EquipCycle.Weapon;
				return true;	
			}
			break;
			
		case EquipCycle.Support:
			if (_id.canPlaceSupport and InputGetButtonDown(_id.player_inputID, Button.Shoot))
			{
				CreateSupportItem(_id);
				_id.supportItem = noone;
				CycleGear(_id, 1);
				return true;
			}
			break;
	}
	
	return false;
}

///@function PlayerMelee(player)

function PlayerMelee(_player)
{
	if(!CheckVialPositive(_player, VialType.Strength))
		_player.stamina -= 10;
	_player.canShoot = false;
	_player.meleeSubImage = 0;
	_player.canSpawnMeleeHB = true;
	_player.isMelee = true;
}

///@function PlayerAnimate(player)

function PlayerAnimate(_player)
{
	if(_player.isWalking)
	{
		var walkingAnimSpeed = 0.6;
		if(_player.maxSpeed == _player.sprintSpeed)
			walkingAnimSpeed = 1;
		_player.walking_index += walkingAnimSpeed * DeltaTime();
		if(_player.walking_index >= sprite_get_number(_player.spriteLegs))
			_player.walking_index = 0;	
	}

	if(_player.isMelee)
	{
		_player.staminaWaitTimer = _player.staminaWaitTime;
		var index = 0;
		if(_player.meleeWeapon == Weapon.Knife2)
			index = 1;
		else if(_player.meleeWeapon == Weapon.Knife3)
			index = 2;
		else if(_player.meleeWeapon == Weapon.Knife4)
			index = 3;
		
		_player.meleeSubImage += DataWeapon(_player.meleeWeapon, WeapStat.FireRate) * DeltaTime();
	
		if(_player.meleeSubImage >= 2 and _player.canSpawnMeleeHB)
		{
			var bonus = 1;
			if(CheckVialPositive(_player, VialType.Strength))
				bonus = 2;
			_player.canSpawnMeleeHB = false;
			var inst = CreateHitBox(_player, x, y, spr_meleeHitBoxes, index, DataWeapon(_player.meleeWeapon, WeapStat.Damage) * bonus);
			inst.pierce = DataWeapon(_player.meleeWeapon, WeapStat.Pierce);
			inst.image_xscale = image_xscale;
		}
		if(_player.meleeSubImage >= sprite_get_number(_player.spriteMelee[index]) - 1)
		{
			_player.canShoot = true;
			_player.isMelee = false;
			_player.meleeSubImage = 0;
		}
	}

	if(_player.isThrowing)
	{
		_player.throwSubImage += DeltaTime();
		if(_player.throwSubImage >= sprite_get_number(_player.spriteThrow))
		{
			_player.grenadeAmount -= 1;
			if(CheckBuff(_player, Buff.Demo)and random(1) <= DataBase.demoBuffChanceGrenadeNotConsume)
				_player.grenadeAmount += 1;
			_player.canShoot = true;
			_player.isThrowing = false;
			_player.throwSubImage = 0;
			CreateGrenade(_player);
		}
	}
}

///@function WeaponReload(player, weapon)

function WeaponReload(_player, _weapon)
{
	if(_weapon == noone)
		return;
	
	if(_player.equipmentCycle != EquipCycle.Weapon)
		return;
		
	if(_player.reloadTimer[_player.currentWeapon] > 0 or ammo[_player.currentWeapon] <= 0)
		return;
		
	var additionalTime = 0;
	if(CanCancelReload(_weapon))
	{
		_player.reloadSingleShot[_player.currentWeapon] = 1;
		if(DataWeapon(_weapon, WeapStat.Mag) <= _player.ammo[_player.currentWeapon])
			additionalTime = GetMaxMag(_player, _player.currentWeapon) - _player.mag[_player.currentWeapon] - 1;
		else
			additionalTime = _player.ammo[_player.currentWeapon] - 1;
	}
	var bonus = CheckBuff(_player, Buff.Reload);
	_player.reloadTimer[_player.currentWeapon] = max(1, (DataWeapon(_weapon, WeapStat.Reload) + additionalTime) - (bonus * DataBase.reloadBuffEffect));
}