///@function PlayerInvincibilityTimer()

function PlayerInvincibilityTimer()
{
	if(invincible > 0)
	{
		invincible -= DeltaTimeSecond();
		if(invincible <= 0)
			invincible = 0;
	}
}

///@function PlayerHealthRegeneration()

function PlayerHealthRegeneration()
{
	if(!isDead)
		hpRegenTimer -= DeltaTimeSecond();
	if(hpRegenTimer <= 0)
	{
		var bonus = 0;
		var _playerCount = instance_number(Player);
		for(var i=0; i<_playerCount; i++)
		{
			var _player = instance_find(Player, i);
			if(_player != id and CheckBuff(_player, Buff.Medic)and distance_to_object(_player) <= DataBaseBuffMedicRange())
				bonus += DataBaseBuffRegenHealth();
		}
		HealPlayer(id, hpRegenRate + bonus);
		bonus = 1;
		if(CheckBuff(id, Buff.Regeneration))
			bonus = DataBaseBuffRegenEffect();
		hpRegenTimer = (hpRegenTime + global.difficulty) * bonus;
	}
	hp = clamp(hp, 0, GetMaxHealth(id));
}

///@function PlayerStaminaRegeneration()

function PlayerStaminaRegeneration()
{
	staminaWaitTimer -= DeltaTimeSecond();
	if(staminaWaitTimer <= 0)
	{
		var bonus = 1;
		if(CheckVialNegative(id, VialType.Adrenaline))
			bonus = 0;
		stamina += staminaRegenRate * DeltaTimeSecond() * bonus;
		stamina = clamp(stamina, 0, GetMaxStamina(id));
	}
}

///@function PlayerProcessRevive()

function PlayerProcessRevive()
{
	if(revivingPlayer != noone)
	{
		var bonus = 1;
		if(CheckBuff(id, Buff.Medic))
			bonus = DataBaseBuffReviveFactor();
		if(IsDead(revivingPlayer))
			revivingPlayer.reviveTimer -= DeltaTimeSecond() * bonus;
		if(InputGetButtonUp(player_inputID, Button.Interact)or !instance_place(x, y, revivingPlayer)or isDead)
		{
			revivingPlayer.revivePlayerCount--;
			revivingPlayer = noone;
		}
	}

	if(revivePlayerCount == 0 and reviveTimer < reviveTime)
	{
		reviveTimer += DeltaTimeSecond();
		reviveTimer = clamp(reviveTimer, 0, reviveTime);
	}

	if(reviveTimer <= 0)
	{
		var startHealth = GetMaxHealth(id) * SetStat(0.5, 0.4, 0.3, 0.2);
		RevivePlayer(id, startHealth, 3);
		reviveTimer = reviveTime;
	}
}

///@function PlayerBuffCooldown()

function PlayerBuffCooldown()
{
	for(var i=0; i<2; i++)
	{
		if(buffCooldown[i] > 0 and !isDead)
			buffCooldown[i] -= DeltaTimeSecond();
	}
	if(damageResistanceTimer > 0)
	{
		damageResistanceTimer -= DeltaTimeSecond();
		if(damageResistanceTimer <= 0)
		{
			var _slot = GetBuffSlot(id, Buff.Resistance);
			buffCooldown[_slot] = DataBaseBuffResistCooldown();
		}
	}
}

///@function PlayerUseMedicalItem()

function PlayerUseMedicalItem()
{
	if(healingItemTimer <= 0)
		return;
		
	healingItemTimer -= DeltaTimeSecond();
	if(healingItemTimer <= 0 and healingItem != noone)
	{
		canShoot = true;
		healingItemTimer = 0;
		
		if(healingID == noone)
			return;
		
		HealPlayer(healingID, DataBaseMedicalGetAmount(healingItem));
		HealDebuffs(healingID, healingItem);
		healingItemAmount -= 1;
		if(healingItemAmount <= 0)
		{
			healingItem = noone;
			CycleGear(1);
		}
	}
}

///@function PlayerProcessVials()

function PlayerProcessVials()
{
	if(vialCooldown > 0)
	{
		var tick = DeltaTimeSecond();
		vialCooldown -= tick;
		if(vialPositiveTimer > 0)
			vialPositiveTimer -= tick;
		if(vialNegativeTimer > 0)
			vialNegativeTimer -= tick;
		if(vialCooldown <= 0)
		{
			vialActive = false;
			vialCooldown = 0;
		}
	}
}

///@function PlayerCalculateSupportCollision()

