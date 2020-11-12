if(sortFlag)
{
	sortFlag = false;
	
	var UIRects = instance_number(UIRectParent);
	ds_grid_resize(sortList, 2, UIRects);
	
	for(var i=0; i<UIRects; i++)
	{
		var rect = instance_find(UIRectParent, i);
		ds_grid_set(sortList, 0, i, rect);
		ds_grid_set(sortList, 1, i, rect.sortDepth);
	}
	
	ds_grid_sort(sortList, 1, false);
}