audio_set_master_gain(0, 0.5);

actionSongs = ds_list_create();

ds_list_add(actionSongs, Music_Action1);
ds_list_add(actionSongs, Music_Action2);
ds_list_add(actionSongs, Music_Action3);
ds_list_add(actionSongs, Music_Action4);
ds_list_add(actionSongs, Music_Action5);

ds_list_shuffle(actionSongs);

actionSongIndex = 0;

currentMusic = Music_Menu1;
bossMusic = Music_Boss1;

soundFalloffDist = 360;

audioMode = AudioModeMenu;
audioNextMode = noone;
isChangingModes = false;