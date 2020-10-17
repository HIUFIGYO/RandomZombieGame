/// @description Connect/Disconnect Controllers

show_message("Something is happening...");

switch(async_load[? "event_type"])
{
	case "gamepad discovered":
		var pad = async_load[? "pad_index"];
		show_message("Controller Connected: " + pad);
		gamepad_set_axis_deadzone(pad, axisDeadZone);
		gamepad_set_button_threshold(pad, buttonThreshold);
		ds_map_add(gameController, pad, pad);
		break;
		
	case "gamepad lost":
		var pad = async_load[? "pad_index"];
		show_message("Controller Disconnected: " + pad);
		ds_map_delete(gameController, pad);
		break;
}