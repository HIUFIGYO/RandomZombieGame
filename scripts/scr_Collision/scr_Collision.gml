///@function AABBCollision(object1, object2)

function AABBCollision(_object1, _object2)
{
	return(_object1.bbox_left <= _object2.bbox_right
		&& _object1.bbox_right >= _object2.bbox_left
		&& _object1.bbox_top <= _object2.bbox_bottom
		&& _object1.bbox_bottom >= _object2.bbox_top);
}

///@function CollisionLineLine(x1, y1, x2, y2, x3, y3, x4, y4)

function CollisionLineLine(x1, y1, x2, y2, x3, y3, x4, y4)
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

///@function CollisionLineRect()

function CollisionLineRect(x1, y1, x2, y2, rx, ry, rw, rh)
{
	if(CollisionLineLine(x1,y1,x2,y2, rx,ry,rx, ry+rh))
		return true;
	if(CollisionLineLine(x1,y1,x2,y2, rx+rw,ry, rx+rw,ry+rh))
		return true;
	if(CollisionLineLine(x1,y1,x2,y2, rx,ry, rx+rw,ry))
		return true;
	if(CollisionLineLine(x1,y1,x2,y2, rx,ry+rh, rx+rw,ry+rh))
		return true;
	return false;
}

///@function CollisionCirleList(x, y, radius, object, hookFunction)

function CollisionCirleList(_x, _y, _radius, _object, hookFunction)
{
	var hits = ds_list_create(), count, i;
	
	count = collision_circle_list(_x, _y, _radius, _object, false, true, hits, false);
	
	for(i=0; i<count; i++)
	{
		hookFunction(hits[| i]);
	}
	
	ds_list_destroy(hits);
}