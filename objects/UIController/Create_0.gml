global.drawUI = false;

displayWidth = display_get_width();
displayHeight = display_get_height();

aspectRatio = displayWidth / displayHeight;
targetWidth = 1920;
targetHeight = targetWidth / aspectRatio;

if(targetHeight mod 2 != 0)
	targetHeight++;

sortFlag = false;
sortList = ds_grid_create(2, 0);

for(var i=0; i<global.maxPlayers; i++)
{
	select[i] = noone;
}

layerUI = noone;
layerUI2 = noone;