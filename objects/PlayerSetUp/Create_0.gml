audio_stop_all();
audio_play_sound(Music_Customization, 0, true);

playerAmount = 0;

loaded = false;
loadProfiles = ds_list_create();

startGame = false;
countDown = 3;

for(var i=0; i<4; i++)
{
	selection[i] = 0;
	profile[i] = new Profile();
	ready[i] = true;
	groupUI[i] = ds_list_create();
	
	PlayerSetUpCreateEnter(i);
}

playerIndex[0] = noone;
playerIndex[1] = noone;
playerIndex[2] = noone;
playerIndex[3] = noone;