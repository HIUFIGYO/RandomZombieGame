if(!other.isAcid)
	exit;

var _damage = SetStat(0, 1, 2, 4);

if(armour > 0)
	DamagePlayerArmour(id, _damage * 2);
else
	DamagePlayer(id, _damage, "Acid");
	
DebuffApply(id, DeBuff.Acid);
other.dontDraw = true;
instance_destroy(other);