function PlayerCalculateSupportCollision()
{
	if (equipmentCycle = EquipCycle.Support)
	{
		var _x = x+supportXOffset * image_xscale,
			_y = y+supportYOffset,
			_sprite = DataBaseSupportGetSprite(supportItem),
			_left = sprite_get_bbox_left(_sprite),
			_right = sprite_get_bbox_right(_sprite),
			_up = -sprite_get_bbox_top(_sprite),
			_down = -sprite_get_height(_sprite) + sprite_get_bbox_bottom(_sprite);
		
		if(image_xscale < 0)
		{
			_left = -sprite_get_width(_sprite) + sprite_get_bbox_left(_sprite);
			_right = -sprite_get_width(_sprite) + sprite_get_bbox_right(_sprite);
		}
		canPlaceSupport = true;
		var hits = ds_list_create();
		var _collisions = collision_rectangle_list(_x+_left, _y+_up, _x+_right, _y+_down, all, false, true, hits, false);
	
		if(_collisions > 0)
		{
			for(var i=0; i<_collisions; i++)
			{
				var _objectName = object_get_name(hits[| i].object_index);
				if(_objectName == "Bullet" or _objectName == "Player" or _objectName == "Grenade" or _objectName == "WeaponDrops")
					continue;
			
				if(object_get_name(object_get_parent(hits[| i].object_index)) == "ZombieParent")
				{
					if(IsDead(hits[| i]))
						continue;
					canPlaceSupport = false;
					break;
				}	
				canPlaceSupport = false;
				break;
			}
		}
	
		ds_list_destroy(hits);
	}
}

///@function PlayerInteractWithDoor()

function PlayerInteractWithDoor()
{
	var _door = instance_nearest(x, y, WoodenDoor);
	if(_door and DistanceToObject(id, _door, 32))
		with(_door)
			event_perform(ev_other, ev_user0);
}

///@function PlayerFindInteractible()

function PlayerFindInteractible()
{
	var returnObject = noone;
	var priority = 0;

	var objList = ds_list_create();
	var _count = collision_rectangle_list(bbox_left, y-32, bbox_right, y, all, false, true, objList, false);
	
	for(var i=0; i<_count; i++)
	{
		var _name = object_get_name(objList[| i].object_index);
		if(_name == "Player" and IsDead(objList[| i]))
		{
			returnObject = objList[| i];
			break;
		}
		else if(_name == "WeaponDrops")
		{
			if(priority < 2)
			{
				returnObject = objList[| i];
				priority = 1;
			}
		}
		else if(_name == "AmmoCrate" or _name == "HeavyCrate" or _name == "MythicCrate")
		{
			if(priority < 1)
			{
				returnObject = objList[| i];
				priority = 2;
			}
		}
		else if(_name == "Shop")
		{
			if(priority == 0)
			{
				returnObject = objList[| i];
			}
		}
	}

	ds_list_destroy(objList);
	
	return returnObject;
}

///@function PlayerProcessInteractible(interactible)

function PlayerProcessInteractible(returnObject)
{
	switch(object_get_name(returnObject.object_index))
		{
		case "Player":
			revivingPlayer = returnObject;
			revivingPlayer.revivePlayerCount++;
			break;
				
		case "WeaponDrops":
			PlayerWeaponPickUp(returnObject);
			break;
				
		case "AmmoCrate":
		case "HeavyCrate":
		case "MythicCrate":
			returnObject.lastPlayerUse = id;
			with(returnObject)
				event_perform(ev_other, ev_user0);
			break;
				
		case "Shop":
			if(canMove)
			{
				canMove = false;
				isInMenu = true;
				HUDCreateShop(id);
			}
			break;
	}
}

///@function PlayerWeaponPickUp(weaponPickUp)

function PlayerWeaponPickUp(weaponPickUp)
{
	if(reloadTimer[currentWeapon] <= 0)
	{
		instance_destroy(weaponPickUp);
		var inst = noone;
		var weapID = noone;
		var weapMag = 0;
		var weapAmmo = 0;
		var type = DataBaseGetWeapon(weaponPickUp.weapon_id, WeapStat.Type);
		if(type == WeapType.Primary)
		{
			if(weapon[0] != noone)
				{
					weapID = weapon[0];
					weapMag = mag[0];
					weapAmmo = ammo[0];
					inst = instance_create_layer(x, y -64, GameManager.layerObject, WeaponDrops);
				}
			weapon[0] = weaponPickUp.weapon_id;
			mag[0] = weaponPickUp.mag;
			ammo[0] = weaponPickUp.ammo;
		}
		else if(type == WeapType.SideArm)
		{
			if(weapon[1] != noone)
			{
				weapID = weapon[1];
				weapMag = mag[1];
				weapAmmo = ammo[1];
				inst = instance_create_layer(x, y-64, GameManager.layerObject, WeaponDrops);
			}
			weapon[1] = weaponPickUp.weapon_id;
			mag[1] = weaponPickUp.mag;
			ammo[1] = weaponPickUp.ammo;
		}
		else if(type == WeapType.Melee)
		{
			if(meleeWeapon != noone)
			{
				weapID = meleeWeapon;
				inst = instance_create_layer(x, y-64, GameManager.layerObject, WeaponDrops);
			}
			meleeWeapon = weaponPickUp.weapon_id;
		}
	
		if(inst != noone)
		{
			inst.ySpeed = -10;
			inst.xSpeed = irandom_range(-5, 5);
			inst.weapon_id = weapID;
			inst.mag = weapMag;
			inst.ammo = weapAmmo;
			inst.image_index = weapID;
		}
	}
}
