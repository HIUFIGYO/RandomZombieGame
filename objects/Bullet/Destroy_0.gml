ds_list_destroy(targetsHit);

if(weapon == Weapon.Rocket)
	CreateExplosion(id, playerID, ExplosionType.Rocket);
else if(weapon == Weapon.Acid)
	CreateExplosion(id, playerID, ExplosionType.Acid);