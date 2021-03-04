
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

///@function AABBCollision(object1, object2)

function AABBCollision(_object1, _object2)
{
	return(_object1.bbox_left <= _object2.bbox_right
		&& _object1.bbox_right >= _object2.bbox_left
		&& _object1.bbox_top <= _object2.bbox_bottom
		&& _object1.bbox_bottom >= _object2.bbox_top);
}