/// @description Auto-Align

var autoPos, autoSize;

if(parent != noone)
{
	autoPos = parent.parentPosition;
	autoSize = UIGetSize(parent);
}
else
{
	autoPos = new Vector2(0, 0);
	autoSize = new Vector2(1, 1);
	if(drawTo == UIDrawTo.ViewPort or drawTo == UIDrawTo.ViewPortRoom)
	{
		autoSize.Set(view_wport[drawView] / Window.width, view_hport[drawView] / Window.height);
	}
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
		y = autoPos.y + autoSize.y/2 - size.y/2 + position.y;
		break;
		
	case RectAlign.Bottom:
		y = autoPos.y + autoSize.y - position.y - size.y;
		break;
		
	default:
		y = 0;
		break;
}

parentPosition.Set(x, y);

x *= Window.width;
y *= Window.height;

pixelSize.Set(size.x * Window.width, size.y * Window.height);

if(ds_list_size(children) > 0)
{
	for(var i=0; i<ds_list_size(children); i++)
	{
		with(children[| i])
			event_perform(ev_other, ev_user0);
	}
}