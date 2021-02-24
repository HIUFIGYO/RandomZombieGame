WindowSetSize(Window.width, Window.height);

if(!debug_mode)
	RoomGoto(rm_mainMenu);
else
{
	global.playerAmount = 1;
	global.selectedGameMode = GM.Debug;
	RoomGoto(rm_Debug);
}