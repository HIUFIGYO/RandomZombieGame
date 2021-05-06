/// @description Took Damage

event_inherited();

if(isDead)
{
	ShopMajorThreatDefeated();
	CreateExplosion(id, noone, ExplosionType.Grenade);
	CreateGroundFire(noone, x, y - 32, 6);
	
	if(ZombieIsOnlyMajorThreat())
		AudioEndBoss();
}