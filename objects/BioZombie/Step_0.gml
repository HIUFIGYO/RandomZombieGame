event_inherited();

ZombieAttack();

if (!isDead)
{
	var radAura = id;
	with(Player)
	{
		if(DistanceToObjectOffset(id, radAura, radAura.radRange, sprite_get_width(sprite_index)/2, 0))
		{
			DamagePlayer(id, radAura.radDamage * DeltaTimeSecond(), "Radiation");
			if random(1) <= SetStat(0.15, 0.3, 0.45, 0.6)
				DebuffApply(id, DeBuff.Radiation);
		}
	}
}