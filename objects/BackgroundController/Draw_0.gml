///@description Draw backgrounds
for(var i=0; i<global.playerAmount; i++)
{
	if(view_current != i)
		continue;
	
	var camX = camera_get_view_x(Window.camera[view_current]);
	var yScale = 1//camera_get_view_height(Window.camera[view_current]) / sprite_get_height(backVeryFar);
	
	draw_sprite_tiled_ext(backVeryFar, 0, lerp(0, camX, scrollXVFar), 0, 1, yScale, c_white, 1);
	draw_sprite_tiled_ext(backFar, 0, lerp(0, camX, scrollXFar), 0, 1, yScale, c_white, 1);
	draw_sprite_tiled_ext(backNear, 0, lerp(0, camX, scrollXNear), 0, 1, yScale, c_white, 1);
}