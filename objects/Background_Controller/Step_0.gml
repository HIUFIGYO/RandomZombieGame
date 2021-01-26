//Parallax Control

var _near = layer_get_id("Background_Near");
var _far = layer_get_id("Background_Far");
var _vfar = layer_get_id("Background_VFar");

var _playerx = camera_get_view_x(Window.camera[view_current]);

layer_x(_near,	lerp(0, _playerx, 0.5));
layer_x(_far,	lerp(0, _playerx, 0.7));
layer_x(_vfar,	lerp(0, _playerx, 0.9));

var _playery = camera_get_view_y(Window.camera[view_current]);

layer_y(_near,	lerp(0, _playery, 0.05));
layer_y(_far,	lerp(0, _playery, 0.15));
layer_y(_vfar,	lerp(0, _playery, 0.25));