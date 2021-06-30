if(GamePaused())
	return;
	
lifeTimer -= DeltaTimeSecond();
if(lifeTimer <= 0)
{
	instance_destroy();
	return;
}

if(CollisionInstanceListTargets(x, y, ZombieParent, targetsHit, HitBoxCollideZombie))
	audio_play_sound(Sound_MeleeHit, AudioSystem.soundPlayerPriority, false);
CollisionInstanceListTargets(x, y, Player, targetsHit, HitBoxCollidePlayer);