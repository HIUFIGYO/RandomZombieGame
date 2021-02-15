/// @description Set Up
var i;

for(i=0; i<12; i++)
{
	gameInput[i] = noone;
}
for(i=0; i<global.maxPlayers; i++)
{
	axisH[i] = 0;
	axisV[i] = 0;
}
InputResetAxisPress();

axisDeadZone = 0.5;
buttonThreshold = 0.1;

keyMap[Button.Left] = vk_left;
keyMap[Button.Right] = vk_right;
keyMap[Button.Up] = vk_up;
keyMap[Button.Down] = vk_down;
keyMap[Button.Confirm] = ord("S");
keyMap[Button.Cancel] = ord("A");
keyMap[Button.Jump] = vk_space;
keyMap[Button.Crouch] = vk_down;
keyMap[Button.Interact] = ord("E");
keyMap[Button.Shoot] = ord("S");
keyMap[Button.Grenade] = ord("G");
keyMap[Button.ToggleWeapon] = ord("Q");
keyMap[Button.Melee] = ord("C");
keyMap[Button.NextGear] = ord("D");
keyMap[Button.PreviousGear] = ord("A");
keyMap[Button.Reload] = ord("R");
keyMap[Button.Sprint] = vk_lshift;
keyMap[Button.Assist] = ord("F");
keyMap[Button.DropMoney] = ord("Z");
keyMap[Button.DropWeap] = ord("X");
keyMap[Button.Pause] = vk_enter;

gamepadMap[Button.Left] = Axis.Left;
gamepadMap[Button.Right] = Axis.Right;
gamepadMap[Button.Up] = Axis.Up;
gamepadMap[Button.Down] = Axis.Down;
gamepadMap[Button.Confirm] = gp_face1;
gamepadMap[Button.Cancel] = gp_face2;
gamepadMap[Button.Jump] = gp_face1;
gamepadMap[Button.Crouch] = Axis.Down;
gamepadMap[Button.Interact] = gp_padu;
gamepadMap[Button.Shoot] = gp_shoulderrb;
gamepadMap[Button.Grenade] = gp_shoulderlb;
gamepadMap[Button.ToggleWeapon] = gp_shoulderl;
gamepadMap[Button.Melee] = gp_shoulderr;
gamepadMap[Button.NextGear] = gp_padr;
gamepadMap[Button.PreviousGear] = gp_padl;
gamepadMap[Button.Reload] = gp_face3;
gamepadMap[Button.Sprint] = gp_face2;
gamepadMap[Button.Assist] = gp_face4;
gamepadMap[Button.DropMoney] = Axis.Down;
gamepadMap[Button.DropWeap] = Axis.Down;
gamepadMap[Button.Pause] = gp_start;
