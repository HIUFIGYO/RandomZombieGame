if(parent != noone)
{
	switch(align)
	{
		case RectAlign.None:
			x = parent.x + xx;
			y = parent.y + yy;
			break;
			
		case RectAlign.Horizontal:
			x = parent.x + parent.width/2 - width/2;
			y = parent.y + yy;
			break;
		
		case RectAlign.Verticle:
			x = parent.x + xx;
			y = parent.y + parent.height/2 - height/2;
			break;
			
		case RectAlign.Center:
			x = parent.x + parent.width/2 - width/2;
			y = parent.y + parent.height/2 - height/2;
			break;
	}
}
else
{
	x = xx;
	y = yy;
}