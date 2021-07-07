if(debug_mode)
	visible = true;


lifeTimer = 5/60;

targetsHit = ds_list_create();
maxHits = 5;
acid = false;
spawnedBH = false;

InitDebuffs()

audio_play_sound(Sound_Explosion1, AudioSystem.soundPlayerPriority, false);

CreateEffect(x, y, EffectExplosion);