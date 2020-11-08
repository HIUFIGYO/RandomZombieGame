if(drawTo != UIDrawTo.GUI or !global.drawUI){ exit; }

draw_set_alpha(alpha);
draw_set_color(color);
draw_set_font(font);
draw_set_halign(textHAlign);
draw_set_valign(textVAlign);
draw_text(x, y, text);