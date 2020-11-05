randomize();

if(!debug_mode)
	room_goto(rm_mainMenu);
else
{
	global.selectedGameMode = GM.Debug;
	room_goto(rm_Debug);
}