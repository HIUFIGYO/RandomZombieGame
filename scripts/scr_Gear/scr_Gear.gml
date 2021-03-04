enum EquipCycle
{
	Weapon,
	Med,
	Vial,
	Support
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

///@function TraceLaser(flip, startX, startY)

function TraceLaser(_flip, _startX, _startY)
{
	var i = 0, inst;
	while(i < 1000)
	{
		i += 16;
		inst = collision_line(_startX, _startY, _startX + 16 * _flip, _startY, BlockParent, false, true);
		if(inst)
		{
			if(_flip > 0)
				return inst.bbox_left;
			else
				return inst.bbox_right;
		}
	
		inst = collision_line(_startX, _startY, _startX + 16 * _flip, _startY, Barricade, false, true);
		if(inst and inst.canCollideBullet and inst.canCollidePlayer)
		{
			if(_flip > 0)
				return inst.bbox_left;
			else
				return inst.bbox_right;
		}
	
		_startX += 16 * _flip;
	}
	
	if(_flip > 0)
		return room_width;
	else
		return 0;
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
				var _inst = instance_create_layer(x+_id.supportXOffset * image_xscale, y+_id.supportYOffset, GameManager.layerObject, SupportGetObject(_id.supportItem));
				if(_id.supportItem == SupportType.Turret)
					_inst.laserColor = _id.head_color;
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

///@function GiveWeapon(player, item, slot)

function GiveWeapon(_player, _item, _slot)
{
	_player.weapon[_slot] = _item;
	_player.ammo[_slot] = DataWeapon(_item, WeapStat.Ammo);
	_player.mag[_slot] = DataWeapon(_item, WeapStat.Mag);
	_player.reloadTimer[_slot] = 0;
	
	if(CheckBuff(_player, Buff.Ammo))
	{
		var _ammo = ceil((DataBase.ammoBuffAmmo - 1) * DataWeapon(_player.weapon[_slot], WeapStat.Ammo));
		var _mag = floor((DataBase.ammoBuffMag - 1) * DataWeapon(_player.weapon[_slot], WeapStat.Mag));
		_player.ammo[_slot] += _ammo;
		_player.mag[_slot] += _mag;
	}
}

///@function GiveMelee(player, item)

function GiveMelee(_player, _item)
{
	_player.meleeWeapon = _item;
}

///@function GiveBuff(player, buff, slot)

function GiveBuff(_player, _buff, _slot)
{
	RemoveBuff(_player, _slot);
	
	_player.buff[_slot] = _buff;
	_player.buffCooldown[_slot] = 0;
	
	switch(_buff)
	{
		case Buff.Health:
			HealPlayer(_player, (DataBase.healthBuffEffect - 1) * _player.maxHp);
			break;
			
		case Buff.Ammo:
			for(var i=0; i<2; i++)
			{
				if(_player.weapon[i] == noone)
					continue;
				var _ammo = ceil((DataBase.ammoBuffAmmo - 1) * DataWeapon(_player.weapon[i], WeapStat.Ammo));
				var _mag = floor((DataBase.ammoBuffMag - 1) * DataWeapon(_player.weapon[i], WeapStat.Mag));
				_player.ammo[i] += _ammo;
				_player.mag[i] += _mag;
				
				if(_player.ammo[i] > GetMaxAmmo(_player, i))
					_player.ammo[i] = GetMaxAmmo(_player, i);
				if(_player.mag[i] > GetMaxMag(_player, i))
					_player.mag[i] = GetMaxMag(_player, i);
			}
			break;
			
		case Buff.Demo:
			if(_player.grenadeType != noone)
			{
				_player.grenadeAmount += DataBase.demoBuffAddGrenade;
				if(_player.grenadeAmount > GetMaxGrenades(_player))
					_player.grenadeAmount = GetMaxGrenades(_player);
			}
			break;
			
		case Buff.Stamina:
			_player.stamina = GetMaxStamina(_player);
			break;
	}
}

///@function RemoveBuff(player, slot)

function RemoveBuff(_player, _slot)
{
	if(_player.buff[_slot] == noone)
		return;
	
	switch(_player.buff[_slot])
	{
		case Buff.Health:
			_player.hp -= (DataBase.healthBuffEffect - 1) * _player.maxHp;
			break;
			
		case Buff.Ammo:
			for(var i=0; i<2; i++)
			{
				if(_player.weapon[i] == noone)
					continue;
				
				if(_player.ammo[i] > DataWeapon(_player.weapon[i], WeapStat.Ammo))
					_player.ammo[i] = DataWeapon(_player.weapon[i], WeapStat.Ammo);
				if(_player.mag[i] > DataWeapon(_player.weapon[i], WeapStat.Mag))
					_player.mag[i] = DataWeapon(_player.weapon[i], WeapStat.Mag);
			}
			break
			
		case Buff.Demo:
			if(_player.grenadeType != noone)
			{
				if(_player.grenadeAmount > DataBase.explosionMaxAmmo)
					_player.grenadeAmount = DataBase.explosionMaxAmmo;
			}
			break;
			
		case Buff.Stamina:
			if(_player.stamina > _player.maxStamina)
				_player.stamina = _player.maxStamina;
			break;
	}
	
	_player.buff[_slot] = noone;
}

///@function GiveExplosive(player, item)

function GiveExplosive(_player, _item)
{
	_player.grenadeType = _item;
	_player.grenadeAmount = DataBase.explosionMaxAmmo;
}

///@function GiveMedical(player, item)

function GiveMedical(_player, _item)
{
	_player.healingItem = _item;
	_player.healingItemAmount = DataBase.healingAmount[_item];
	_player.healingItemAmount = DataBase.healingUses[_item];
}

///@function GiveVial(player, item)

function GiveVial(_player, _item)
{
	_player.vial = _item;
}

///@function GiveSupport(player, item)

function GiveSupport(_player, _item)
{
	_player.supportItem = _item;
}

///@function GiveArmour(player)

function GiveArmour(_player)
{
	_player.armour = _player.maxArmour;
}

///@function DropMoney(player, amount)

function DropMoney(_player, _amount)
{
	if(_player.money <= 0)
		return;
	
	if(_player.money < _amount)
		_amount = _player.money;
	
	var inst = instance_create_layer(_player.x, _player.y - 32, GameManager.layerObject, CashDrop);
	inst.playerID = _player;
	inst.xSpeed = _player.image_xscale * 10;
	inst.ySpeed = -8;
	inst.value = _amount;
	_player.money -= _amount;
}

