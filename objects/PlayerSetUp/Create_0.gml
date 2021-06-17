audio_stop_all();
audio_play_sound(Music_Customization, 0, true);

playerAmount = 0;
selection = 0;

loaded = false;
loadProfiles = ds_list_create();

for(var i=0; i<4; i++)
{
	screenSelect[i] = SetUpScreen.Enter;
	profile[i] = new Profile();
}

