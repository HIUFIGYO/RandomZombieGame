/////@function CollisionList(object, collisionType, hookFunction)

//function CollisionList(_object, collisionType, hookFunction)
//{
//	var hits = ds_list_create(), i, count;
	
//	count = instance_number(_object);
//	for(i=0; i<count; i++)
//	{
//		var otherObject = instance_find(_object, i);
//		if(collisionType(id, otherObject))
//			ds_list_add(hits, otherObject);
//	}
	
//	count = ds_list_size(hits);
//	for(i=0; i<count; i++)
//	{
//		hookFunction(hits[| i]);
//	}
	
//	ds_list_destroy(hits);
//}


/////@function CollisionListTargets(object, collisionType, targetsList, hookFunction)

//function CollisionListTargets(_object, _collisionType, _targetsList, hookFunction)
//{
//	var hits = ds_list_create(), count, i;
	
//	count = instance_number(_object);
//	for(i=0; i<count; i++)
//	{
//		var otherObject = instance_find(_object, i);
//		if(_collisionType(id, otherObject))
//			ds_list_add(hits, otherObject);
//	}
	
//	count = ds_list_size(hits);
//	for(i=0; i<count; i++)
//	{
//		if(!ds_exists(_targetsList, ds_type_list))
//			break;
		
//		var alreadyHit = false;
//		for(var hit=0; hit<ds_list_size(_targetsList); hit++)
//		{
//			if(_targetsList[| hit] == hits[| i])
//				alreadyHit = true
//		}
		
//		if(alreadyHit)
//			continue;
		
//		if(hookFunction(hits[| i]))
//			ds_list_add(_targetsList, hits[| i]);
//	}
	
//	ds_list_destroy(hits);
//}

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
	
	return count > 0;
}

///@function CollisionCirleListTargets(x, y, radius, object, targetsHit, hookFunction)

function CollisionCirleListTargets(_x, _y, _radius, _object, _targetsHit, hookFunction)
{
	if(!ds_exists(_targetsHit, ds_type_list))
		return false;
	
	var hits = ds_list_create(), count, i;
	
	count = collision_circle_list(_x, _y, _radius, _object, false, true, hits, false);
	
	for(i=0; i<count; i++)
	{
		if(!ds_exists(_targetsHit, ds_type_list))
			break;
		
		var alreadyHit = false;
		for(var hit=0; hit<ds_list_size(_targetsHit); hit++)
		{
			if(_targetsHit[| hit] == hits[| i])
				alreadyHit = true
		}
		
		if(alreadyHit)
			continue;
		
		if(hookFunction(hits[| i]))
			ds_list_add(_targetsHit, hits[| i]);
	}
	
	ds_list_destroy(hits);
	
	return count > 0;
}

///@function CollisionRectList(x1, y1, x2, y2, object, hookFunction)

function CollisionRectList(_x1, _y1, _x2, y2, _object, hookFunction)
{
	var hits = ds_list_create(), count, i;
	
	count = collision_rectangle_list(_x1, _y1, _x2, y2, _object, false, true, hits, false);
	
	for(i=0; i<count; i++)
	{
		hookFunction(hits[| i]);
	}
	
	ds_list_destroy(hits);
	
	return count > 0;
}

///@function CollisionRectListTargets(x1, y1, x2, y2, object, targetsHit, hookFunction)

function CollisionRectListTargets(_x1, _y1, _x2, y2, _object, _targetsHit, hookFunction)
{
	if(!ds_exists(_targetsHit, ds_type_list))
		return false;
	
	var hits = ds_list_create(), count, i;
	
	count = collision_rectangle_list(_x1, _y1, _x2, y2, _object, false, true, hits, false);
	
	for(i=0; i<count; i++)
	{
		if(!ds_exists(_targetsHit, ds_type_list))
			break;
		
		var alreadyHit = false;
		for(var hit=0; hit<ds_list_size(_targetsHit); hit++)
		{
			if(_targetsHit[| hit] == hits[| i])
				alreadyHit = true
		}
		
		if(alreadyHit)
			continue;
		
		if(hookFunction(hits[| i]))
			ds_list_add(_targetsHit, hits[| i]);
	}
	
	ds_list_destroy(hits);
	
	return count > 0;
}

///@function CollisionLineList(x1, y1, x2, y2, object, hookFunction)

function CollisionLineList(_x1, _y1, _x2, _y2, _object, hookFunction)
{
	var hits = ds_list_create(), count, i;
	
	count = collision_line_list(_x1, _y1, _x2, _y2, _object, false, true, hits, false);
	
	for(i=0; i<count; i++)
	{
		hookFunction(hits[| i]);
	}
	
	ds_list_destroy(hits);
	
	return count > 0;
}

///@function CollisionLineListTargets(x1, y1, x2, y2, object, targetsHit, hookFunction)

function CollisionLineListTargets(_x1, _y1, _x2, _y2, _object, _targetsHit, hookFunction)
{
	if(!ds_exists(_targetsHit, ds_type_list))
		return false;
	
	var hits = ds_list_create(), count, i;
	
	count = collision_line_list(_x1, _y1, _x2, _y2, _object, false, true, hits, false);
	
	for(i=0; i<count; i++)
	{		
		if(!ds_exists(_targetsHit, ds_type_list))
			break;
		
		var alreadyHit = false;
		for(var hit=0; hit<ds_list_size(_targetsHit); hit++)
		{
			if(_targetsHit[| hit] == hits[| i])
				alreadyHit = true
		}
		
		if(alreadyHit)
			continue;
		
		if(hookFunction(hits[| i]))
			ds_list_add(_targetsHit, hits[| i]);
	}
	
	ds_list_destroy(hits);
	
	return count > 0;
}

///@function CollisionInstanceList(x, y, object, hookFunction)

function CollisionInstanceList(_x, _y, _object, hookFunction)
{
	var hits = ds_list_create(), count, i;
	
	count = instance_place_list(floor(_x), floor(_y), _object, hits, false);
	
	for(i=0; i<count; i++)
	{
		hookFunction(hits[| i]);
	}
	
	ds_list_destroy(hits);
	
	return count > 0;
}

///@function CollisionInstanceListTargets(x, y, object, targetsHit, hookFunction)

function CollisionInstanceListTargets(_x, _y, _object, _targetsHit, hookFunction)
{
	if(!ds_exists(_targetsHit, ds_type_list))
		return false;
	
	var hits = ds_list_create(), count, i;
	
	count = instance_place_list(floor(_x), floor(_y), _object, hits, false);
	
	for(i=0; i<count; i++)
	{
		if(!ds_exists(_targetsHit, ds_type_list))
			break;
		
		var alreadyHit = false;
		for(var hit=0; hit<ds_list_size(_targetsHit); hit++)
		{
			if(_targetsHit[| hit] == hits[| i])
				alreadyHit = true
		}
		
		if(alreadyHit)
			continue;
		
		if(hookFunction(hits[| i]))
			ds_list_add(_targetsHit, hits[| i]);
	}
	
	ds_list_destroy(hits);
	
	return count > 0;
}