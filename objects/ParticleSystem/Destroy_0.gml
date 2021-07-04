for(var i=0; i<ds_list_size(particleTypes); i++)
{
	part_type_destroy(particleTypes[| i]);
}

ds_list_destroy(particleTypes);

PartCleanUp();