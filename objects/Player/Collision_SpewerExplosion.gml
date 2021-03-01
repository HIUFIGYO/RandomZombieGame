var _damage = SetStat(5, 10, 16, 23);

if(armour > 0)
	DamagePlayerArmour(id, _damage * 2);
else
	DamagePlayer(id, _damage, "Zombie", "Spewer");
	

if (random(1) <= SetStat(0.25, 0.5,  0.75, 1))
	DebuffApply(id, DeBuff.Acid);