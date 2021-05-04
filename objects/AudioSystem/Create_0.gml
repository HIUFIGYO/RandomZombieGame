audio_set_master_gain(0, 0.5);

actionSong[0] = Music_Action1;
actionSong[1] = Music_Action2;
actionSong[2] = Music_Action3;
actionSong[3] = Music_Action4;
actionSong[4] = Music_Action5;

actionSongMax = 5;

currentMusic = Music_Menu1;

soundFalloffDist = 360;

audioMode = AudioModeMenu;
audioNextMode = noone;
isChangingModes = false;

audio_play_sound(currentMusic, 0, false);