/// @description fade out time

fadeOut -= 1;
if(fadeOut <= 0)
	instance_destroy();
alarm[0] = 1;

image_alpha = fadeOut / fadeOutTime;