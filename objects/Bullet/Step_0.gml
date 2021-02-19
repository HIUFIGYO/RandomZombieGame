//range
rangeTimer--;
if(rangeTimer <= 0)
{
	if(weapon == Weapon.Flame or weapon == Weapon.Tesla)
		instance_destroy();
	gravity = 1;
}

//move
x += xSpeed * spd * DeltaTime();
y += ySpeed * spd * DeltaTime();

//check collisions
var hits = ds_list_create();
var count = collision_line_list(xprevious, yprevious, x, y, all, false, true, hits, false);
if(count > 0)
{
	var destroy = false;
	for(var i=0; i<count; i++)
	{
		var hit = object_get_name(object_get_parent(hits[| i].object_index));
		if(hit == "BlockParent")
		{
			destroy = true;
		}
		
		if(hit == "Barricade")
		{
			if(hits[| i].canCollideBullet and hits[| i].canCollidePlayer)
				destroy = true;
		}
		
		if(object_get_name(hits[| i].object_index) == "Player")
		{
			if(CheckVialNegative(hits[| i], VialType.Mimicry))
			{
				if(!ds_exists(targetsHit, ds_type_list))
					targetsHit = ds_list_create();
				if(hits[| i].isDead or hits[| i].hp <= 0)
					continue;
					
				var alreadyHit = false;
				for(var playerHit=0; playerHit<ds_list_size(targetsHit); playerHit++)
				{
					if(targetsHit[| playerHit] == hits[| i])
					{
						alreadyHit = true;
						break;
					}
				}
			
				if(alreadyHit)
					continue;
				
				ds_list_add(targetsHit, hits[| i]);
			
				if(weapon == Weapon.Flame)
					DebuffApply(hits[| i], DeBuff.Ignite, playerID);
				if(weapon == Weapon.Drainer)
					DebuffApply(hits[| i], DeBuff.Bleed, playerID);
				
				DamagePlayer(hits[| i], DataWeapon(weapon, WeapStat.Damage), "FriendlyFire", playerID.name);
				GameSprayBlood(GameGetBloodAmount(), x, y, false, image_xscale);
				continue;
			}
			else
				continue;
		}
		
		if(hit == "ZombieParent")
		{
			if(!ds_exists(targetsHit, ds_type_list))
				targetsHit = ds_list_create();
			if(hits[| i].isDead or hits[| i].hp <= 0)
				continue;
			var alreadyHit = false;
			for(var zombieHit=0; zombieHit<ds_list_size(targetsHit); zombieHit++)
			{
				if(targetsHit[| zombieHit] == hits[| i])
				{
					alreadyHit = true;
					break;
				}
			}
			
			if(alreadyHit)
				continue;
				
			ds_list_add(targetsHit, hits[| i]);
			
			var _damage = DataWeapon(weapon, WeapStat.Damage);
			if(!ignoreBuffs and CheckBuff(playerID, Buff.Damage))
			{
				switch(weapon)
				{
					case Weapon.BHDarker:
					case Weapon.Purple:
					case Weapon.Drainer:
						break;
						
					case Weapon.Flame:
						_damage += DataBase.damageBuffFire;
						break;
					
					case Weapon.Tesla:
						_damage += DataBase.damageBuffElectric;
						break;
					
					default:
						if(DataWeapon(weapon, WeapStat.Burst) <= 1)
							_damage += DataBase.damageBuffBullet;
						break;
				}
			}
			
			if(weapon == Weapon.Flame)
				DebuffApply(hits[| i], DeBuff.Ignite, playerID);
			if(weapon == Weapon.Drainer)
				DebuffApply(hits[| i], DeBuff.Bleed, playerID);
				
			if(!ignoreBuffs and CheckVialPositive(playerID, VialType.TradeOff))
				_damage *= 2;
				
			DamageZombie(playerID, hits[| i], _damage, ignoreBuffs);
			GameSprayBlood(GameGetBloodAmount(), x, y, hits[| i].acid, image_xscale);
				
			pierce -= 1;
			if(pierce > 0)
				continue;
			else
			{
				destroy = true;
				break;
			}
		}
	}
	if(destroy)
		instance_destroy();
}

ds_list_destroy(hits);