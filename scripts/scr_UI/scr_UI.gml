enum UIDrawTo
{
	Room,
	GUI,
	ViewPort,
	ViewPortRoom
}

enum RectAlign
{
	None,
	Horizontal,
	Verticle,
	Center
}

function UICreateText(_x, _y, _text, _drawTo)
{
	_x = is_undefined(_x) ? 0 : _x;
	_y = is_undefined(_y) ? 0 : _y;
	_text = is_undefined(_text) ? 0 : _text;
	_drawTo = is_undefined(_drawTo) ? UIDrawTo.Room : _drawTo;
	
	var inst = instance_create_layer(0, 0, GameManager.layerUI, TextUI);
	inst.xx = _x;
	inst.yy = _y;
	inst.text = _text;
	inst.drawTo = _drawTo;
	
	return inst;
}

function UICreateImage(_x, _y, _sprite, _drawTo)
{
	_x = is_undefined(_x) ? 0 : _x;
	_y = is_undefined(_y) ? 0 : _y;
	_sprite = is_undefined(_sprite) ? 0 : _sprite;
	_drawTo = is_undefined(_drawTo) ? UIDrawTo.Room : _drawTo;
	
	var inst = instance_create_layer(0, 0, GameManager.layerUI, ImageUI);
	inst.xx = _x;
	inst.yy = _y;
	inst.sprite = _sprite;
	inst.drawTo = _drawTo;
	
	return inst;
}

function UICreateButton(_x, _y, _sprite, _drawTo)
{
	_x = is_undefined(_x) ? 0 : _x;
	_y = is_undefined(_y) ? 0 : _y;
	_sprite = is_undefined(_sprite) ? 0 : _sprite;
	_drawTo = is_undefined(_drawTo) ? UIDrawTo.Room : _drawTo;
	
	var inst = instance_create_layer(0, 0, GameManager.layerUI, ButtonUI);
	inst.xx = _x;
	inst.yy = _y;
	inst.sprite = _sprite;
	inst.drawTo = _drawTo;
	
	return inst;
}

function UICreateHealthbar(_x, _y, _drawTo)
{
	_x = is_undefined(_x) ? 0 : _x;
	_y = is_undefined(_y) ? 0 : _y;
	_drawTo = is_undefined(_drawTo) ? UIDrawTo.Room : _drawTo;
	
	var inst = instance_create_layer(0, 0, GameManager.layerUI, HealthBarUI);
	inst.xx = _x;
	inst.yy = _y;
	inst.drawTo = _drawTo;
	
	return inst;
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

function UISetParent(_parent, _child)
{
	_child.parent = _parent;
	ds_list_add(_parent.children, _child);
}

function UIRemoveParent(_child)
{
	if(_child.parent != noone)
	{
		for(var i=0; i<ds_list_size(_child.parent.children); i++)
		{
			if(_child.parent.children[| i] == _child)
			{
				ds_list_delete(_child.parent.children, i);
				break;
			}
		}
	}
}

function UIDestroy(_UIElement)
{
	var listOfUIToDestroy = ds_queue_create();
	
	ds_queue_enqueue(listOfUIToDestroy, _UIElement);
	
	while(ds_queue_size(listOfUIToDestroy) > 0)
	{
		var _checkForChildren = ds_queue_dequeue(listOfUIToDestroy);
		for(var i=0; i<ds_list_size(_checkForChildren.children); i++)
		{
			ds_queue_enqueue(_checkForChildren.children[| i]);
		}
		instance_destroy(_checkForChildren);
	}
	
	ds_queue_destroy(listOfUIToDestroy);
}