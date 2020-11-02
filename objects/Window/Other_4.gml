if(room == rm_startUp) { exit; }

var w = window_get_width();
var h = window_get_height();

//build cameras
switch(global.playerAmount)
{
	case 1:
		camera[0] = camera_create_view(0, 0, w, h, 0, noone, -1, -1, w/2, h/2);
		break;
	case 2:
		camera[0] = camera_create_view(0, 0, w, h/2, 0, noone, -1, -1, w/2, h/4);
		camera[1] = camera_create_view(0, 0, w, h/2, 0, noone, -1, -1, w/2, h/4);
		break;
	case 3:
		camera[0] = camera_create_view(0, 0, w, h/2, 0, noone, -1, -1, w/2, h/4);
		camera[1] = camera_create_view(0, 0, w/2, h/2, 0, noone, -1, -1, w/4, h/4);
		camera[2] = camera_create_view(0, 0, w/2, h/2, 0, noone, -1, -1, w/4, h/4);
		break;
	case 4:
		camera[0] = camera_create_view(0, 0, w/2, h/2, 0, noone, -1, -1, w/4, h/4);
		camera[1] = camera_create_view(0, 0, w/2, h/2, 0, noone, -1, -1, w/4, h/4);
		camera[2] = camera_create_view(0, 0, w/2, h/2, 0, noone, -1, -1, w/4, h/4);
		camera[3] = camera_create_view(0, 0, w/2, h/2, 0, noone, -1, -1, w/4, h/4);
		break;
}

//Set up views
view_enabled = true;
switch(global.playerAmount)
{
	case 1:
		WindowSetViewPort(0, 0, 0, w, h);
		break;
	case 2:
		WindowSetViewPort(0, 0, 0, w, h/2);
		WindowSetViewPort(1, 0, h/2, w, h/2);
		break;
	case 3:
		WindowSetViewPort(0, 0, 0, w, h/2);
		WindowSetViewPort(1, 0, h/2, w/2, h/2);
		WindowSetViewPort(2, w/2, h/2, w/2, h/2);
		break;
	case 4:
		WindowSetViewPort(0, 0, 0, w/2, h/2);
		WindowSetViewPort(1, w/2, 0, w/2, h/2);
		WindowSetViewPort(2, 0, h/2, w/2, h/2);
		WindowSetViewPort(3, w/2, h/2, w/2, h/2);
		break;
}

viewsBuilt = true;