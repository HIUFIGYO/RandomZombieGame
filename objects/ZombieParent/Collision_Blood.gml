if(!other.isAcid or isDead)
	exit;
	
DebuffApply(id, DeBuff.Acid);
other.dontDraw = true;
instance_destroy(other);