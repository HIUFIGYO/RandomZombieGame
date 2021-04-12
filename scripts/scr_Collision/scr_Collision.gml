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

///@function CollisionCirleListTargets(x, y, radius, object, targetsHit, hookFunction)

function CollisionCirleListTargets(_x, _y, _radius, _object, _targetsHit, hookFunction)
{
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
}

///@function CollisionLineListTargets(x1, y1, x2, y2, object, targetsHit, hookFunction)

function CollisionLineListTargets(_x1, _y1, _x2, _y2, _object, _targetsHit, hookFunction)
{
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
}