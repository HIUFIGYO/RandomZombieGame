audio_stop_all();
audio_play_sound(Music_Customization, 0, true);

playerAmount = 0;

loaded = false;
loadProfiles = ds_list_create();

startGame = false;

for(var i=0; i<4; i++)
{
	selection[i] = 0;
	profile[i] = new Profile();
	ready[i] = true;
	groupUI[i] = ds_list_create();
	
	PlayerSetUpCreateEnter(i);
}

var doink = new Profile();

doink.Randomize();

doink.Save();


doink = new Profile();
doink.name = "Riley";

doink.Randomize();

doink.Save();

doink = new Profile();
doink.name = "Bman";
doink.Randomize();

doink.Save();