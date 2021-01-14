/// @description Toggle Door

toggle = !toggle;
canCollidePlayer = toggle;
canCollideZombie = toggle;

if(!toggle)
	image_index = 1;
else
	image_index = 0;