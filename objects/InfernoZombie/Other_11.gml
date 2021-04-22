/// @description Took Damage

event_inherited();

if(isDead)
{
	CreateExplosion(id, noone, ExplosionType.Grenade);
	CreateGroundFire(noone, x, y - 32, 6);
}