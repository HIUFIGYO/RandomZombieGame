if(!canPickUp or other.cosmetic_index > 0)
	return;
	
other.cosmetic_index = image_index;
instance_destroy();