/// @description fade out time

fadeOut -= 1;
if(fadeOut <= 0)
	instance_destroy();
alarm[1] = 1;

image_alpha = fadeOut / fadeOutTime;