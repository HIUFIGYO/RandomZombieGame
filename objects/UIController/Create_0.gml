global.drawUI = false;
sortFlag = false;
sortList = ds_grid_create(2, 0);

for(var i=0; i<global.maxPlayers; i++)
{
	select[i] = noone;
}

layerUI = noone;
layerUI2 = noone;