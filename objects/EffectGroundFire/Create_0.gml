follow = noone;

flame = PartEmitterCreate(ps_shape_rectangle, ps_distr_gaussian);
firePit = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);
smoke = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);
spark = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);

flame.AddRegionSqr(8);
firePit.AddRegionSqr(8);
smoke.AddRegionSqr(8);
spark.AddRegionSqr(8);