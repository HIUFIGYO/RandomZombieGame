follow = noone;

electricity = PartEmitterCreate(ps_shape_ellipse, ps_distr_gaussian);
spark = PartEmitterCreate(ps_shape_ellipse, ps_distr_gaussian);
trail = PartEmitterCreate(ps_shape_ellipse, ps_distr_gaussian);

electricity.AddRegionSqr(8);
spark.AddRegionSqr(8);
trail.AddRegionSqr(8);