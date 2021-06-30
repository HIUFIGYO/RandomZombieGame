///@function ZombieCheckLineOfSite()

function ZombieCheckLineOfSite()
{
	if(collision_line(x, y - 32, target.x, target.y - 32, BlockParent, false, true))
		return true;
			
	var _noBarricades = true;
	var _barricades = ds_list_create();
	var _count = collision_line_list(x, y - 32, target.x, target.y - 32, Barricade, false, true, _barricades, false);
		
	for(var i=0; i<_count; i++)
	{
		if(_barricades[| i].canCollideZombie)
		{
			_noBarricades = false;
			break;
		}
	}
		
	ds_list_destroy(_barricades);
			
	if(!_noBarricades)
		return true;
	
	return false;
}

///@function BioZombieRadiationAura()

function BioZombieRadiationAura()
{	
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
	if(_zombie.dodgeCooldown > 0 or _zombie.isAttacking)
		return false;
		
	if(!ZombieCheckZombieState(_zombie, ZombieStateTwitcher))
		return false;
		
	if(random(1) <= SetStat(0.45, 0.6, 0.75, 0.9))
	{
		ZombieChangeZombieState(_zombie, ZombieStateVoid);
		_zombie.dodgeUsed = true;
		_zombie.sprite_index = spr_twitcherevade;
		_zombie.image_index = 0;
		PhysicsObjectSetSpeed(_zombie, choose(-1, 1) * 20, _zombie.ySpeed);
		return true;
	}
	return false;
}

///@function TwitcherDodgeCooldown()

function TwitcherDodgeCooldown()
{	
	if(dodgeCooldown > 0)
	{
		dodgeCooldown -= DeltaTimeSecond();
		if(dodgeCooldown <= 0)
			dodgeCooldown = 0;
	}	
}

///@function ZombiePinButtonMash()

function ZombiePinButtonMash()
{
	var xInput = InputGetButtonDown(target.player_inputID, Button.Right) - InputGetButtonDown(target.player_inputID, Button.Left);
	
	if(xInput == 0)
		return;
		
	if(pinButtonMash == 0)
	{
		pinButtonMash = xInput;
		pinButtonCount++;
		return;
	}
	
	if(pinButtonMash == 1 and xInput == -1)
	{
		pinButtonMash = xInput;
		pinButtonCount++;
		return;
	}
	
	if(pinButtonMash == -1 and xInput == 1)
	{
		pinButtonMash = xInput;
		pinButtonCount++;
		return;
	}
}

///@function RipperSawBladeAttack()

function RipperSawBladeAttack()
{
	if(specialUsed)
		return;
		
	if(!isAttacking and target != noone and distance_to_object(target) <= attackRange)
	{
		if(ZombieCheckLineOfSite())
			return;
		
		isAttacking = true;
		specialUsed = true;
		sprite_index = spr_ripperatk3;
		image_speed = 0.5;
		ZombieChangeState(ZombieStateVoid);
	}
}

///@function SpewerArmCannon()

function SpewerArmCannon()
{
	if(specialUsed or specialCooldown > 0 or target == noone)
		return; 

	var range = sqr(x - target.x) + sqr(y - target.y);
	if(range >= sqr(specialMinRange) and range <= sqr(specialMaxRange))
	{	
		if(ZombieCheckLineOfSite())
			return;
			
		specialUsed = true;
		sprite_index = spr_spewershoot;
		image_index = 0;
		image_speed = 0.5;
		xSpeed = 0;
		ZombieChangeState(ZombieStateVoid);
	}
}

///@function ZombieSpecialCooldown()

function ZombieSpecialCooldown()
{
	if(specialCooldown <= 0)
		return;
	
	specialCooldown -= DeltaTimeSecond();
	if(specialCooldown <= 0)
	{
		specialCooldown = 0;
		specialUsed = false;
	}
}

///@function InfernoFlameThrower()

function InfernoFlameThrower()
{
	if(specialUsed or specialCooldown > 0 or target == noone)
		return;

	var range = sqr(x - target.x) + sqr(y - target.y);
	if(range >= sqr(specialMinRange) and range <= sqr(specialMaxRange))
	{
		if(ZombieCheckLineOfSite())
			return;
			
		specialAmmo = specialAmmoMax;
		specialUsed = true;
		sprite_index = spr_infernoatk2;
		image_index = 0;
		image_speed = 0.5;
		xSpeed = 0;
		ZombieChangeState(ZombieStateInfernoFlame);
	}
}

///@function InfernoFlameThrowerActive()

function InfernoFlameThrowerActive()
{
	if(specialUsed and image_speed = 0)
	{
		specialFireTimer += DeltaTimeSecond();
	
		if(target != noone)
			image_xscale = target.x >= x ? 1 : -1;
	
		if(specialFireTimer < specialFireRate)
			return;

		specialFireTimer = 0;
		specialAmmo--;
		ZombieCreateProjectile(FireProjectile);
		
		if(specialAmmo > 0)
			return;
			
		isAttacking = false;
		sprite_index = spriteIdle;
		specialCooldown = cooldownTime;
		ZombieChangeState(ZombieStateInferno);
	}
}
