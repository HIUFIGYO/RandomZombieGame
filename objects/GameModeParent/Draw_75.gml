if(gameOverTimer <= 0) exit;

draw_set_color(c_black);
draw_set_alpha((gameOverTime - gameOverTimer) / gameOverTime);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);