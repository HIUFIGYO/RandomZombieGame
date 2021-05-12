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

///@function PlayerInteractEvacPod(evacPod)

function PlayerInteractEvacPod(evacPod)
{
	if(!evacPod.open 
	or evacPod.waitTime < 1
	or evacPod.image_index < evacPod.image_number - 1
	or !DistanceToObject(id, evacPod, 10))
		return;
		
	evacPod.open = false;
	evacPod.waitTime = 0;
	evacPod.evacSuccess = true;
	
	canMove = false;
	isInMenu = true;
	fadeOut -= DeltaTimeSecond();
	evacPodInst = evacPod;
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