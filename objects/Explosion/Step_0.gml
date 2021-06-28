var hits = ds_list_create();

var count = instance_place_list(x, y, all, hits, false);

for(var i=0; i<count; i++)
{
	if( maxHits <= 0 )
		break;
	
	if(object_is_ancestor(hits[| i].object_index, ZombieParent))
	{		
		ExplosionPush(hits[| i], id, ExplosionGetDamage(explosionType));
		
		if(IsDead(hits[| i]))
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
		maxHits -= 1;
		
		var _damage = ExplosionGetDamage(explosionType);
		
		if(_damage > 0)
		{
			GameSprayBlood(_damage, x, y, hits[| i].acid, 0);
			if(playerID != noone and CheckBuff(playerID, Buff.Damage))
				_damage += DataBase.damageBuffExplosive;
		}
		
		if(acid)
			DebuffApply(hits[| i], DeBuff.Acid, playerID);
			
		if(hits[| i].hp - _damage <= 0)
			hits[| i].gibFlag = true;
		
		DamageZombie(playerID, hits[| i], _damage, false);
		
		if(explosionType == ExplosionType.BHBomber and !spawnedBH and IsDead(hits[| i]))
		{
			spawnedBH = true;
			CreateBlackHole(playerID, ZombieGetMaxHealth(hits[| i]));
		}

		continue;
	}
	
	if(object_is_ancestor(hits[| i].object_index, Support))
		continue;
	
	if(object_is_ancestor(hits[| i].object_index, PhysicsObject))
	{
		if(hits[| i].canPush)
			ExplosionPush(hits[| i], id, ExplosionGetDamage(explosionType));
		continue;
	}
	
	if(hits[| i].object_index == Player)
	{
		if(!CheckVialNegative(hits[| i], VialType.Mimicry))
		{
			if(hits[| i] != playerID)
				continue;
		}
		
		ExplosionPush(hits[| i], id, ExplosionGetDamage(explosionType));
		
		if(IsDead(hits[| i]))
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
		maxHits -= 1;
		
		var _damage = ExplosionGetDamage(explosionType);

		if(playerID != noone and CheckBuff(playerID, Buff.Damage) and _damage > 0)
			_damage += DataBase.damageBuffExplosive;
		
		DamagePlayer(hits[| i], _damage * SetStat(0.5, 1, 1.5, 2), "Explosion");

		if(_damage > 0)
			GameSprayBlood(_damage, x, y, false, 0);
	}
}

ds_list_destroy(hits);