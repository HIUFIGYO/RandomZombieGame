///@desc Game Over Handler

if(gameOverTimer > 0)
{
	gameOverTimer -= DeltaTimeSecond();
	if(gameOverTimer <= 0)
	{
		RoomGoto(Debugger.startedInDebug ? rm_Debug : rm_mainMenu);
	}
}