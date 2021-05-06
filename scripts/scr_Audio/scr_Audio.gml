///@function AudioChangeMode(mode)

function AudioChangeMode(mode)
{
	AudioSystem.isChangingModes = true;
	AudioSystem.audioNextMode = mode;
}

///@function AudioModeMenu()

function AudioModeMenu()
{
	if(audio_is_playing(currentMusic))
		return;
		
	currentMusic = audio_play_sound(Music_Menu1, 0, true);
	audio_sound_gain(currentMusic, 0, 0);
	audio_sound_gain(currentMusic, 1, 2000);
}

///@function AudioModeGame()

function AudioModeGame()
{
	if(!audio_is_playing(Sound_WindAmbience))
		audio_play_sound(Sound_WindAmbience, 0 , true);
	if(audio_is_playing(currentMusic))
		return;
	
	currentMusic = actionSongs[| actionSongIndex];
	audio_play_sound(currentMusic, 0, false);
	audio_sound_gain(currentMusic, 0, 0);
	audio_sound_gain(currentMusic, 1, 2000);
	actionSongIndex ++;
	if(actionSongIndex >= ds_list_size(actionSongs))
	{
		actionSongIndex = 0;
		ds_list_shuffle(actionSongs);
	}
}

///@function AudioModeBoss()

function AudioModeBoss()
{
	if(audio_sound_get_gain(currentMusic) >= 1)
	{
		audio_sound_gain(currentMusic, 0, 2000);
	}
	
	if(audio_sound_get_gain(currentMusic) > 0)
		return;
		
	if(audio_is_playing(bossMusic))
		return;
		
	audio_play_sound(bossMusic, 0, true);
	audio_sound_gain(bossMusic, 0, 0);
	audio_sound_gain(bossMusic, 1, 2000);
}

///@function AudioPlaySoundNearPlayer(sound)

function AudioPlaySoundNearPlayer(_sound)
{
	var snd = audio_play_sound(_sound, 10, false);
	var _player = instance_nearest(x, y, Player);
	if(_player)
	{
		var _vol = 1 - (distance_to_object(_player)/AudioSystem.soundFalloffDist);
		if(_vol < 0)
			_vol = 0;
		audio_sound_gain(snd, _vol, 0);
	}
}

///@function AudioStartBoss()

function AudioStartBoss(bossTheme)
{
	audio_stop_sound(AudioSystem.bossMusic);
	AudioSystem.bossMusic = bossTheme;
	AudioChangeMode(AudioModeBoss);
}

///@function AudioEndBoss()

function AudioEndBoss()
{
	audio_sound_gain(AudioSystem.bossMusic, 0, 2000);
	audio_sound_gain(AudioSystem.currentMusic, 1, 2000);
	AudioChangeMode(AudioModeGame);
}