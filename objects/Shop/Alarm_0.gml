/// @description Flicker

if(!isOpen)
	return;
	
alarm[0] = 5 * 60;
if(choose(false, true))
	flickerCount = irandom_range(15, 30) * 2;