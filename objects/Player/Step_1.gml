//health regen
if(!isDead)
	hpRegenTimer -= DeltaTimeSecond();
if(hpRegenTimer <= 0)
{
	var bonus = 0;
	var _playerCount = instance_number(Player);
	for(var i=0; i<_playerCount; i++)
	{
		var _player = instance_find(Player, i);
		if(_player != id and CheckBuff(_player, Buff.Medic)and distance_to_object(_player) <= DataBase.medicBuffRange)
			bonus += DataBase.medicBuffRegenHealth;
	}
	HealPlayer(id, hpRegenRate + bonus);
	bonus = 1;
	if(CheckBuff(id, Buff.Regeneration))
		bonus = DataBase.regenBuffEffect;
	hpRegenTimer = (hpRegenTime + global.difficulty) * bonus;
}
hp = clamp(hp, 0, GetMaxHealth(id));

//stamina regen
staminaWaitTimer -= DeltaTimeSecond();
if(staminaWaitTimer <= 0)
{
	stamina += staminaRegenRate * DeltaTimeSecond();
	stamina = clamp(stamina, 0, GetMaxStamina(id));
}

//revive
if(revivingPlayer != noone)
{
	var bonus = 1;
	if(CheckBuff(id, Buff.Medic))
		bonus = DataBase.medicBuffReviveFactor;
	if(revivingPlayer.isDead)
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
	var startHealth = GetMaxHealth(id) * SetStat(0.8, 0.6, 0.4, 0.2);
	RevivePlayer(id, startHealth);
	reviveTimer = reviveTime;
}

//buff cool downs
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
		buffCooldown[_slot] = DataBase.resistBuffCooldown;
	}
}

//debuffs
UpdateDebuffs(id, true);

//check support item collision
if (equipmentCycle = EquipCycle.Support)
{
	var _x = x+supportXOffset * image_xscale,
		_y = y+supportYOffset;
	var _collision = collision_rectangle(_x, _y, _x+sprite_get_width(DataBase.supportSprite[supportItem])*image_xscale, _y-sprite_get_height((DataBase.supportSprite[supportItem])), all, false, true);
	canPlaceSupport = (_collision == noone or object_get_name(_collision.object_index) == "Player") ? true : false;
}

//interact with objects
if(InputGetButtonDown(player_inputID, Button.Interact)and !isDead)
{
	var _door = instance_nearest(x, y, WoodenDoor);
	if(DistanceToObject(id, _door, 32))
		with(_door)
			event_perform(ev_other, ev_user0);
	
	var returnObject = noone;
	var priority = 0;

	var objList = ds_list_create();
	var _count = collision_rectangle_list(bbox_left, y-32, bbox_right, y, all, false, true, objList, false);
	
	if(_count > 0)
	{
		for(var i=0; i<_count; i++)
		{
			var _name = object_get_name(objList[| i].object_index);
			if(_name == "Player" and objList[| i].isDead)
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
	}

	ds_list_destroy(objList);
	
	if(returnObject != noone)
	{
		switch(object_get_name(returnObject.object_index))
		{
			case "Player":
				revivingPlayer = returnObject;
				revivingPlayer.revivePlayerCount++;
				break;
				
			case "WeaponDrops":
				if(reloadTimer[currentWeapon] <= 0)
				{
					instance_destroy(returnObject);
					var inst = noone;
					var weapID = noone;
					var weapMag = 0;
					var weapAmmo = 0;
					var type = DataWeapon(returnObject.weapon_id, WeapStat.Type);
					if(type == WeapType.Primary)
					{
						if(weapon[0] != noone)
							{
								weapID = weapon[0];
								weapMag = mag[0];
								weapAmmo = ammo[0];
								inst = instance_create_layer(x, y -64, GameManager.layerObject, WeaponDrops);
							}
						weapon[0] = returnObject.weapon_id;
						mag[0] = returnObject.mag;
						ammo[0] = returnObject.ammo;
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
						weapon[1] = returnObject.weapon_id;
						mag[1] = returnObject.mag;
						ammo[1] = returnObject.ammo;
					}
					else if(type == WeapType.Melee)
					{
						if(meleeWeapon != noone)
						{
							weapID = meleeWeapon;
							inst = instance_create_layer(x, y-64, GameManager.layerObject, WeaponDrops);
						}
						meleeWeapon = returnObject.weapon_id;
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
					HUDCreateShop(playerID);
				}
				break;
		}
	}
}