enum EquipCycle
{
	Weapon,
	Med,
	Vial,
	Support
}

enum HealingType
{
	Medicine,
	Syringe,
	MedKit
}

enum SupportType
{
	Barricade,
	AdvBarricade,
	Turret,
	HealGenerator,
	AmmoCrate,
	HeavyCrate,
	MythicCrate,
	SupplyFlare
}

///@function HealingUse(playerFrom, playerTo)

function HealingUse(_playerFrom, _playerTo)
{
	if(_playerFrom.healingItem == noone) return;
	
	HealPlayer(_playerTo, 20);
	
	_playerFrom.healingItemAmount -= 1;
	if(CheckBuff(_playerFrom, Buff.Medic)and random(1) <= DataBase.medicBuffChanceItemNotConsume)
		_playerFrom.healingItemAmount += 1;
	
	if(_playerFrom.healingItemAmount <= 0)
		_playerFrom.healingItem = noone;
}

///@function TraceLaser(id, flip, startX, startY)

function TraceLaser(_id, _flip, _startX, _startY)
{
	var i = 0, inst;
	while(i < 1000)
	{
		i++;
		inst = collision_line(_startX, _startY, _startX + 16 * image_xscale, _startY, BlockParent, false, true);
		if(inst)
		{
			if(_flip > 0)
				return inst.bbox_left;
			else
				return inst.bbox_right;
		}
	
		inst = collision_line(_startX, _startY, _startX + 16 * image_xscale, _startY, Barricade, false, true);
		if(inst and inst.canCollideBullet and inst.canCollidePlayer)
		{
			if(image_xscale > 0)
				return inst.bbox_left;
			else
				return inst.bbox_right;
		}
	
		_startX += 16 * image_xscale;
	}
}

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
				if(_id.vial != noone)
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
			var auto = DataWeapon(_id.weapon[_id.currentWeapon], WeapStat.Auto);
			var shoot = false;
			if(!auto and InputGetButtonDown(_id.player_inputID, Button.Shoot))
			{
				shoot = true;
			}
	
			if(auto and InputGetButton(_id.player_inputID, Button.Shoot))
			{
				shoot = true;
			}
	
			if(shoot)
			{
				if(_id.mag[_id.currentWeapon] > 0 and _id.reloadTimer[_id.currentWeapon] <= 0)
				{
					_id.canShoot = false;
					_id.mag[_id.currentWeapon] -= 1;
					_id.shootTimer = DataWeapon(_id.weapon[_id.currentWeapon], WeapStat.FireRate) * game_get_speed(gamespeed_fps);
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
			break;
			
		case EquipCycle.Support:
			if (_id.canPlaceSupport and InputGetButtonDown(_id.player_inputID, Button.Shoot))
			{
				var _inst = instance_create_layer(x+_id.supportXOffset * image_xscale, y+_id.supportYOffset, GameManager.layerObject, DataBase.supportObject[_id.supportItem]);
				_inst.image_xscale = image_xscale;
				_inst.playerID = _id;
				_id.supportItem = noone;
				CycleGear(_id, 1);
				return true;
			}
			break;
	}
	
	return false;
}