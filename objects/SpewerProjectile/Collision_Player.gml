DamagePlayer(other, damage, "Zombie", "Spewer");

if (random(1) <= SetStat(0.25, 0.5,  0.75, 1))
	DebuffApply(other, DeBuff.Acid);
	
instance_destroy();