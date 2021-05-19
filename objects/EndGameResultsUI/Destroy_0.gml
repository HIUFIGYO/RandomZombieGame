/// @description Clean up

if(ds_exists(data, ds_type_grid))
	ds_grid_destroy(data);
	
if(ds_exists(dataHighest, ds_type_grid))
	ds_grid_destroy(dataHighest);