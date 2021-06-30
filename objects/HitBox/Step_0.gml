if(CollisionInstanceListTargets(x, y, ZombieParent, targetsHit, HitBoxCollideZombie))
	audio_play_sound(Sound_MeleeHit, AudioSystem.soundPlayerPriority, false);
CollisionInstanceListTargets(x, y, Player, targetsHit, HitBoxCollidePlayer);