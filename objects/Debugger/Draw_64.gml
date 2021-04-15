if(!fpsToggle)
	return;

if(abs(fps_real - deltaFPS) >= 100)
	deltaFPS = fps_real;
	
if(fps_real < 100)
	deltaFPS = fps_real;

draw_set_color(color);
draw_text(16, 128, "FPS: " + string(deltaFPS));