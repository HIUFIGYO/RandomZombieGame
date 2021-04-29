///@function ZombieChangeState(newState)

function ZombieChangeState(_newState)
{
	isChangingState = true;
	nextState = _newState;
}

///@function ZombieCheckState(state)

function ZombieCheckState(_state)
{
	return (currentState == _state and !isChangingState);
}

///@function ZombieStateDefault()

function ZombieStateDefault()
{
	ZombieStateBehaviour();
	ZombieAttack();
}

///@function ZombieStateCreeper()

function ZombieStateCreeper()
{
	ZombieHealthDisplayTimer();
	ZombieAddVelocity();
	ZombieAnimate();
	ZombieCheckCollision();
	ZombieTranslate();
	if(target != alphaCreeperID)
		ZombieAttack();
}

///@function ZombieStateBehaviour()

function ZombieStateBehaviour()
{
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
	ZombieHealthDisplayTimer();
	
	if(xSpeed != 0 and instance_place(x, y+1, BlockParent))
			xSpeed = lerp(0, xSpeed, friction);
	ySpeed += grav;
	ySpeed = min(ySpeed, maxFallSpeed);
	
	ZombieCheckCollision();
	ZombieTranslate();
}

///@function ZombieStateDead()

function ZombieStateDead()
{
	ZombieFadeOut();
	ZombieAddVelocity();
	ZombieCheckCollision();
	ZombieTranslate();
}