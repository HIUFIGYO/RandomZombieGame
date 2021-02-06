var hits = ds_list_create();

var count = instance_place_list(x, y, all, hits, false);

for(var i=0; i<count; i++)
{
	var hit = object_get_name(object_get_parent(hits[| i].object_index));
	
	if(hit == "ZombieParent")
	{
		ExplosionPush(hits[| i], id, 32);
		
		if(hits[| i].isDead)
			continue;
		if(!ds_exists(targetsAlreadyHit, ds_type_list))
			targetsAlreadyHit = ds_list_create();
		var alreadyHit = false;
		for(var targetHit=0; targetHit<ds_list_size(targetsAlreadyHit); targetHit++)
		{
			if(targetsAlreadyHit[| targetHit] == hits[| i])
			{
				alreadyHit = true;
				break;
			}
		}
		
		if(alreadyHit)
			continue;
			
		ds_list_add(targetsAlreadyHit, hits[| i]);
		
		var _damage = ExplosionGetDamage(grenadeType);

		if(CheckBuff(playerID, Buff.Damage) and _damage > 0)
			_damage += DataBase.damageBuffExplosive;
	
		DamageZombie(playerID, hits[| i], _damage);

		if(_damage > 0)
			GameSprayBlood(_damage, x, y, hits[| i].acid, 0);
		continue;
	}
	
	
	
	if(hit == "PhysicsObject")
	{
		ExplosionPush(hits[| i], id, ExplosionGetDamage(grenadeType));
		continue;
	}
	
	if(object_get_name(hits[| i].object_index) == "Player")
	{
		if(!CheckVialNegative(hits[| i], VialType.Mimicry))
		{
			if(hits[| i] != playerID)
				continue;
		}
		
		ExplosionPush(hits[| i], id, 32);
		
		if(hits[| i].isDead)
			continue;
		if(!ds_exists(targetsAlreadyHit, ds_type_list))
			targetsAlreadyHit = ds_list_create();
		var alreadyHit = false;
		for(var targetHit=0; targetHit<ds_list_size(targetsAlreadyHit); targetHit++)
		{
			if(targetsAlreadyHit[| targetHit] == hits[| i])
			{
				alreadyHit = true;
				break;
			}
		}
		
		if(alreadyHit)
			continue;
			
		ds_list_add(targetsAlreadyHit, hits[| i]);
		
		var _damage = ExplosionGetDamage(grenadeType);

		if(CheckBuff(playerID, Buff.Damage) and _damage > 0)
			_damage += DataBase.damageBuffExplosive;
	
		DamagePlayer(playerID, _damage, "Explosion");

		if(_damage > 0)
			GameSprayBlood(_damage, x, y, false, 0);
	}
}

ds_list_destroy(hits);