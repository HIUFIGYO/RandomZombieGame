if(GamePaused())
	return;
	
lifeTimer -= DeltaTimeSecond();
if(lifeTimer <= 0)
{
	instance_destroy()
	return;
}


CollisionCirleList(x, y, 48, Player, SpewerExplosionCollidePlayer);
CollisionCirleList(x, y, 48, Barricade, SpewerExplosionCollideBarricade);
CollisionCirleList(x, y, 48, ZombieParent, SpewerExplosionCollideZombie);