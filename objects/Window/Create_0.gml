aspectRatio = display_get_width() / display_get_height();
guiZoom = 1;
width = display_get_width();
height = width / aspectRatio;

for(var i=0; i<global.maxPlayers; i++)
	camera[i] = noone;
	
viewsBuilt = false;

windowResize = false;
windowResizeTimer = 0;
wasFullScreen = false;