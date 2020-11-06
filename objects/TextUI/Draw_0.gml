if(drawTo == UIDrawTo.GUI) { exit; }

draw_set_alpha(alpha);
draw_set_color(color);
draw_set_font(font);
draw_set_halign(textHAlign);
draw_set_valign(textVAlign);

if(drawTo == UIDrawTo.Room)
{
	draw_text_ext(x, y, text, lineSeperation, width);
}
else if(drawTo == UIDrawTo.ViewPort)
{
	if(view_current == drawView)
		draw_text_ext(view_xport[drawView] + x, view_yport[drawView] + y, text, lineSeperation, width);
}
else
{
	if(view_current == drawView)
		draw_text_ext(x, y, text, lineSeperation, width);
}