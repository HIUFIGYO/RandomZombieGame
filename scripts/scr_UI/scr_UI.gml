enum UIDrawTo
{
	Room,
	GUI,
	ViewPort,
	ViewPortRoom
}

enum RectAlign
{
	Left,
	Right,
	Center,
	Top,
	Bottom
}

///@function UICreateText(x(option), y(option), text(option), drawTo(option))

function UICreateText(_x, _y, _text, _drawTo)
{
	_x = is_undefined(_x) ? 0 : _x;
	_y = is_undefined(_y) ? 0 : _y;
	_text = is_undefined(_text) ? 0 : _text;
	_drawTo = is_undefined(_drawTo) ? UIDrawTo.Room : _drawTo;
	
	if(UIController.layerUI == noone)
	{
		with(UIController)
			event_perform(ev_other, ev_room_start);
	}
	
	var inst = instance_create_layer(0, 0, UIController.layerUI, TextUI);
	inst.xx = _x;
	inst.yy = _y;
	inst.text = _text;
	inst.drawTo = _drawTo;
	
	return inst;
}

///@function UICreateImage(x(option), y(option), sprite(option), drawTo(option))

function UICreateImage(_x, _y, _sprite, _drawTo)
{
	_x = is_undefined(_x) ? 0 : _x;
	_y = is_undefined(_y) ? 0 : _y;
	_sprite = is_undefined(_sprite) ? noone : _sprite;
	_drawTo = is_undefined(_drawTo) ? UIDrawTo.Room : _drawTo;
	
	if(UIController.layerUI == noone)
	{
		with(UIController)
			event_perform(ev_other, ev_room_start);
	}
	
	var inst = instance_create_layer(0, 0, UIController.layerUI, ImageUI);
	inst.xx = _x;
	inst.yy = _y;
	inst.sprite = _sprite;
	inst.drawTo = _drawTo;
	if(_sprite != noone)
	{
		inst.width = sprite_get_width(_sprite);
		inst.height = sprite_get_height(_sprite);
	}
	
	return inst;
}

///@function UICreateButton(x(option), y(option), sprite(option), drawTo(option))

function UICreateButton(_x, _y, _sprite, _drawTo)
{
	_x = is_undefined(_x) ? 0 : _x;
	_y = is_undefined(_y) ? 0 : _y;
	_sprite = is_undefined(_sprite) ? 0 : _sprite;
	_drawTo = is_undefined(_drawTo) ? UIDrawTo.Room : _drawTo;
	
	if(UIController.layerUI == noone)
	{
		with(UIController)
			event_perform(ev_other, ev_room_start);
	}
	
	var inst = instance_create_layer(0, 0, UIController.layerUI, ButtonUI);
	inst.xx = _x;
	inst.yy = _y;
	inst.sprite = _sprite;
	inst.drawTo = _drawTo;
	
	return inst;
}

///@function UICreateHealthbar(x(option), y(option), drawTo(option))

function UICreateHealthbar(_x, _y, _drawTo)
{
	_x = is_undefined(_x) ? 0 : _x;
	_y = is_undefined(_y) ? 0 : _y;
	_drawTo = is_undefined(_drawTo) ? UIDrawTo.Room : _drawTo;
	
	if(UIController.layerUI == noone)
	{
		with(UIController)
			event_perform(ev_other, ev_room_start);
	}
	
	var inst = instance_create_layer(0, 0, UIController.layerUI, HealthBarUI);
	inst.xx = _x;
	inst.yy = _y;
	inst.drawTo = _drawTo;
	
	return inst;
}

///@function UISetRect(UI, x, y, width, height, paddingX(option), paddingY(option))

function UISetRect(_UI, _x, _y, _width, _height, _padX, _padY)
{
	_padX = is_undefined(_padX) ? _UI.paddingX : _padX;
	_padY = is_undefined(_padY) ? _UI.paddingY : _padY;
	
	UISetPosition(_UI, _x, _y);
	UISetSize(_UI, _width, _height);
	UISetPadding(_UI, _padX, _padY);
}

///@function UISetPosition(UI, x, y)

function UISetPosition(_UI, _x, _y)
{
	_UI.xx = _x;
	_UI.yy = _y;
	
	var _elements = ds_queue_create();
	ds_queue_enqueue(_elements, _UI);
	
	while(ds_queue_size(_elements) > 0)
	{
		var _child = ds_queue_dequeue(_elements);
		for(var i=0; i<ds_list_size(_child.children); i++)
		{
			ds_queue_enqueue(_elements, _child.children[| i]);
		}
		with(_child)
			event_perform(ev_step, ev_step_end);
	}
	
	ds_queue_destroy(_elements);
}

///@function UISetSize(UI, width, height)

function UISetSize(_UI, _width, _height)
{
	_UI.width = _width;
	_UI.height = _height;
}

///@function UISetPadding(UI, paddingX, paddingY)

function UISetPadding(_UI, _padX, _padY)
{
	_UI.paddingX = _padX;
	_UI.paddingY = _padY;
}

///@function UISetParent(parent, child)

