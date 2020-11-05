if(surface_exists(bloodSurf))
	draw_surface(bloodSurf, 0, 0);
else
{
	bloodSurf = surface_create(room_width, room_height);
}