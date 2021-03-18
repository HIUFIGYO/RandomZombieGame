///@function PhysicsObjectInit()

function PhysicsObjectInit()
{
	xSpeed = 0;
	ySpeed = 0;
	grav = 0.981;
	maxSpeed = 20;
	maxFallSpeed = 15;
	friction = 0.75;
	bounce = 0;
	bounceCutOff = 1.2;
	collision = false;
	canPush = true;
}

///@function PhysicsObjectPush(object, force, xTo, yTo)

function PhysicsObjectPush(_object, _force, _xTo, _yTo)
{
	var unitX = _xTo - _object.x,
		unitY = _yTo - _object.y;
	
	var length = sqrt(sqr(unitX) + sqr(unitY));
	
	if(length != 0)
	{
		unitX /= length;
		unitY /= length;
	}
	
	_object.xSpeed += unitX * _force;
	_object.ySpeed += unitY * _force;
}