lifeTimer = 3

emitter = PartCreateEmitter(0, ps_shape_ellipse, ps_distr_linear);
emitter2 = PartCreateEmitter(0, ps_shape_ellipse, ps_distr_invgaussian);

force = 10;
pullRadius = 2 * global.worldUnit;//radius in world units