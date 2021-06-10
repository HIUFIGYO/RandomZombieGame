/// @description Auto-Align

var autoPos, autoSize;

//get context
switch(drawTo)
{
	case UIDrawTo.ViewPortRoom:
	case UIDrawTo.ViewPort:
		//context.Set(view_wport[drawView], view_hport[drawView]);
		context.Set(Window.width, Window.height);
		autoSize = new Vector2(view_wport[drawView] / Window.width, view_hport[drawView] / Window.height);
		break;
		
	case UIDrawTo.Room:
		context.Set(room_width, room_height);
		break;
		
	default:
		context.Set(Window.width, Window.height);
		break;
}

if(parent != noone)
{
	autoPos = parent.parentPosition;
	autoSize = UIGetSize(parent);
}
else
{
	autoPos = new Vector2(0, 0);
	autoSize = new Vector2(1, 1);
}

//auto align
switch(alignH)
{
	case RectAlign.Left:
		x = autoPos.x + position.x;
		break;
			
	case RectAlign.Center:
		x = autoPos.x + autoSize.x/2 - size.x/2 + position.x;
		break;
		
	case RectAlign.Right:
		x = autoPos.x + autoSize.x - position.x - size.x;
		break;
		
	default:
		x = 0;
		break;
}

switch(alignV)
{
	case RectAlign.Top:
		y = autoPos.y + position.y;
		break;
			
	case RectAlign.Center:
		y = autoPos.y + autoSize.y/2 - size.y/2 + position.x;
		break;
		
	case RectAlign.Bottom:
		y = autoPos.y + autoSize.y - position.y - size.y;
		break;
		
	default:
		y = 0;
		break;
}

parentPosition.Set(x, y);

x *= context.x;
y *= context.y;

pixelSize.Set(size.x * context.x, size.y * context.y);

if(ds_list_size(children) > 0)
{
	for(var i=0; i<ds_list_size(children); i++)
	{
		UIDirty(children[| i]);
	}
}