if(!debug_mode or drawTo != UIDrawTo.GUI) exit;

draw_set_color(Debugger.color);
draw_rectangle(x, y, width, height, true);