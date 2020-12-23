if(!Debugger.isDebugging) exit;

draw_set_alpha(1);
draw_set_color(Debugger.color);
for(var i=0; i<ds_list_size(connectedNodes); i++)
	draw_line(x, y, connectedNodes[| i].x, connectedNodes[| i].y);