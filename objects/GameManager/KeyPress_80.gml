/// @description Pause

gamePaused = !gamePaused;

if(gamePaused)
{
	with(ZombieParent)
	{
		pauseImageSpeed = image_speed;
		image_speed = 0;
		ZombieChangeState(ZombieStatePause);
	}
	
	with(Player)
	{
		pauseX = x;
		pauseY = y;
	}
}
else
{
	with(ZombieParent)
	{
		image_speed = pauseImageSpeed;
		ZombieChangeState(previousState);
	}
}