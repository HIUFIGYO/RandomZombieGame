/// @description WindowResize
if(!windowResize)
	exit;
	
if(windowResizeTimer == 10)
{
	window_set_size(width, height);
}
else if(windowResizeTimer == 30)
{
	surface_resize(application_surface, width, height);
}
else if(windowResizeTimer == 50)
{
	display_set_gui_size(width * guiZoom, height * guiZoom);
	WindowCenter();
}
else if(windowResizeTimer == 60)
{
	windowResize = false;
	WindowSetFullScreen(wasFullScreen);
}

alarm[0] = 1;