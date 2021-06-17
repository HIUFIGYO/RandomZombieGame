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

///@function UICreateText(x, y, text, drawTo)

function UICreateText(_x, _y, _text, _drawTo)
{	
	if(UIController.layerUI == noone)
	{
		with(UIController)
			event_perform(ev_other, ev_room_start);
	}
	
	var inst = instance_create_layer(0, 0, UIController.layerUI, TextUI);
	UISetPosition(inst, _x, _y);
	if(string_length(_text) > 0)
		UISetSize(inst, string_width(_text), string_height(_text));
	inst.text = _text;
	inst.drawTo = _drawTo;
	
	return inst;
}

///@function UICreateImage(x, y, sprite, drawTo)

function UICreateImage(_x, _y, _sprite, _drawTo)
{	
	if(UIController.layerUI == noone)
	{
		with(UIController)
			event_perform(ev_other, ev_room_start);
	}
	
	var inst = instance_create_layer(0, 0, UIController.layerUI, ImageUI);
	UISetPosition(inst, _x, _y);
	inst.sprite = _sprite;
	inst.drawTo = _drawTo;
	if(_sprite != noone)
	{
		UISetSize(inst, sprite_get_width(_sprite), sprite_get_height(_sprite));
	}
	
	return inst;
}

///@function UICreateButton(x, y, sprite, drawTo)

function UICreateButton(_x, _y, _sprite, _drawTo)
{	
	if(UIController.layerUI == noone)
	{
		with(UIController)
			event_perform(ev_other, ev_room_start);
	}
	
	var inst = instance_create_layer(0, 0, UIController.layerUI, ButtonUI);
	UISetPosition(inst, _x, _y);
	inst.sprite = _sprite;
	inst.drawTo = _drawTo;
	
	return inst;
}

///@function UICreateHealthbar(x, y, drawTo)

function UICreateHealthbar(_x, _y, _drawTo)
{	
	if(UIController.layerUI == noone)
	{
		with(UIController)
			event_perform(ev_other, ev_room_start);
	}
	
	var inst = instance_create_layer(0, 0, UIController.layerUI, HealthBarUI);
	UISetPosition(inst, _x, _y);
	inst.drawTo = _drawTo;
	
	return inst;
}

///@function UISetRect(UI, x, y, width, height)

function UISetRect(_UI, _x, _y, _width, _height)
{	
	UISetPosition(_UI, _x, _y);
	UISetSize(_UI, _width, _height);
}

///@function UISetPosition(UI, x, y)

function UISetPosition(_UI, _x, _y)
{
	var xx = (_x / UIController.targetWidth),
		yy = (_y / UIController.targetHeight);
	_UI.position.Set(xx, yy);
	
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
			UIDirty(_child);
	}
	
	ds_queue_destroy(_elements);
	_UI.alignFlag = true;
}

///@function UISetSize(UI, width, height)

function UISetSize(_UI, _width, _height)
{
	var w = (_width / UIController.targetWidth),
		h = (_height / UIController.targetHeight);
	_UI.size.Set(w, h);
	_UI.alignFlag = true;
}

///@function UISetParent(parent, child)

function UISetParent(_parent, _child)
{
	_child.parent = _parent;
	ds_list_add(_parent.children, _child);
	_child.alignFlag = true;
}

///@function UIRemoveParent(child)

function UIRemoveParent(_child)
{
	if(_child.parent != noone)
	{
		_UI.alignFlag = true;
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

///@function UISetActive(UI, active)

function UISetActive(_UI, _active)
{
	_UI.isActive = _active;
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
	_UI.alignFlag = true;
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
	_UI.alignFlag = true;
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
	_UI.textVAlign = _vAlign;
}

///@function UITextSetLineSep(UI, lineSep)

function UITextSetLineSep(_UI, _lineSep)
{
	_UI.lineSeperation = _lineSep;
}

///@function UIImageSetSprite(UI, sprite, subImage, stretched)

function UIImageSetSprite(_UI, _sprite, _sub, _stretched)
{	
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

///@function UIButtonSetHook(UI, hook)

function UIButtonSetHook(_UI, _hook)
{
	_UI.hook = _hook;
}

///@function UIGetSelected(UI)

function UIGetSelected(_UI)
{
	return _UI.isSelected;
}

///@function UIGetPosition(UI)

function UIGetPosition(_UI)
{
	return _UI.position;
}

///@function UIGetSize(UI)

function UIGetSize(_UI)
{
	return _UI.size;
}

///@function UIGetPixelPosition(UI)

function UIGetPixelPosition(_UI)
{
	return new Vector2(_UI.x, _UI.y);
}

///@function UIGetPixelSize(UI)

function UIGetPixelSize(_UI)
{
	return _UI.pixelSize;
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

///@function UIDirty(UI)

function UIDirty(_UI)
{
	_UI.alignFlag = true;
	UIController.sortFlag = true;
}

///@function UITextGetText(UI)

function UITextGetText(_UI)
{
	return _UI.text;
}

///@function UIMouseHover(UI)

function UIMouseHover(_UI)
{
	var mouseX = -1, mouseY = -1;
	switch(_UI.drawTo)
	{
		case UIDrawTo.GUI:
			mouseX = device_mouse_x_to_gui(0);
			mouseY = device_mouse_y_to_gui(0);
			break;
		case UIDrawTo.Room:
			mouseX = mouse_x;
			mouseY = mouse_y;
			break;
		case UIDrawTo.ViewPort:
			mouseX = window_view_mouse_get_x(_UI.drawView);
			mouseY = window_view_mouse_get_y(_UI.drawView);
			break;
		case UIDrawTo.ViewPortRoom:
			if(view_current == _UI.drawView)
			{
				mouseX = mouse_x;
				mouseY = mouse_y;
			}
			break;
	}

	return(point_in_rectangle(mouseX, mouseY, _UI.x, _UI.y, _UI.x+_UI.pixelSize.x, _UI.y+_UI.pixelSize.y));
}