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

///@function GiveWeapon(player, item, slot)

function GiveWeapon(_player, _item, _slot)
{
	_player.weapon[_slot] = _item;
	_player.ammo[_slot] = DataBaseGetWeapon(_item, WeapStat.Ammo);
	_player.mag[_slot] = DataBaseGetWeapon(_item, WeapStat.Mag);
	_player.reloadTimer[_slot] = 0;
	
	if(CheckBuff(_player, Buff.Ammo))
	{
		var _ammo = ceil((DataBase.ammoBuffAmmo - 1) * DataBaseGetWeapon(_player.weapon[_slot], WeapStat.Ammo));
		var _mag = floor((DataBase.ammoBuffMag - 1) * DataBaseGetWeapon(_player.weapon[_slot], WeapStat.Mag));
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
				var _ammo = ceil((DataBase.ammoBuffAmmo - 1) * DataBaseGetWeapon(_player.weapon[i], WeapStat.Ammo));
				var _mag = floor((DataBase.ammoBuffMag - 1) * DataBaseGetWeapon(_player.weapon[i], WeapStat.Mag));
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
				
				if(_player.ammo[i] > DataBaseGetWeapon(_player.weapon[i], WeapStat.Ammo))
					_player.ammo[i] = DataBaseGetWeapon(_player.weapon[i], WeapStat.Ammo);
				if(_player.mag[i] > DataBaseGetWeapon(_player.weapon[i], WeapStat.Mag))
					_player.mag[i] = DataBaseGetWeapon(_player.weapon[i], WeapStat.Mag);
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
	_player.healingItemAmount = DataBaseMedicalGetUses(_item);
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

