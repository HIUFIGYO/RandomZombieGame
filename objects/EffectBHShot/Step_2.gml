if(follow == noone)
	return;

x = follow.x;
y = follow.y;

bullet.TranslateRegion(x, y);
center.TranslateRegion(x, y);
trail.TranslateRegion(x, y);
particles.TranslateRegion(x, y);

PartEmitStream(bullet, PartType.BHBullet, 1);
PartEmitStream(center, PartType.BHCenter, 1);
PartEmitStream(trail, PartType.BHTrail, 1);
PartEmitStream(particles, PartType.BHParticles, 5);