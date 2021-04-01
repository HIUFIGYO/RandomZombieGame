if(!other.isAcid or isDead)
	exit;
	
DebuffApply(id, DeBuff.Acid, noone);
other.dontDraw = true;
instance_destroy(other);