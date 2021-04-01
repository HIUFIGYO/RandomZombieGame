if (!isDead) and (random(1) <= SetStat(0.25, 0.5,  0.75, 1))
{
	DebuffApply(id, DeBuff.Acid, noone);
	instance_destroy(other);
}