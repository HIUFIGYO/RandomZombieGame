blood = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);
mist = PartEmitterCreate(ps_shape_rectangle, ps_distr_linear);

blood.AddRegionSqr(8);
mist.AddRegionSqr(8);

PartEmitBurst(blood, PartType.BloodBlood, 20);
PartEmitBurst(mist, PartType.BloodMist, 5);

alarm[0] = 120;