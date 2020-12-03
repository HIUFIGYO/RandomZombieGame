draw_self();
if(Debugger.isDebugging)
{
	draw_set_color(Debugger.color);
	draw_line(xprevious, yprevious, x, y);
}