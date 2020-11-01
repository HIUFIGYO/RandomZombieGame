//destroy cameras
viewsBuilt = false;
for(var i=0; i<global.maxPlayers; i++)
{
	if(camera[i] != noone)
	{
		camera_destroy(camera[i]);
		camera[i] = noone;
	}
}