///@desc Game Over Handler

if(gameOverTimer > 0)
{
	gameOverTimer -= DeltaTimeSecond();
	if(gameOverTimer <= 0)
	{
		room_goto(rm_mainMenu);
	}
}