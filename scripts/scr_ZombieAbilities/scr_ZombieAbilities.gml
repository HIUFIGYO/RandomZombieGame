///@function BioZombieRadiationAura()

function BioZombieRadiationAura()
{
	if(IsDead(id))
		return;
		
	radTimer += DeltaTimeSecond();

	if (radTimer < radTime)
		return;
		
	radTimer = 0;
		
	CollisionCirleList(x, y, radRange, Player, BioZombieAuraCollisionPlayer);
	CollisionCirleList(x, y, radRange, ZombieParent, BioZombieAuraCollisionZombie);
}

///@function BioZombieAuraCollisionPlayer(player)

function BioZombieAuraCollisionPlayer(_player)
{
	DamagePlayer(_player, radDamage * radTime, "Radiation");
	if random(1) <= SetStat(0.15, 0.3, 0.45, 0.6)
		DebuffApply(_player, DeBuff.Radiation);
}

///@function BioZombieAuraCollisionZombie(zombie)

function BioZombieAuraCollisionZombie(_zombie)
{
	if(_zombie.name == "Bio Zombie")
		return;
	
	HealZombie(_zombie, radDamage * radTime);
	if random(1) <= SetStat(0.15, 0.3, 0.45, 0.6)
		DebuffApply(_zombie, DeBuff.Radiation, noone);
}