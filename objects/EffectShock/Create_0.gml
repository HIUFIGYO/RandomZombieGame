shock = PartEmitterCreate(ps_shape_ellipse, ps_distr_gaussian);
spark1 = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);
spark2 = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);

shock.SetRegion(x-32, x+32, y-64, y+64);
spark1.SetRegion(x-32, x+32, y-64, y+64);
spark2.SetRegion(x-32, x+32, y-64, y+64);

PartEmitBurst(shock, PartType.ShockShock, 20);
PartEmitBurst(spark1, PartType.ShockSpark1, 32);
PartEmitBurst(spark2, PartType.ShockSpark2, 20);

alarm[0] = 120;