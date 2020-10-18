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
keyMap[Button.Up] = vk_up;
keyMap[Button.Crouch] = vk_down;
keyMap[Button.Interact] = ord("E");
keyMap[Button.Shoot] = vk_space;
keyMap[Button.Grenade] = ord("Q");
keyMap[Button.NextWeapon] = ord("D");
keyMap[Button.PreviousWeapon] = ord("A");
keyMap[Button.NextGear] = ord("W");
keyMap[Button.PreviousGear] = ord("S");
keyMap[Button.Reload] = ord("R");
keyMap[Button.Sprint] = vk_lshift;
keyMap[Button.Assist] = ord("F");
keyMap[Button.Pause] = vk_enter;

gamepadMap[Button.Left] = gp_axislh;
gamepadMap[Button.Right] = gp_axislh;
gamepadMap[Button.Up] = gp_axislv;
gamepadMap[Button.Crouch] = gp_axislv;
gamepadMap[Button.Interact] = gp_face1;
gamepadMap[Button.Shoot] = gp_shoulderr;
gamepadMap[Button.Grenade] = gp_shoulderl;
gamepadMap[Button.NextWeapon] = gp_padr;
gamepadMap[Button.PreviousWeapon] = gp_padl;
gamepadMap[Button.NextGear] = gp_padu;
gamepadMap[Button.PreviousGear] = gp_padd;
gamepadMap[Button.Reload] = gp_face4;
gamepadMap[Button.Sprint] = gp_face2;
gamepadMap[Button.Assist] = gp_face3;
gamepadMap[Button.Pause] = gp_start;
