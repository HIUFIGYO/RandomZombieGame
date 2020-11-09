///@function WindowSetSize(width, height)

function WindowSetSize(width, height)
{
	Window.aspectRatio = width / height;
	Window.width = width;
	Window.height = height;
	
	window_set_size(width, height);
	surface_resize(application_surface, width, height);
	display_set_gui_size(width * Window.guiZoom, height * Window.guiZoom);
	
	WindowCenter();
}

///@function WindowSetFullScreen(full)

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

///@function WindowSetViewPort(view, x, y, width, height)

function WindowSetViewPort(viewID, xx, yy, w, h)
{
	view_visible[viewID] = true;
	view_xport[viewID] = xx;
	view_yport[viewID] = yy;
	view_wport[viewID] = w;
	view_hport[viewID] = h;
	view_camera[viewID] = Window.camera[viewID];
}

///@function WindowSetCamFollow(camera, target)

function WindowSetCamFollow(camID, inst)
{
	camera_set_view_target(Window.camera[camID], inst);
}