function UISetParent(_parent, _child)
{
	_child.parent = _parent;
	ds_list_add(_parent.children, _child);
}

///@function UIRemoveParent(child)

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

///@function UIDestroy(UI)

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

///@function UISetDepth(UI, depth)

function UISetDepth(_UIElement, _depth)
{
	_UIElement.sortDepth = _depth;
	UIController.sortFlag = true;
}

///@function UISetColor(UI, color)

function UISetColor(_UI, _color)
{
	_UI.color = _color;
}

///@function UISetAlpha(UI, alpha)

function UISetAlpha(_UI, _alpha)
{
	_UI.alpha = _alpha;
}

///@function UISetDrawTo(UI, drawTo)

function UISetDrawTo(_UI, _drawTo)
{
	_UI.drawTo = _drawTo;
}

///@function UISetView(UI, view)

function UISetView(_UI, _view)
{
	_UI.drawView = _view;
}

///@function UISetAlign(UI, alignH, alignV)

function UISetAlign(_UI, _alignH, _alignV)
{
	_UI.alignH = _alignH;
	_UI.alignV = _alignV;
}

///@function UISetNeighbours(UI, left(option), right(option), up(option), down(option))

function UISetNeighbours(_UI, _left, _right, _up, _down)
{
	_left = is_undefined(_left) ? _UI.UILeft : _left;
	_right = is_undefined(_right) ? _UI.UIRight : _right;
	_up = is_undefined(_up) ? _UI.UIUp : _up;
	_down = is_undefined(_down) ? _UI.UIDown : _down;
	
	_UI.UILeft = _left;
	_UI.UIRight = _right;
	_UI.UIUp = _up;
	_UI.UIDown = _down;
}

///@function UITextSet(UI, text)

function UITextSet(_UI, _text)
{
	_UI.text = _text;
}

///@function UITextSetAlign(UI, hAlign, vAlign)

function UITextSetAlign(_UI, _hAlign, _vAlign)
{
	_UI.textHAlign = _hAlign;
	_UI.textHAlign = _vAlign;
}

///@function UITextSetLineSep(UI, lineSep)

function UITextSetLineSep(_UI, _lineSep)
{
	_UI.lineSeperation = _lineSep;
}

///@function UIImageSetSprite(UI, sprite, subImage(option), stretched(option))

function UIImageSetSprite(_UI, _sprite, _sub, _stretched)
{
	_sub = is_undefined(_sub) ? _UI.subImage : _sub;
	_stretched = is_undefined(_stretched) ? _UI.stretched : _stretched;
	
	_UI.sprite = _sprite;
	_UI.subImage = _sub;
	_UI.stretched = _stretched;
}

///@function UIImageSetSubImage(UI, subImage)

function UIImageSetSubImage(_UI, _subImage)
{
	_UI.subImage = _subImage;
}

///@function UIHealthbarSetColor(UI, background, color1, color2)

function UIHealthbarSetColor(_UI, _color, _color1, _color2)
{
	_UI.color = _color;
	_UI.color1 = _color1;
	_UI.color2 = _color2;
}

///@function UIHealthbarSetValue(UI, value)

function UIHealthbarSetValue(_UI, _value)
{
	_UI.value = _value;
}

///@function UIGetMouseOver(UI)

function UIGetMouseOver(_UI)
{
	return _UI.isMouseOver;
}

///@function UIGetSelected(UI)

function UIGetSelected(_UI)
{
	return _UI.isSelected;
}

///@function UIGetPosX(UI)

function UIGetPosX(_UI)
{
	return _UI.xx;
}

///@function UIGetPosY(UI)

function UIGetPosY(_UI)
{
	return _UI.yy;
}

///@function UIGetWidth(UI)

function UIGetWidth(_UI)
{
	return _UI.width;
}

///@function UIGetHeight(UI)

function UIGetHeight(_UI)
{
	return _UI.height;
}

///@function UIGetColor(UI)

function UIGetColor(_UI)
{
	return _UI.color;
}

///@function UIGetAlpha(UI)

function UIGetAlpha(_UI)
{
	return _UI.alpha;
}

///@function UIGetParent(UI)

function UIGetParent(_UI)
{
	return _UI.parent;
}

///@function UIGetChildren(UI)

function UIGetChildren(_UI)
{
	return _UI.children;
}

///@function UIGetDepth(UI)

function UIGetDepth(_UI)
{
	return _UI.sortDepth;
}

///@function UIGetAlignH(UI)

function UIGetAlignH(_UI)
{
	return _UI.alignH;
}

///@function UIGetAlignV(UI)

function UIGetAlignV(_UI)
{
	return _UI.alignV;
}


///@function UIGetDrawTo(UI)

function UIGetDrawTo(_UI)
{
	return _UI.drawTo;
}

///@function UIGetView(UI)

function UIGetView(_UI)
{
	return _UI.drawView;
}

///@function UIForceSort(UI)

function UIForceSort()
{
	UIController.sortFlag = true;
}

///@function UITextGetText(UI)

function UITextGetText(_UI)
{
	return _UI.text;
}