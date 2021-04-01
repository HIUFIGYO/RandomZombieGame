///@function ProcessEquipment()

function ProcessEquipment()
{
	switch(equipmentCycle)
	{
		case EquipCycle.Weapon:
			if(weapon[currentWeapon] == noone)
				break;
			
			var shoot = false;
			if(InputGetButtonDown(player_inputID, Button.Shoot))
			{
				autoFire = DataBaseGetWeapon(weapon[currentWeapon], WeapStat.Auto);
				shoot = true;
			}
	
			if(autoFire and InputGetButton(player_inputID, Button.Shoot))
			{
				shoot = true;
			}
			
			if(InputGetButtonUp(player_inputID, Button.Shoot))
			{
				autoFire = false;
			}
	
			if(shoot)
			{
				if(mag[currentWeapon] > 0 and reloadTimer[currentWeapon] <= 0)
				{
					canShoot = false;
					if(!CheckVialPositive(id, VialType.Rapid))
						mag[currentWeapon] -= 1;
					shootTimer = DataBaseGetWeapon(weapon[currentWeapon], WeapStat.FireRate) * game_get_speed(gamespeed_fps);
					
					if(CheckVialPositive(id, VialType.Rapid))
						shootTimer /= 2;
					
					var offset = 0;
					if(isCrouching)
						offset = crouchOffset;
					CreateBullet(id, x, y + offset, weapon[currentWeapon], image_xscale, isCrouching);
					audio_play_sound(DataBaseGetWeapon(weapon[currentWeapon], WeapStat.Sound), 0, false);
				}
				else
				{
					WeaponReload(weapon[currentWeapon]);
				}
				return true;
			}
			break;
			
		case EquipCycle.Med:
			if(healingItemTimer > 0)
				break;
				
			var canHeal = false, inst = id;
				
			if(InputGetButtonDown(player_inputID, Button.Assist))
			{
				inst = collision_circle(x, y, 32, Player, false, true);
				if(inst)
					canHeal = true;
			}
		
			if(InputGetButtonDown(player_inputID, Button.Shoot))
			{
				canHeal = true;
				inst = id;
			}
			
			if(canHeal)
			{
				canShoot = false;
				healingItemTimer = DataBaseMedicalGetTimer(healingItem);
				healingID = inst;
				return true;
			}
			break;
			
		case EquipCycle.Vial:
			if(vialActive or vialCooldown > 0)
			{
				CycleGear(1);
				break;
			}
			
			if(InputGetButtonDown(player_inputID, Button.Shoot))
			{
				vialActive = true;
				currentVial = vial;
				vialCooldown = DataBaseVialGetCooldown(vial);
				vialPositiveTimer = DataBaseVialGetTimer(vial);
				vialNegativeTimer = DataBaseVialGetTimer(vial) * 2;
				equipmentCycle = EquipCycle.Weapon;
				return true;	
			}
			break;
			
		case EquipCycle.Support:
			if (canPlaceSupport and InputGetButtonDown(player_inputID, Button.Shoot))
			{
				CreateSupportItem(id);
				supportItem = noone;
				CycleGear(1);
				return true;
			}
			break;
	}
	
	return false;
}

///@function CycleGear(cycle)

function CycleGear(_cycle)
{	
	var keepCycling = true;
	while(keepCycling)
	{
		equipmentCycle += _cycle;
		if(equipmentCycle < EquipCycle.Weapon)
			equipmentCycle = EquipCycle.Support;
		if(equipmentCycle > EquipCycle.Support)
			equipmentCycle = EquipCycle.Weapon;
		
		switch(equipmentCycle)
		{
			case EquipCycle.Weapon:
				keepCycling = false;
				break;
			
			case EquipCycle.Med:
				if(healingItem != noone)
					keepCycling = false;
				break;
			
			case EquipCycle.Vial:
				if(vial != noone and vialCooldown <= 0)
					keepCycling = false;
				break;
			
			case EquipCycle.Support:
				if(supportItem != noone)
					keepCycling = false;
				break;
		}	
	}
}

///@function PlayerMelee()

function PlayerMelee()
{
	audio_play_sound(DataBaseGetWeapon(meleeWeapon, WeapStat.Sound), 0, false);
	if(!CheckVialPositive(id, VialType.Strength))
		stamina -= 10;
	canShoot = false;
	meleeSubImage = 0;
	canSpawnMeleeHB = true;
	isMelee = true;
}

///@function WeaponReload(weapon)

function WeaponReload(_weapon)
{
	if(_weapon == noone)
		return;
	
	if(equipmentCycle != EquipCycle.Weapon)
		return;
		
	if(reloadTimer[currentWeapon] > 0 or ammo[currentWeapon] <= 0)
		return;
		
	var additionalTime = 0;
	if(CanCancelReload(_weapon))
	{
		reloadSingleShot[currentWeapon] = 1;
		if(DataBaseGetWeapon(_weapon, WeapStat.Mag) <= ammo[currentWeapon])
			additionalTime = GetMaxMag(id, currentWeapon) - mag[currentWeapon] - 1;
		else
			additionalTime = ammo[currentWeapon] - 1;
	}
	var bonus = CheckBuff(id, Buff.Reload);
	reloadTimer[currentWeapon] = max(1, (DataBaseGetWeapon(_weapon, WeapStat.Reload) + additionalTime) - (bonus * DataBase.reloadBuffEffect));
}