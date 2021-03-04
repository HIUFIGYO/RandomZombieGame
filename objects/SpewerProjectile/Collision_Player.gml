DamagePlayer(other, damage, "Zombie", "Spewer");

if (random(1) <= SetStat(0.5, 0.10,  0.15, 0.2))
	DebuffApply(other, DeBuff.Acid);
	
instance_destroy();