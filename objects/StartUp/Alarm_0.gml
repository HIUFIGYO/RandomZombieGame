WindowSetSize(Window.width, Window.height);

if(!debug_mode)
	room_goto(rm_mainMenu);
else
{
	global.playerAmount = 2;
	global.selectedGameMode = GM.Debug;
	room_goto(rm_Debug);
}