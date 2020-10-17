/// @description Logic

for(var key = ds_map_find_first(gameController); !is_undefined(key); key = ds_map_find_next(gameController, key))
{
	if(gamepad_axis_value(key, gp_axislh) != 0)
		show_message("Left Anaglog horizontal on controller: " + key);
}