aspectRatio = 1;
guiZoom = 1;
width = display_get_width();
height = display_get_height();

for(var i=0; i<global.maxPlayers; i++)
	camera[i] = noone;
	
viewsBuilt = false;

windowResize = false;
windowResizeTimer = 0;
wasFullScreen = false;