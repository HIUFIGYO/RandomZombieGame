/// @description Auto-Align
var autoPos, autoSize;

context.Set(Window.width, Window.height);

//switch(drawTo)
//{	
//	case UIDrawTo.ViewPort:
//		contextPos.Set(view_wport[drawView], view_hport[drawView]);
//		break;
		
//	case UIDrawTo.Room:
//		context.Set(room_width, room_height);
//		contextPos.Set(room_width, room_height);
//		break;
//}

autoSize = new Vector2(context.x / UIController.targetWidth, context.y / UIController.targetHeight);
if(parent != noone)
{
	autoPos = parent.position;
	//context.Set(UIGetPixelSize(parent).x, UIGetPixelSize(parent).y);
}
else
	autoPos = new Vector2(0, 0);

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

x *= context.x;
y *= context.y;

pixelPosition.Set(x, y);
pixelSize.Set(size.x * context.x, size.y * context.y);

if(ds_list_size(children) > 0)
{
	for(var i=0; i<ds_list_size(children); i++)
	{
		UIDirty(children[| i]);
	}
}