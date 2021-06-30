///@function ZombieChangeState(newState)

function ZombieChangeState(_newState)
{
	isChangingState = true;
	nextState = _newState;
}

///@function ZombieChangeZombieState(zombie, newState)

function ZombieChangeZombieState(_zombie, _newState)
{
	_zombie.isChangingState = true;
	_zombie.nextState = _newState;
}

///@function ZombieCheckState(state)

function ZombieCheckState(_state)
{
	return (currentState == _state and !isChangingState);
}

///@function ZombieCheckZombieState(zombie, state)

function ZombieCheckZombieState(_zombie, _state)
{
	return (_zombie.currentState == _state and !_zombie.isChangingState);
}

///@function ZombieStateDefault()

function ZombieStateDefault()
{
	ZombieStateBehaviour();
	ZombieAttack();
}

///@function ZombieStateBehaviour()

function ZombieStateBehaviour()
{
	UpdateDebuffs(id, false);
	ZombieFindTarget();
	ZombieHealthDisplayTimer();
	ZombieAddVelocity();
	ZombieAnimate();
	ZombieCheckCollision();
	ZombieTranslate();
}

///@function ZombieStateVoid()

function ZombieStateVoid()
{
	UpdateDebuffs(id, false);
	ZombieHealthDisplayTimer();
	
	if(xSpeed != 0 and instance_place(x, y+1, BlockParent))
			xSpeed = lerp(0, xSpeed, friction);
	ySpeed += grav;
	ySpeed = min(ySpeed, maxFallSpeed);
	
	ZombieCheckCollision();
	ZombieTranslate();
}

///@function ZombieStatePause()

function ZombieStatePause()
{
	return;
}

///@function ZombieStateDead()

function ZombieStateDead()
{
	image_speed = 0;
	sprite_index = spriteDead;
	color = c_white;
	ZombieFadeOut();
	ZombieAddVelocity();
	ZombieCheckCollision();
	ZombieTranslate();
}

///@function ZombieStateSpewer()

function ZombieStateSpewer()
{
	ZombieStateDefault();
	ZombieSpecialCooldown();
	SpewerArmCannon();
}

///@function ZombieStateInjector()

function ZombieStateInjector()
{
	ZombieStateDefault();
	
	ZombieSpecialCooldown();
	
	if(!specialUsed and !isAttacking and target != noone and !target.isGrabbed and DistanceToObject(id, target, specialRange))
	{
		if(ZombieCheckLineOfSite())
			return;
		
		specialUsed = true;
		clawDraw = true;
		sprite_index = spr_injectorGrabStartup;
		image_index = 0;
		image_speed = 0.5;
		ZombieChangeState(ZombieStateVoid);
	}
}

///@function ZombieStateInjectorClaw()

function ZombieStateInjectorClaw()
{
	ZombieStateVoid();
	
	if(clawCanGrab)
	{
		clawPos += clawSpeed;
		if(clawPos >= clawMaxDist)
		{
			clawPos = clawMaxDist;
			clawCanGrab = false;
			grabTarget = noone;
			return;
		}
		
		var _player = collision_circle(x + clawPos*image_xscale, y, 3, Player, false, true);
		if(_player and !_player.isGrabbed)
		{
			clawCanGrab = false;
			grabTarget = _player;
			grabTarget.isGrabbed = true;
			grabTarget.canMove = false;
		}
	}
	else
	{
		clawPos -= clawReturnSpeed;
		
		ZombiePinButtonMash();
	
		if(grabTarget != noone and pinButtonCount >= hp)
		{
			specialCooldown = specialCooldownTime;
			clawPos = clawOffset;
			clawCanGrab = true;
			grabTarget.isGrabbed = false;
			grabTarget.canMove = true;
			grabTarget = noone;
			pinButtonMash = 0;
			pinButtonCount = 0;
			ZombieChangeState(ZombieStateInjector);
			return;
		}
		
		if(clawPos > clawOffset)
			return;
		
		clawPos = clawOffset;
		clawDraw = false;
		if(grabTarget == noone)
		{
			specialCooldown = specialCooldownTime;
			clawPos = clawOffset;
			clawCanGrab = true;
			ZombieChangeState(ZombieStateInjector);
		}
		else
		{
			sprite_index = spr_injectoratk2;
			image_index = 0;
			image_speed = 0.5;
			ZombieChangeState(ZombieStateVoid);
		}
	}
}

