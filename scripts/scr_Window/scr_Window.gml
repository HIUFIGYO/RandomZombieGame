function WindowSetSize(width, height)
{
	Window.aspectRatio = width / height;
	
	window_set_size(width, height);
	surface_resize(application_surface, width, height);
	
	WindowCenter();
}

function WindowSetFullScreen(full)
{
	window_set_fullscreen(full);
}

function WindowCenter()
{
	var width = window_get_width();
	var height = window_get_height();
	var xx = (display_get_width() - width) / 2;
	var yy = (display_get_height() - height) /2;
	window_set_position(xx, yy);
}