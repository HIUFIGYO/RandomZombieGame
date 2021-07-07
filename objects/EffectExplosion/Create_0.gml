flash = PartEmitterCreate(ps_shape_ellipse, ps_distr_gaussian);
blast = PartEmitterCreate(ps_shape_ellipse, ps_distr_gaussian);
debris = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);
smoke = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);

flash.AddRegionSqr(8);
blast.AddRegionSqr(32);
debris.AddRegionSqr(8);
smoke.AddRegionSqr(8);

PartEmitBurst(flash, PartType.ExplosionFlash, 1);
PartEmitBurst(blast, PartType.ExplosionBlast, 50);
PartEmitBurst(debris, PartType.ExplosionDebris, 50);
PartEmitBurst(smoke, PartType.ExplosionSmoke, 10);

alarm[0] = 120;