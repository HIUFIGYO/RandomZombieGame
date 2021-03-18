ds_list_destroy(targetsHit);

if(weapon == Weapon.Rocket or weapon == Weapon.Acid)
	CreateExplosion(id, playerID, weapon);
	
if(weapon == Weapon.BHDarker)
{
	instance_create_layer(x, y, GameManager.layerObject, BlackHole);
}