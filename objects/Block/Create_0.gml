event_inherited();

image_speed = 0;

var index = 0;

if(instance_place(x + 1, y, Block))
	index += 1;
if(instance_place(x, y - 1, Block))
	index += 2;
if(instance_place(x - 1, y, Block))
	index += 4;
if(instance_place(x, y + 1, Block))
	index += 8;
	
image_index = index;