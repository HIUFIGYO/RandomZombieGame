if (!isDead) and (random(1) <= SetStat(0.25, 0.5,  0.75, 1))
{
	DebuffApply(id, DeBuff.Acid);
	deBuffPlayerID = noone;
	color = c_lime;
	deBuffTimer[DeBuff.Acid] /= 2; 
	other.dontDraw = true;
	instance_destroy(other);
}