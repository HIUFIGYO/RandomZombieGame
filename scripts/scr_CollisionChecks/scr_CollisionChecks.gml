///@function AABBCollision(object1, object2)

function AABBCollision(_object1, _object2)
{
	return(_object1.bbox_left <= _object2.bbox_right
		&& _object1.bbox_right >= _object2.bbox_left
		&& _object1.bbox_top <= _object2.bbox_bottom
		&& _object1.bbox_bottom >= _object2.bbox_top);
}

///@function IntersectLineLine(x1, y1, x2, y2, x3, y3, x4, y4)

function IntersectLineLine(x1, y1, x2, y2, x3, y3, x4, y4)
{
	// calculate the direction of the lines
	var uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
	var uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

	// if uA and uB are between 0-1, lines are colliding
	if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) 
	{
		return true;
	}
	return false;
}

///@function CollisionRectRect(object1, object2)

function CollisionRectRect(_object1, _object2)
{
	var rect1 = GetCollisionShape(_object1),
		rect2 = GetCollisionShape(_object2);
		
	return(_object1.x + rect1.X <= _object2.x + rect2.X + rect2.Width
		&& _object1.x + rect1.X + rect1.Width >= _object2.x + rect2.X
		&& _object1.y + rect1.Y <= _object2.y + rect2.Y + rect2.Height
		&& _object1.y + rect1.Y + rect1.Height >= _object2.y + rect2.Y);
}

///@function CollisionLineRect(_object1, _object2)

function CollisionLineRect(_object1, _object2)
{
	var line = GetCollisionShape(_object1),
		rect = GetCollisionShape(_object2);
	
	if(IntersectLineLine(_object1.x + line.X1, _object1.y + line.Y1, _object1.x + line.X2, _object1.y + line.Y2,
						_object2.x + rect.X, _object2.y + rect.Y, _object2.x + rect.X, _object2.y + rect.Y + rect.Height))
		return true;
	if(IntersectLineLine(_object1.x + line.X1, _object1.y + line.Y1, _object1.x + line.X2, _object1.y + line.Y2,
						_object2.x + rect.X + rect.Width, _object2.y + rect.Y, _object2.x + rect.X + rect.Width, _object2.y + rect.Y + rect.Height))
		return true;
	if(IntersectLineLine(_object1.x + line.X1, _object1.y + line.Y1, _object1.x + line.X2, _object1.y + line.Y2,
						_object2.x + rect.X, _object2.y + rect.Y, _object2.x + rect.X + rect.Width, _object2.y + rect.Y))
		return true;
	if(IntersectLineLine(_object1.x + line.X1, _object1.y + line.Y1, _object1.x + line.X2, _object1.y + line.Y2,
						_object2.x + rect.X, _object2.y + rect.Y + rect.Height, _object2.x + rect.X + rect.Width, _object2.y + rect.Y + rect.Height))
		return true;
	return false;
}

///@function CollisionRectLine(rx, ry, rw, rh, x1, y1, x2, y2)

function CollisionRectLine(rx, ry, rw, rh, x1, y1, x2, y2)
{
	return CollisionLineRect(x1, y1, x2, y2, rx, ry, rw, rh);
}

