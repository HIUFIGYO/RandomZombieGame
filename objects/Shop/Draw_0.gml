draw_self();

draw_sprite(spr_shopOpenClosed, shopMaskIndex, x, y);

if(isOpen)
	return;
	
draw_set_color(c_red);
draw_circle(xstart, ystart + 48, extractRadius, true);