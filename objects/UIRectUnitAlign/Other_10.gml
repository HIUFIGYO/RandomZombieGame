/// @description Auto Align

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
		autoW = Window.width;
		autoH = Window.height;
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

x = unitX * autoW;
y = unitY * autoH;

if(ds_list_size(children) > 0)
{
	for(var i=0; i<ds_list_size(children); i++)
	{
		with(children[| i])
			event_perform(ev_other, ev_user0);
	}
}