///@function ZombieStateTwitcher()

function ZombieStateTwitcher()
{
	ZombieStateDefault();
	
	TwitcherDodgeCooldown();
	
	if(pounceCooldown > 0)
		pounceCooldown -= DeltaTimeSecond();
		
	if(isAttacking)
		return;
	
	if(pounceCooldown <= 0)
	{
		if(target and DistanceToObject(id, target, pounceDistance))
		{
			if(ZombieCheckLineOfSite())
			return;
			
			ZombieChangeState(ZombieStateTwitcherLeap);
			pounceUsed = false;
			image_speed = 0;
			image_index = 0;
			sprite_index = spr_twitcherpounce;
			leapTimer = 0.5;
		}
	}
}

///@function ZombieStateTwitcherLeap()

function ZombieStateTwitcherLeap()
{
	ZombieStateVoid();
	
	if(pounceUsed and place_meeting(x, y+1, BlockParent))
	{
		pounceCooldown = pounceCooldownTime;
		ZombieChangeState(ZombieStateTwitcher);
		return;
	}
	
	if(pounceUsed and !target.isGrabbed and place_meeting(x, y, target))
	{
		pinButtonCount = 0;
		pounceCooldown = pounceCooldownTime;
		sprite_index = spr_twitcherpin;
		image_index = 0;
		image_speed = 1;
		grabTarget = target;
		target.isGrabbed = true;
		target.isPinned = true;
		target.canMove = false;
		target.isInMenu = true;
		CreateAccessoryPickUp(target);
		ZombieChangeState(ZombieStateTwitcherPin);
	}
}

///@function ZombieStateTwitcherPin()

function ZombieStateTwitcherPin()
{
	ZombieStateVoid();
	
	ZombiePinButtonMash();
	
	if(IsDead(target))
	{
		target.isGrabbed = false;
		target.isPinned = false;
		target.canMove = true;
		target.isInMenu = false;
		grabTarget = noone;
		ZombieChangeState(ZombieStateTwitcher);
		return;
	}
	
	if(pinButtonCount >= hp)
	{
		target.isGrabbed = false;
		target.isPinned = false;
		target.canMove = true;
		target.isInMenu = false;
		grabTarget = noone;
		PhysicsObjectPush(id, 16, x-image_xscale*16, y-8);
		ZombieChangeState(ZombieStateTwitcher);
	}
	
	if(image_index == 8 or image_index = image_number - 1)
	{
		DamagePlayer(target, pinDamage, "Zombie", name);
	}
}

///@function ZombieStateCreeper()

function ZombieStateCreeper()
{
	UpdateDebuffs(id, false);
	//Timer
	if(switchTimer > 0)
	{
		switchTimer -= DeltaTimeSecond();
		if(switchTimer <= 0)
		{
			switchTimer = random_range(switchTargetMin, switchTargetMax);
			protectAlpha = choose(false, true);
		}
	}
	
	//Find target
	if(!protectAlpha)
		ZombieFindTarget();
	else
		target = alphaCreeperID;
	
	ZombieHealthDisplayTimer();
	ZombieAddVelocity();
	ZombieAnimate();
	ZombieCheckCollision();
	ZombieTranslate();
	if(target != alphaCreeperID)
		ZombieAttack();
}

///@function ZombieStateBio()

function ZombieStateBio()
{
	ZombieStateDefault();
	if(hasRad)
		BioZombieRadiationAura();
}

///@function ZombieStateInferno()

function ZombieStateInferno()
{
	ZombieStateDefault();
	ZombieSpecialCooldown();
	InfernoFlameThrower();
}

///@function ZombieStateInfernoFlame()

function ZombieStateInfernoFlame()
{
	ZombieStateVoid();
	InfernoFlameThrowerActive();
}

///@function ZombieStateRipper()

function ZombieStateRipper()
{
	ZombieStateBehaviour();
	ZombieSpecialCooldown();
	RipperSawBladeAttack();
	ZombieAttack();
}