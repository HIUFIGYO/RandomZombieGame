///@function PhysicsObjectSetSpeed(object, xSpeed, ySpeed)

function PhysicsObjectSetSpeed(object, _xSpeed, _ySpeed)
{
	object.xSpeed = _xSpeed;
	object.ySpeed = _ySpeed;
}

///@function PhysicsObjectSetGravity(object, gravity)

function PhysicsObjectSetGravity(object, _gravity)
{
	object.grav = _gravity;
}

///@function PhysicsObjectSetMaxSpeed(object, maxSpeed)

function PhysicsObjectSetMaxSpeed(object, _maxSpeed)
{
	object.maxSpeed = _maxSpeed;
}

///@function PhysicsObjectSetMaxFallSpeed(object, maxSpeed)

function PhysicsObjectSetMaxFallSpeed(object, _maxSpeed)
{
	object.maxFallSpeed = _maxSpeed;
}

///@function PhysicsObjectSetBounce(object, bounce)

function PhysicsObjectSetBounce(object, _bounce)
{
	object.bounce = _bounce;
}

