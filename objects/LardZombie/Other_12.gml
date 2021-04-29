/// @description Random Change

if(random(1) > SetStat(0, 0.01, 0.02, 0.04))
	return;
	
var _zombieMorph = choose(LimperZombie, RabidZombie,
						GrappleZombie, GhostZombie, BursterZombie,
						TwitcherZombie, SpewerZombie, InjectorZombie,
						BladeZombie, StrayCreeperZombie, BioZombie);
instance_change(_zombieMorph, true);