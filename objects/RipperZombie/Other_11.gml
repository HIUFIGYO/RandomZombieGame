///@desc Took Damage

event_inherited();

if(isDead)
{
	ShopMajorThreatDefeated();
	
	if(ZombieIsOnlyMajorThreat())
		AudioEndBoss();
}