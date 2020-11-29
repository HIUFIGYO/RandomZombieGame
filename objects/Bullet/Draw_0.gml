draw_self();
if(Debugger.isDebugging)
{
	draw_set_color(c_lime);
	draw_line(xprevious, yprevious, x, y);
}