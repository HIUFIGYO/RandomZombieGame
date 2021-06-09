if(!isActive or drawTo != UIDrawTo.GUI or !global.drawUI)
	return;

draw_set_alpha(alpha);
draw_set_color(color);
draw_set_font(font);
draw_set_halign(textHAlign);
draw_set_valign(textVAlign);
draw_text_ext_transformed(x, y, text, lineSeperation, pixelSize.x, context.x / UIController.targetWidth, context.y / UIController.targetHeight, 0);
draw_set_alpha(1);