if(!gameOver)
	return;

if(InputGetButtonDown(0, Button.Confirm))
	RoomGoto(Debugger.startedInDebug ? rm_Debug : rm_mainMenu);