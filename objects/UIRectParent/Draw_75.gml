if(!Debugger.isDebugging or drawTo != UIDrawTo.GUI)
	return;

draw_set_color(Debugger.color);
draw_rectangle(x, y, x+pixelSize.x, y+pixelSize.y, true);