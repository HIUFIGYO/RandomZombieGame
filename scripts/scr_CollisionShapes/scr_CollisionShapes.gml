///@function CollisionShape(x1, y1, x2, y2)

function CollisionShape(_x1, _y1, _x2, _y2) constructor
{
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
}

///@function BoundingCircle(x, y, radius)

function BoundingCircle(_x, _y, _radius) constructor
{
	var Shape = new CollisionShape(_x, _y, _radius, 0);
	
	X = Shape.x1;
	Y = Shape.y1;
	Radius = Shape.x2;
}

///@function BoundingRect(x, y, width, height)

function BoundingRect(_x1, _y1, _x2, _y2) constructor
{
	var shape = new CollisionShape(_x1, _y1, _x2, _y2);
	
	X = shape.x1;
	Y = shape.y1;
	Width = shape.x2;
	Height = shape.y2;
}

///@function BoundingLine(x1, y1, x2, y2)

function BoundingLine(_x1, _y1, _x2, _y2) constructor
{
	var shape = new CollisionShape(_x1, _y1, _x2, _y2);
	
	X1 = shape.x1;
	Y1 = shape.y1;
	X2 = shape.x2;
	Y2 = shape.y2;
}

///@function GetCollisionShape(object)

function GetCollisionShape(_object)
{
	return _object.collisionShape;
}