follow = noone;

bullet = PartEmitterCreate(ps_shape_ellipse, ps_distr_gaussian);
center = PartEmitterCreate(ps_shape_ellipse, ps_distr_gaussian);
trail = PartEmitterCreate(ps_shape_ellipse, ps_distr_gaussian);
particles = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);

bullet.AddRegionSqr(1);
center.AddRegionSqr(1);
trail.AddRegionSqr(1);
particles.AddRegionSqr(8);