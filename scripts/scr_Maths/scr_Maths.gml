
///@function DistanceToObject(object1, object2, distance)

function DistanceToObject(_object1, _object2, _distance)
{
	return (sqr(_object1.x - _object2.x) + sqr(_object1.y - _object2.y)) <= sqr(_distance);
}

///@function DistanceToObjectOffset(object1, object2, distance, xOffset, yOffset)

function DistanceToObjectOffset(_object1, _object2, _distance, _xOffset, _yOffset)
{
	return (sqr(_object1.x-_xOffset - _object2.x) + sqr(_object1.y-_yOffset - _object2.y)) <= sqr(_distance);
}

///@function ClampScroll(value, min, max)

function ClampScroll(_value, _min, _max)
{
	if(_value < _min)
		_value = _max;
	if(_value > _max)
		_value = _min;
	return _value;
}