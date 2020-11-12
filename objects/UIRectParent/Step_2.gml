var autoX = 0, autoY = 0, autoW, autoH;

if(parent != noone)
{
	autoX = parent.x;
	autoY = parent.y;
	autoW = parent.width;
	autoH = parent.height;
}
else
{
	if(drawTo == UIDrawTo.GUI)
	{
		autoW = display_get_gui_width();
		autoH = display_get_gui_height();
	}
	else if(drawTo == UIDrawTo.ViewPort or drawTo == UIDrawTo.ViewPortRoom)
	{
		autoW = view_wport[drawView];
		autoH = view_hport[drawView];
	}
	else
	{
		autoW = room_width;
		autoH = room_height;
	}
}

//auto align
switch(alignH)
{
	case RectAlign.Left:
		x = autoX + xx + paddingX;
		break;
			
	case RectAlign.Center:
		x = autoX + autoW/2 - width/2 + paddingX;
		break;
		
	case RectAlign.Right:
		x = autoX + autoW + xx - width - paddingX;
		break;
		
	default:
		x = 0;
		break;
}

switch(alignV)
{
	case RectAlign.Top:
		y = autoY + yy + paddingY;
		break;
			
	case RectAlign.Center:
		y = autoY + autoH/2 - height/2 + paddingY;
		break;
		
	case RectAlign.Bottom:
		y = autoY + autoH + xx - height - paddingY;
		break;
		
	default:
		y = 0;
		break;
}