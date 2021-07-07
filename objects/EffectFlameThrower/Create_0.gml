follow = noone;

ball = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);
beam = PartEmitterCreate(ps_shape_line, ps_distr_linear);
spark = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);

ball.AddRegionSqr(6);
spark.AddRegionSqr(8);