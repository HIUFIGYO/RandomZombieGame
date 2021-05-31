///@function BursterSpikeCollidePlayer(player)

function BursterSpikeCollidePlayer(_player)
{
	DamagePlayer(_player, damage, "Zombie", "Burster");
	if _player.armour <= 0 and (random(1) <= SetStat(0.2, 0.3, 0.4, 0.5))
		DebuffApply(_player,DeBuff.Bleed)
	instance_destroy();
}

///@function BursterSpikeCollideBarricade(barricade)

function BursterSpikeCollideBarricade(_barricade)
{
	if(!_barricade.canCollideZombie)
		return;
		
	DamageSupport(_barricade, damage);
	instance_destroy();
}

///@function InfernoFireCollidePlayer(player)

function InfernoFireCollidePlayer(_player)
{
	if(IsDead(_player))
		return;
	
	DamagePlayer(_player, damage, "Zombie", "Inferno");
	if (random(1) <= SetStat(0.2, 0.4, 0.6, 0.8))
		DebuffApply(_player, DeBuff.Ignite);
	instance_destroy();
}

///@function InfernoFireCollideBarricade(barricade)

function InfernoFireCollideBarricade(_barricade)
{
	if(!_barricade.canCollideZombie)
		return;
		
	DamageSupport(_barricade, damage);
	instance_destroy();
}

///@function InfernoFireCollideZombie(zombie)

function InfernoFireCollideZombie(_zombie)
{
	if(IsDead(_zombie)or _zombie.name == "Inferno")
		return;
	
	if(!CheckDebuff(_zombie, DeBuff.Ignite) and (random(1) <= SetStat(0.2, 0.4, 0.6, 0.8)))
		DebuffApply(_zombie, DeBuff.Ignite, noone);
}

///@function SpewerExplosionCollidePlayer(player)

function SpewerExplosionCollidePlayer(_player)
{
	if(_player.armour > 0)
		DamagePlayerArmour(_player, damage * 2);
	else
		DamagePlayer(_player, damage, "Zombie", "Spewer");
	

	if (random(1) <= SetStat(0.05, 0.1, 0.15, 0.25))
		DebuffApply(_player, DeBuff.Acid);
}

///@function SpewerExplosionCollideBarricade(barricade)

function SpewerExplosionCollideBarricade(_barricade)
{
	if(!_barricade.canCollideZombie)
		return;
		
	DamageSupport(_barricade, damage);
}

///@function SpewerExplosionCollideZombie(zombie)

function SpewerExplosionCollideZombie(_zombie)
{
	if (!IsDead(_zombie))
	{
		instance_destroy();
		
		if(_zombie.name == "Lard" or _zombie.name == "Spewer")
			return;
		
		if(random(1) <= SetStat(0.25, 0.5,  0.75, 1))
			DebuffApply(_zombie, DeBuff.Acid, noone);
	}
}

///@function SpewerShotCollidePlayer(player)

function SpewerShotCollidePlayer(_player)
{
	DamagePlayer(_player, damage, "Zombie", "Spewer");

	if (random(1) <= SetStat(0.25, 0.5,  0.75, 1))
		DebuffApply(_player, DeBuff.Acid);
	
	instance_destroy();
}

///@function SpewerShotCollideBarricade(barricade)

function SpewerShotCollideBarricade(_barricade)
{
	if(!_barricade.canCollideZombie)
		return;
		
	DamageSupport(_barricade, damage);
	instance_destroy();
}