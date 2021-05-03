if(!other.isAcid or isDead or GameManager.gamePaused)
	return;
	
DebuffApply(id, DeBuff.Acid, noone);
other.dontDraw = true;
instance_destroy(other);