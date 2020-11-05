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
keyMap[Button.Jump] = vk_space;
keyMap[Button.Crouch] = vk_down;
keyMap[Button.Interact] = vk_up;
keyMap[Button.Shoot] = ord("S");
keyMap[Button.Grenade] = ord("G");
keyMap[Button.ToggleWeapon] = ord("E");
keyMap[Button.Melee] = ord("Q");
keyMap[Button.NextGear] = ord("D");
keyMap[Button.PreviousGear] = ord("A");
keyMap[Button.Reload] = ord("R");
keyMap[Button.Sprint] = vk_lshift;
keyMap[Button.Assist] = ord("F");
keyMap[Button.Pause] = vk_enter;

gamepadMap[Button.Left] = gp_padl;
gamepadMap[Button.Right] = gp_padr;
gamepadMap[Button.Jump] = gp_face1;
gamepadMap[Button.Crouch] = gp_padd;
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
gamepadMap[Button.Pause] = gp_start;
