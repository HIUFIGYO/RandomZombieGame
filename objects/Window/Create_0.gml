aspectRatio = 1;
var w = display_get_width();
var h = display_get_height();
WindowSetSize(w, h);
WindowSetFullScreen(true);

for(var i=0; i<global.maxPlayers; i++)
	camera[i] = noone;
	
viewsBuilt = false;