if(!other.isAcid or isDead)
	exit;
	
DebuffApply(id, DeBuff.Acid);
deBuffPlayerID = noone;
color = c_lime;
deBuffTimer[DeBuff.Acid] /= 2; 
other.dontDraw = true;
instance_destroy(other);