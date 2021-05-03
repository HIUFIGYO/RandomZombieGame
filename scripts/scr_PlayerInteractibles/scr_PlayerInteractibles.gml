///@function PlayerInteractible(object, hookFunction)

function PlayerInteractible(_object, hookFunction)
{
	var inst = instance_place(x, y, _object);
	if(inst)
	{
		if(hookFunction(inst))
			return true;
	}
	return false;
}

///@function PlayerInteractPlayer(player)

function PlayerInteractPlayer(_player)
{
	if(!IsDead(_player))
		return false;
		
	revivingPlayer = _player;
	revivingPlayer.revivePlayerCount++;
	return true;
}

///@function PlayerInteractWeaponDrop(weaponDrop)

function PlayerInteractWeaponDrop(_weaponDrop)
{
	PlayerWeaponPickUp(_weaponDrop);
	return true;
}

///@function PlayerInteractHealGen(healGen)

function PlayerInteractHealGen(_healGen)
{
	_healGen.on = !_healGen.on;
	return true;
}

///@function PlayerInteractAmmoCrate(ammoCrate)

function PlayerInteractAmmoCrate(_ammoCrate)
{
	_ammoCrate.lastPlayerUse = id;
		with(_ammoCrate)
			event_perform(ev_other, ev_user0);
	return true;
}

///@function PlayerInteractShop(shop)

function PlayerInteractShop(shop)
{
	if(canMove and global.shopID.isOpen)
	{
		canMove = false;
		isInMenu = true;
		HUDCreateShop(id);
		return true;
	}
	return false;
}