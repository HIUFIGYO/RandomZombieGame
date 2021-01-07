if(dontDraw)
	exit;

surface_set_target(BloodGrinder.bloodSurf);
draw_self();
surface_reset_target();