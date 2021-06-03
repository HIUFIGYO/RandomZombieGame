/// @description Auto-Align
var autoPos, autoSize;

if(parent != noone)
{
	autoPos = parent.position;
	autoSize = parent.size;
}
else
{
	autoPos = new Vector2(0, 0);
	if(drawTo == UIDrawTo.GUI)
	{
		autoSize = new Vector2(Window.width, Window.height);
	}
	else if(drawTo == UIDrawTo.ViewPort or drawTo == UIDrawTo.ViewPortRoom)
	{
		autoSize = new Vector2(view_wport[drawView], view_hport[drawView]);
	}
	else
	{
		autoSize = new Vector2(room_width, room_height);
	}
}

//auto align
switch(alignH)
{
	case RectAlign.Left:
		x = autoPos.x + position.x;
		break;
			
	case RectAlign.Center:
		x = autoPos.x + autoSize.x/2 - size.x/2;
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
		y = autoPos.y + autoSize.y/2 - size.y/2;
		break;
		
	case RectAlign.Bottom:
		y = autoPos.y + autoSize.y - position.y - size.y;
		break;
		
	default:
		y = 0;
		break;
}

if(ds_list_size(children) > 0)
{
	for(var i=0; i<ds_list_size(children); i++)
	{
		UIDirty(children[| i]);
	}
}