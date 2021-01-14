draw_self();

//draw laser
draw_set_color(laserColor);
draw_line(x + xoffSet * image_xscale, y - yoffSet, laserX, y - yoffSet);