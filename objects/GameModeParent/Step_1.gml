///@desc Game Over Handler

if(gameOverTimer > 0 and !GamePaused())
{
	gameOverTimer -= DeltaTimeSecond();
	if(gameOverTimer <= 0)
	{
		RoomGoto(Debugger.startedInDebug ? rm_Debug : rm_mainMenu);
	}
}