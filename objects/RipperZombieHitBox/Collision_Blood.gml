if(!other.isAcid or ripperID == noone)
	exit;
	
DebuffApply(ripperID, DeBuff.Acid);
ripperID.deBuffPlayerID = noone;
ripperID.color = c_lime;
ripperID.deBuffTimer[DeBuff.Acid] /= 2; 
other.dontDraw = true;
instance_destroy(other);