///@function BioZombieRadiationAura()

function BioZombieRadiationAura()
{
	if(IsDead(id))
		return;
		
	radTimer += DeltaTimeSecond();

	if (radTimer < radTime)
		return;
		
	radTimer = 0;
		
	CollisionCirleList(x, y, radRange, Player, BioZombieAuraCollisionPlayer);
	CollisionCirleList(x, y, radRange, ZombieParent, BioZombieAuraCollisionZombie);
}

///@function BioZombieAuraCollisionPlayer(player)

function BioZombieAuraCollisionPlayer(_player)
{
	DamagePlayerHealth(_player, radDamage * radTime, "Radiation");
	if random(1) <= SetStat(0.15, 0.3, 0.45, 0.6)
		DebuffApply(_player, DeBuff.Radiation);
}

///@function BioZombieAuraCollisionZombie(zombie)

function BioZombieAuraCollisionZombie(_zombie)
{
	if(_zombie.name == "Bio Zombie")
		return;
	
	HealZombie(_zombie, radDamage * radTime);
	if random(1) <= SetStat(0.15, 0.3, 0.45, 0.6)
		DebuffApply(_zombie, DeBuff.Radiation, noone);
}

///@function TwitcherDodge(zombie)

function TwitcherDodge(_zombie)
{
	if(_zombie.dodgeCooldown > 0 or _zombie.dodgeUsed or _zombie.isAttacking)
		return false;
		
	if(random(1) <= SetStat(0.2, 0.3, 0.4, 0.5))
	{
		_zombie.dodgeUsed = true;
		_zombie.specialActive = true;
		return true;
	}
	return false;
}

///@function TwitcherProcessDodge()

function TwitcherProcessDodge()
{
	if(isDead)
		return;
	
	if(dodgeCooldown > 0)
	{
		dodgeCooldown -= DeltaTimeSecond();
		if(dodgeCooldown <= 0)
			dodgeCooldown = 0;
	}
	
	if(!dodgeUsed)
		return;
	if(sprite_index == spr_twitcherevade)
		return;
	
	sprite_index = spr_twitcherevade;
	image_index = 0;
	xSpeed = 0;
	PhysicsObjectSetSpeed(id, choose(-1, 1) * 20, ySpeed);
}

///@function RipperSawBladeAttack()

function RipperSawBladeAttack()
{
	if(specialCooldown > 0)
	{
		specialCooldown -= DeltaTimeSecond();
		if(specialCooldown <= 0)
		{
			specialCooldown = 0;
			specialUsed = false;
		}
	}

	if(!specialUsed)
	{
		if(!isAttacking and target != noone and distance_to_object(target) <= attackRange)
		{
			xSpeed = 0;
			specialUsed = true;
			specialActive = true;
			sprite_index = spr_ripperatk3;
			image_speed = 0.5;
		}
	}
}
