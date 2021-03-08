var _damage = SetStat(2, 5, 9, 14);

if(armour > 0)
	DamagePlayerArmour(id, _damage * 2);
else
	DamagePlayer(id, _damage, "Zombie", "Spewer");
	

if (random(1) <= SetStat(0.05, 0.1, 0.15, 0.25))
	DebuffApply(id, DeBuff.Acid);