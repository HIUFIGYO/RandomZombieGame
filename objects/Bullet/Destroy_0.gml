ds_list_destroy(targetsHit);

if(weapon == Weapon.Rocket)
	CreateExplosion(id, playerID, ExplosionType.Rocket);
else if(weapon == Weapon.Acid)
	CreateExplosion(id, playerID, ExplosionType.Acid);
else if(weapon == Weapon.Tesla)
{
	instance_destroy(effect);
	TeslaDealDamage();
}
else if(weapon == Weapon.Flame)
	instance_destroy(effect);