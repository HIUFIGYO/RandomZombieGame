///@desc Game Over Handler

if(gameOverTimer > 0)
{
	gameOverTimer -= DeltaTimeSecond();
	if(gameOverTimer <= 0)
	{
		var roomGoto = Debugger.startedInDebug ? rm_Debug : rm_mainMenu;
		room_goto(roomGoto);
	}
}