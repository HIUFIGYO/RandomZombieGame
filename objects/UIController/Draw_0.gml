global.drawUI = true;

for(var i=0; i<ds_grid_height(sortList); i++)
{
	with(ds_grid_get(sortList, 0, i))
		event_perform(ev_draw, 0);
}

global.drawUI = false;