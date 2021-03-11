if(random(1) <= SetStat(0.25, 0.5,  0.75, 1)and ripperID != noone)
{
	DebuffApply(ripperID, DeBuff.Acid);
	ripperID.deBuffPlayerID = noone;
	ripperID.color = c_lime;
	ripperID.deBuffTimer[DeBuff.Acid] /= 2; 
	other.dontDraw = true;
	instance_destroy(other);
}