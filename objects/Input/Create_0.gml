/// @description Set Up
var i;

for(i=0; i<12; i++)
{
	gameInput[i] = noone;
}

axisDeadZone = 0.25;
buttonThreshold = 0.1;

keyMap[Button.Left] = vk_left;
keyMap[Button.Right] = vk_right;
keyMap[Button.Jump] = vk_up;
keyMap[Button.Crouch] = vk_down;
keyMap[Button.Interact] = ord("E");
keyMap[Button.Shoot] = vk_space;
keyMap[Button.Grenade] = ord("Q");
keyMap[Button.ToggleWeapon] = ord("D");
keyMap[Button.NextGear] = ord("W");
keyMap[Button.PreviousGear] = ord("S");
keyMap[Button.Reload] = ord("R");
keyMap[Button.Sprint] = vk_lshift;
keyMap[Button.Assist] = ord("F");
keyMap[Button.Pause] = vk_enter;

gamepadMap[Button.Left] = gp_axislh;
gamepadMap[Button.Right] = gp_axislh;
gamepadMap[Button.Jump] = gp_face1;
gamepadMap[Button.Crouch] = gp_axislv;
gamepadMap[Button.Interact] = gp_face3;
gamepadMap[Button.Shoot] = gp_shoulderrb;
gamepadMap[Button.Grenade] = gp_shoulderl;
gamepadMap[Button.ToggleWeapon] = gp_shoulderr;
gamepadMap[Button.NextGear] = gp_padu;
gamepadMap[Button.PreviousGear] = gp_padd;
gamepadMap[Button.Reload] = gp_face4;
gamepadMap[Button.Sprint] = gp_face2;
gamepadMap[Button.Assist] = gp_face3;
gamepadMap[Button.Pause] = gp_start;
