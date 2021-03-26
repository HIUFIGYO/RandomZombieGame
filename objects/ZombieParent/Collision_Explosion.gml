if(!other.acid or isDead)
	exit;
	
DebuffApply(id, DeBuff.Acid);
deBuffPlayerID = other.playerID;
color = c_lime;
deBuffTimer[DeBuff.Acid] /= 2; 