if(!Debugger.isDebugging or drawTo != UIDrawTo.GUI) exit;

draw_set_color(Debugger.color);
draw_rectangle(x, y, x+width, y+height, true);