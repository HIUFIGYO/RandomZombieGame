///@function AudioChangeMode(mode)

function AudioChangeMode(mode)
{
	AudioSystem.isChangingModes = true;
	AudioSystem.audioNextMode = mode;
}

///@function AudioModeMenu()

function AudioModeMenu()
{
	
}

///@function AudioModeGame()

function AudioModeGame()
{
	if(audio_is_playing(currentMusic))
	return;

	var nextSong = actionSong[irandom(actionSongMax-1)];

	while(currentMusic == nextSong)
		nextSong = actionSong[irandom(actionSongMax-1)];

	currentMusic = nextSong;
	audio_play_sound(currentMusic, 0, false);
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