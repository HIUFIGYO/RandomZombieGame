if(!gameOver)
	return;

if(InputGetButtonDown(global.playerInput[0], Button.Confirm)) 
{
	global.playerAmount = 1;
	RoomGoto(Debugger.startedInDebug ? rm_Debug : rm_mainMenu);
}