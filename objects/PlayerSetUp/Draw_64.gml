//draw cross

var W = Window.width,
	H = Window.height,
	lineW = (W / UIController.targetWidth) * 4;

draw_line_width_color(W/2, 0, W/2, H, lineW, c_orange, c_yellow);
draw_line_width_color(0, H/2, W, H/2, lineW, c_orange, c_yellow);

draw_text(16, 16, nameString);