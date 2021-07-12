follow = noone;

shield = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);
center = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);

shield.AddRegionSqr(1);
center.AddRegionSqr(1);