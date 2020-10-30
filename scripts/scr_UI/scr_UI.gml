enum UIDrawTo
{
	Room,
	GUI,
	ViewPort,
	ViewPortRoom
}

function UICreateText(_x, _y, _text, _drawTo)
{
	_x = is_undefined(_x) ? 0 : _x;
	_y = is_undefined(_y) ? 0 : _y;
	_text = is_undefined(_text) ? 0 : _text;
	_drawTo = is_undefined(_drawTo) ? UIDrawTo.Room : _drawTo;
	
	var _inst = instance_create_layer(0, 0, GameManager.layerUI, TextUI);
	_inst.xx = _x;
	_inst.yy = _y;
	_inst.text = _text;
	_inst.drawTo = _drawTo;
	
	return _inst;
}

function UISetRect(_UI, _x, _y, _width, _height, _padX, _padY)
{
	_padX = is_undefined(_padX) ? 0 : _padX;
	_padY = is_undefined(_padY) ? 0 : _padY;
	
	_UI.xx = _x;
	_UI.yy = _y;
	_UI.width = _width;
	_UI.height = _height;
	_UI.paddingX = _padX;
	_UI.paddingY = _padY;
}

function UISetPosition(_UI, _x, _y)
{
	_UI.xx = _x;
	_UI.yy = _y;
}

function UISetSize(_UI, _width, _height)
{
	_UI.width = _width;
	_UI.height = _height;
}