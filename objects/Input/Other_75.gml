/// @description Connect/Disconnect Controllers

switch(async_load[? "event_type"])
{
	case "gamepad discovered":
		var pad = async_load[? "pad_index"];
		gamepad_set_axis_deadzone(pad, axisDeadZone);
		gamepad_set_button_threshold(pad, buttonThreshold);
		gameInput[pad] = gamepad_get_guid(pad);
		break;
		
	case "gamepad lost":
		var pad = async_load[? "pad_index"];
		gameInput[pad] = noone;
		break;
}