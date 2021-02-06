///@function WindowSetSize(width, height)

function WindowSetSize(_width, _height)
{
	Window.aspectRatio = _width / _height;
	Window.width = _width;
	Window.height = _height;
	Window.windowResize = true;
	Window.windowResizeTimer = 0;
	Window.wasFullScreen = window_get_fullscreen();
	WindowSetFullScreen(false);
	with(Window)
		event_perform(ev_other, ev_user0);
}

///@function WindowSetFullScreen(full)

function WindowSetFullScreen(_full)
{
	window_set_fullscreen(_full);
}

function WindowCenter()
{
	var _width = window_get_width();
	var _height = window_get_height();
	var xx = (display_get_width() - _width) / 2;
	var yy = (display_get_height() - _height) /2;
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