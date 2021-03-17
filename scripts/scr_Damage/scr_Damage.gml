///@function DamageInit()

function DamageInit()
{
	instID = noone;
	isPlayer = false;
	isAcid = false;
	damage = 0;
}

///@function DamageApply(instance)

function DamageApply(inst)
{
	if(isPlayer)
		DamageZombie(inst, instID, damage, false);
	else
		DamagePlayer(inst, damage, "lolz", "zambie");
}


