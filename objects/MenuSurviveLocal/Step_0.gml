event_inherited();

var buttonPressed = false;
if(isMouseOver and mouse_check_button_pressed(mb_left))
{
	buttonPressed = true;
}

if(isSelected and InputGetButtonDown(0, Button.Jump))
{
	buttonPressed = true;
}

if(buttonPressed)
{
	global.playerAmount = global.startingPlayerAmount;
	AudioChangeMode(AudioModeGame);
	RoomGoto(rm_stage01);
}